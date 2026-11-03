# Rendering decisions and failure modes

For movement softness, line attachment and stroke construction, read [line-and-motion.md](line-and-motion.md). For prior failure patterns and project-specific preferences, read [regression-cases.md](regression-cases.md).

For near-thick/far-thin hierarchy across line sources, read [distance-and-depth.md](distance-and-depth.md).

## Scene foundation

Use shape, negative space, and material simplification to control detail density. Choose a palette from the actual reference. Reduce physically realistic highlights when they conflict with the target; retain gradients or lighting variation where useful. Posterization is optional, not a requirement for all Moebius-inspired work.

Generated models may need simplification, normal cleanup, and material replacement. Dense geometry or noisy normal maps can flood a crease detector. Evaluate one representative imported asset before processing a whole batch.

## Outlines

Sobel estimates local image gradients, commonly from a 3x3 neighborhood. The input matters more than the filter's name:

- Linearized depth: occlusion boundaries and silhouettes. Use distance-aware/relative thresholds to avoid inconsistent behavior across the view range.
- Decoded view-space normals: surface direction changes. Choose thresholds deliberately so smooth curvature does not become bands of ink.
- Luminance/color: optional painted detail; may also capture textures and shadow boundaries unintentionally.

Combine independently tunable masks, suppress sky/background artifacts, and use a soft threshold for controllable coverage. Preserve matching sampling positions when perturbing corresponding depth/normal edge samples. Clamp or otherwise handle texture boundaries. Sobel cannot recover artist-authored seams or markings absent from the geometry and buffers.

### Grazing-surface depth artifacts

Linearization or log-depth reduces distance scaling problems but does not remove the perspective gradient of a continuous plane. A depth Sobel magnitude can therefore paint false edges across a floor near the horizon. With nearest filtering, subpixel UV jitter and a fractional sampling radius can switch the effective neighbor spacing; a periodic offset can turn those false edges into fence-like vertical stripes.

Diagnose using a fixed camera: color-only, depth-only, normal-only, hatch-only, then depth with noise off/on. A stripe that reproduces with depth+noise and without hatching must not be labeled a hatch bug merely because it resembles hatching.

Possible remedies, selected for the target geometry:

- Start from a stable one-texel neighborhood. Keep reconstruction UV consistent with the texel whose depth was fetched; for nearest sampling, reconstruct at that texel's center when needed.
- Separate local surface slope from discontinuities. One option is the point-to-plane residual `abs(dot(P_neighbor-P_center, N_center))`, normalized by a view-distance scale. Use it to gate a depth edge mask. Positions and normals must be in the same space. Check normal validity, silhouettes, corners, smooth curved surfaces, and distant thin objects; do not copy one scene's thresholds as universal constants.
- Prefer adding hand-drawn irregularity to the resulting ink coverage, or to a separate pattern, if perturbing geometry-buffer reads destabilizes detection. Lower-frequency jitter alone does not establish correctness.
- Verify at multiple resolutions, shallow camera angles, and with combined effects enabled. Retain real silhouettes while suppressing false surface bands.

Observed case, 2026-11-02: a Godot 4.7.2 Forward+ test copy of the desert-scene test project reproduced fence stripes in depth+UV-noise alone. A revision using a one-texel radius, lower-frequency offset, and a relative point-to-plane gate removed the observed stripes in inspected 1280x720 and 1600x900 captures, with indoor and camera-motion sampling. This is a combined, scene-tested remedy; the contribution of each individual change was not separately measured, and it is not a guarantee for all geometry.

Fixed pixel width is a choice, not a required style invariant. Preserve near/far hierarchy when requested. Keep sample radius and final perceived line width distinct. A larger Sobel radius alone is not a reliable thickness control for every silhouette. Test morphological expansion or a different edge method if thickness needs independent control.

## Godot post-processing

Confirm APIs against documentation for the installed version:

- `hint_screen_texture`: scene color. In the conventional 3D screen-reading path, copied after opaque geometry and before transparent geometry; it is not a guaranteed final composited framebuffer.
- `hint_depth_texture`: depth for the current viewport. Use inverse projection to reconstruct view position, divide by homogeneous W, and obtain positive view distance from `-view.z`.
- `hint_normal_roughness_texture`: available only in Forward+, populated by the relevant depth prepass. Decode normals from the stored range as documented. Not all surfaces necessarily contribute.

