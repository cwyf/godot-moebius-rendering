shader_type spatial;
render_mode unshaded, fog_disabled, cull_disabled, depth_draw_never, depth_test_disabled;

uniform sampler2D screen_tex : hint_screen_texture, repeat_disable, filter_nearest;
uniform sampler2D depth_tex : hint_depth_texture, repeat_disable, filter_nearest;
uniform sampler2D normal_tex : hint_normal_roughness_texture, repeat_disable, filter_nearest;
global uniform vec2 ink_distance_range;
global uniform float ink_far_scale;

uniform bool depth_lines = true;
uniform bool normal_lines = true;
uniform bool hatching = false;
uniform bool paper_color = false;
uniform bool line_noise = false; // Compatibility only: geometry buffers are never UV-warped.
uniform float radius_px = 1.0;
uniform float depth_threshold = 0.045;
uniform float normal_threshold = 1.65;
uniform float hatch_strength = 0.12;
uniform float noise_px = 1.05;
uniform vec4 ink : source_color = vec4(0.26, 0.19, 0.23, 1.0);

void vertex() { POSITION = vec4(VERTEX.xy, 1.0, 1.0); }
float hash(vec2 p) { return fract(sin(dot(p, vec2(127.1,311.7))) * 43758.5453); }
vec3 view_pos(vec2 uv, float d, mat4 inv_projection) {
    vec4 p = inv_projection * vec4(uv * 2.0 - 1.0, d, 1.0);
    return p.xyz / p.w;
}
float line_pattern(float t) {
    float w = max(fwidth(t), 0.015);
    float d = abs(fract(t) - 0.5);
    return 1.0 - smoothstep(0.055, 0.055 + w, d);
}
// Stable one-texel detector. Distance changes edge coverage, not sampling radius.
float ink_at(vec2 center, vec2 px, mat4 inv_projection) {
    float z[9];
    vec3 n[9];
    vec3 positions[9];
    for (int y = 0; y < 3; y++) {
        for (int x = 0; x < 3; x++) {
        int i = y * 3 + x;
        vec2 q = clamp(center + vec2(float(x-1),float(y-1)) * px * radius_px, px, vec2(1.0)-px);
        q = (floor(q / px) + vec2(0.5)) * px;
        float d = textureLod(depth_tex, q, 0.0).r;
        positions[i] = view_pos(q, max(d, 0.000001), inv_projection);
        z[i] = log(max(-positions[i].z, 0.1));
        n[i] = textureLod(normal_tex, q, 0.0).xyz * 2.0 - 1.0;
        }
    }
    float dx = -z[0]+z[2]-2.0*z[3]+2.0*z[5]-z[6]+z[8];
    float dy = -z[0]-2.0*z[1]-z[2]+z[6]+2.0*z[7]+z[8];
    vec3 nx = -n[0]+n[2]-2.0*n[3]+2.0*n[5]-n[6]+n[8];
    vec3 ny = -n[0]-2.0*n[1]-n[2]+n[6]+2.0*n[7]+n[8];
    float de = smoothstep(depth_threshold, depth_threshold * 2.5, length(vec2(dx,dy)));
    // Perspective depth slope alone is not a silhouette. A neighbor on the
    // same geometric plane has almost zero point-to-plane residual even
    // when its view-space Z differs strongly on a grazing floor.
    vec3 plane_normal = normalize(n[4] + vec3(0.000001));
    float residual = 0.0;
    for (int i=0; i<9; i++) {
        residual = max(residual, abs(dot(positions[i]-positions[4],plane_normal)));
    }
    float relative_residual = residual / max(-positions[4].z,1.0);
    de *= smoothstep(0.0015,0.006,relative_residual);
    float ne = smoothstep(normal_threshold, normal_threshold * 1.8, sqrt(dot(nx,nx)+dot(ny,ny)));
    float foreground_z=z[4];
    float foreground_distance=-positions[4].z;
    for (int i=0;i<9;i++) {
        foreground_z=min(foreground_z,z[i]);
        foreground_distance=min(foreground_distance,-positions[i].z);
    }
    float distance_t=smoothstep(ink_distance_range.x,ink_distance_range.y,max(foreground_distance,0.0));
    // Far silhouettes use only the foreground-side pixel, avoiding the double
    // band. Subpixel apparent widths use coverage; do not quantize depth taps.
    float background_side=smoothstep(depth_threshold*0.45,depth_threshold*1.4,z[4]-foreground_z);
    de *= mix(1.0,1.0-background_side,distance_t);
    float width_coverage=mix(1.0,ink_far_scale,distance_t);
    ne *= mix(1.0,0.35,distance_t);
    return max(depth_lines ? de : 0.0, normal_lines ? ne * 0.7 : 0.0)*width_coverage;
}

void fragment() {
    vec2 px = 1.0 / vec2(textureSize(screen_tex, 0));
    vec2 uv = SCREEN_UV;
    vec3 color = textureLod(screen_tex, uv, 0.0).rgb;
    float raw_depth = textureLod(depth_tex, uv, 0.0).r;
    bool surface = raw_depth > 0.000001;
    float edge = 0.0;
    if (surface) {
        // One stable native-resolution detector; no moving screen-space distortion
        // and no repeated coverage blur over the resolved scene.
        edge = ink_at(uv, px, INV_PROJECTION_MATRIX);
        vec3 center_normal = textureLod(normal_tex,uv,0.0).xyz*2.0-1.0;
        // Luminance is a prototype shade heuristic, not a dedicated shadow buffer.
        float lum = dot(color, vec3(0.2126,0.7152,0.0722));
        if (paper_color) color = mix(color, sqrt(max(color, vec3(0.0))) * vec3(1.025,1.0,0.97), 0.24);
        if (hatching) {
            vec3 vp = view_pos(uv, raw_depth, INV_PROJECTION_MATRIX);
            vec3 wp = (INV_VIEW_MATRIX * vec4(vp,1.0)).xyz;
            vec3 wn = abs(mat3(INV_VIEW_MATRIX) * center_normal);
            vec2 q = wp.xy;
            if (wn.y > max(wn.x,wn.z)) q = wp.xz;
            else if (wn.x > wn.z) q = wp.zy;
            float hatch = max(line_pattern((q.x+q.y)*6.0), line_pattern((q.x-q.y)*6.0) * (1.0-smoothstep(0.025,0.12,lum)));
            float darkness = 1.0 - smoothstep(0.04,0.30,lum);
            float fade = 1.0 - smoothstep(25.0,75.0,-vp.z);
            color = mix(color, ink.rgb, hatch * darkness * fade * hatch_strength);
        }
    }
    float pressure = 0.86; // Stroke variation belongs to object-attached material marks.
    vec3 local_ink = mix(ink.rgb, color * vec3(0.55,0.50,0.48), 0.20);
    color = mix(color, local_ink, edge * 0.78 * pressure);
    ALBEDO = max(color, vec3(0.0));
}


