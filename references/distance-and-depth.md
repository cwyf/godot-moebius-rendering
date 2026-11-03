# Distance-aware lines and spatial depth

Read when distant scenery has the same thick ink as the foreground, the horizon is overdrawn, or a user requests near-thick/far-thin lines. Preserve accepted palette, shadow block depth, motion clarity and meaningful close detail. Treat line thickness, opacity and geometric detail as separate controls.

## Inventory all line sources

Inspect screen contours, hull/next-pass outlines, per-material light-band and cast-shadow boundaries, authored surface marks, character texture lines, transparent overlays and sky/procedural background lines. Fixing one source does not establish a global hierarchy. Avoid doubling hull and screen outlines. Sky-painted marks have no ordinary scene depth; give them a separate, deliberately authored distant treatment.

Specify the distance coordinate consistently: reconstructed positive view Z or another documented camera-distance measure. At an occlusion edge, use the foreground object's distance when possible so both sides do not receive contradictory weights. Preserve the main character's readability with a role-specific minimum; do not give every distant NPC the primary character's near weight.

## Choose a continuous policy

Expose near distance, far distance and far width/coverage floor in a project-owned profile that actually drives the implementation. Use a smooth transition, not discrete distance bands. For the current the desert-scene test project scale, a tested starting policy is near 8 m, far 100 m, far scale 0.28; these numbers are not universal settings for arbitrary games, cameras or render sizes.

- Near: retain structural silhouettes and useful internal marks; do not inflate every micro-detail.
- Middle: reduce width gradually, simplify secondary creases and maintain readable colored shade boundaries.
- Far: retain selected thin silhouettes/landmarks, reduce secondary-line coverage and avoid dark double-sided contour bands. Do not erase the landform or replace all distant color with fog.

A fixed 3x3 detector with a one-texel radius has a raster footprint; multiplying opacity alone is not a geometric width reduction. A feasible combined approach is to suppress its background-side occlusion band at distance, reduce crease contribution, and use coverage for subpixel apparent widths. State the distinction. Alternative morphology, contour geometry or dedicated masks need their own validation and cost review.

Keep stable depth/normal sampling. Do not vary nearest-depth sampling radius below one pixel merely to request thinner far lines; that can change neighbor spacing and revive grazing-floor stripes. Keep reconstruction coordinates matched to the fetched texel. Do not restore screen-locked jitter, full-frame blur or temporal trails to conceal aliasing.

For per-material shade lines, scale their screen-derivative width and coverage independently of shadow block color/depth. Retain a practical antialiasing floor and smooth coverage when a line becomes subpixel; test for sparkle/disappearance during motion rather than claiming arbitrary fractional raster widths. Apply the policy to cast-shadow boundary code as well as the light-band boundary code. Hull-based fallback outlines need the corresponding distance scale even if the primary screen pass normally hides them.

## Reusable Forward+ example

[distance_ink.gdshader](../assets/godot4-forward-plus/distance_ink.gdshader) is the screen shader tested in the the desert-scene test project copy on Godot 4.7.2 Forward+. It provides stable depth/normal contours, grazing-plane rejection and distance-aware coverage. It does not convert models, shade materials, prepare a scene, attach authored character marks, or implement the whole skill.

It requires registered global shader parameters before shader compilation:

```ini
[shader_globals]
ink_distance_range={
"type": "vec2",
"value": Vector2(8, 100)
}
ink_far_scale={
"type": "float",
"value": 0.28
}
```

Merge these entries into the existing section; do not replace unrelated globals. Build the full-screen spatial mesh with the renderer-correct reverse-Z setup, CPU culling margin and transparent/UI ordering described in rendering.md. Normal/roughness sampling requires Forward+; this is not a Compatibility/Web implementation. Keep hatching and color grading disabled when rejected. Adapt and test other engine versions/renderers before claiming support.

Drive the same policy in material and hull adapters; copying this screen shader alone does not change their embedded fixed-width lines. The the desert-scene test project implementation registers defaults in project settings and consumes profile values in its test-layer startup. Do not declare an unused JSON field to be a working adapter.

## Evidence and acceptance

Compare fixed default gameplay views, a near structural close-up, a horizon/landmark view and an interior at the target render sizes. Use the same framing and disclose changing resolution, time-dependent props or test-only settings. Check the same recognizable edge while the camera approaches, recedes and orbits: the transition must be gradual, without width jumps, swimming, popping or lost character readability. Inspect grazing ground and thin plants with the combined effects enabled.

Record which sources were processed or deliberately retained and distinguish actual width, coverage and perceived contrast. Do not measure optical line width from the nominal scale parameter alone. A distant line may occupy one partially covered pixel; it cannot be described as a guaranteed 0.28-pixel geometric contour.

Retain the earlier no-recolor, no-crosshatch, no-motion-softening and restored-rock-shadow checks for the desert-scene test project. Distance optimization must not silently remove useful near detail or undo working integration.