For a simple depth-aware pass use a full-screen spatial mesh, unshaded and fog-disabled, with depth/culling/render order configured appropriately. Godot 4.3+ reverse-Z changes the old clip-space setup: the documented quad vertex expression is `POSITION = vec4(VERTEX.xy, 1.0, 1.0);`. Follow the version's full setup, including quad orientation and CPU frustum culling; assigning POSITION does not update the CPU bounds.

Reconstruction NDC differs: Forward+/Mobile convention uses XY in [-1,1] and depth Z in [0,1]; Compatibility uses Z in [-1,1]. Never paste linearization equations from Unity or older Godot versions without adapting them.

A ColorRect reading a viewport image can handle color effects, but does not automatically expose that other viewport's 3D depth/normal buffers. Multi-pass effects need deliberate buffer copies/order or a suitable CompositorEffect pipeline, with renderer/version support checked first. For complex integration, select the hook based on required buffers and transparency rather than assuming a quad solves every case.

## Hatching

Use only when consistent with the current reference and user choice. Colored shadow blocks and their dividing contours are an alternative; do not re-enable rejected hatching when revising unrelated rendering.

Prototype with a luminance-derived darkness mask when fast iteration matters. Label it a heuristic: albedo, exposure, tone mapping, emissive materials, and light all affect brightness. To separate dark paint from actual shade, consider controlled materials or an explicit lighting/shadow mask produced by a material/render pass.

Use one line family for moderate shade and an additional family for deeper shade, with smooth transitions. Allow colored ink and reference-dependent density. Avoid multiplying dark shadows and dense black hatching until all color disappears.

Choose coordinates deliberately:

| Space | Useful behavior | Main tradeoff |
| --- | --- | --- |
| Screen | Constant apparent spacing, print-like overlay | Objects slide under the pattern during motion |
| World/triplanar | Stable on static scenery | Moving objects may swim through it; projection blending needs care |
| Object/UV | Pattern follows a moving object | UV seams, scale variation, stretching |

World-position reconstruction from depth can anchor static-scene hatching. It does not make the pattern object-locked. Test hatch frequency at distance; fading or filtering fine patterns may be necessary to prevent moire.

## Noise and compositing

Start with static, small-amplitude offsets expressed in pixels. Perturb line masks or hatch coordinates before distorting the entire scene. Full-frame distortion is an optional reference-driven effect. Frame-independent random offsets cause flicker; prefer stable spatial noise or a deliberate low-rate update when an animated drawing effect is wanted.

Keep geometry-based edge detection and image warping aligned. Add fine grain subtly near the end; paper texture should not hide contour errors. Render UI after the world effect unless the requested UI style requires shared processing. Test TAA/FXAA/MSAA and render scaling in the actual project; do not automatically disable antialiasing.

Check transparent draw order explicitly. A late full-screen replacement using an opaque-only screen copy can erase previously rendered transparent beams/particles. Drawing the effect before those transparents can preserve them, but other screen readers, refractive surfaces, and priority settings still need verification. Fixing transparency is not proof that depth sampling is clean; test these independently.

## Diagnostic shortcuts

| Symptom | First checks |
| --- | --- |
| Everything gets ink lines | Normal noise, overly low thresholds, color-edge contribution |
| Distant outlines disappear or dominate | Raw nonlinear depth, threshold scaling, render resolution |
| Hatching covers dark paint | Luminance heuristic confused with a lighting mask |
| Lines wobble independently of silhouettes | Misaligned perturbed sampling, full-frame UV warp |
| Hatching swims | Coordinate choice; world coordinates on moving objects |
| Glass/particles lack the effect | Buffer inclusion and transparent-pass timing |
| Effect disappears when camera turns | CPU bounds/frustum culling of full-screen mesh |
| Old shader produces blank output | Reverse-Z, renderer NDC convention, material depth/order settings |
| Fence-like vertical stripes or trails on a floor | Depth-only/noise-on ablation; perspective slope mistaken for edges, fractional nearest taps; inspect same-space plane residual or stable sampling |
