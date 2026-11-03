# Line hierarchy, attachment and motion clarity

Read for soft/muddy output, moving-character blur, swimming/crawling lines, mechanical drawing, or over-dark shade boundaries. Diagnose the image before changing style parameters. Preserve accepted color, shadow depth and detail while isolating the failing subsystem.

## Diagnose blur without guessing

Separate these symptoms: soft edges in every frame; a trail of previous positions; line crawling/swimming; texture shimmer; low-resolution/presentation scaling; uneven frame delivery. They need different remedies. A user reporting blur is evidence of a perceptual defect, not proof of its cause.

Inventory the effective runtime pipeline, not only project defaults: viewport/render scale and actual output size, stretch/presentation scaling, MSAA, FXAA, TAA or upscaler if enabled, texture filtering/mipmaps, DOF/motion effects if present, screen readers, edge reconstruction/coverage filtering, and frame timing. Check runtime overrides and editor-embedded window scaling. Do not call an issue TAA ghosting without evidence that temporal processing/history is used. Bilinear sampling alone does not prove motion blur; a shader without history does not itself accumulate previous frames, though other stages or presentation can still contribute.

Use short, repeatable checks appropriate to the symptom:

| Check | Hold fixed | What it distinguishes |
| --- | --- | --- |
| Everything stationary | Camera, actor pose, render size | Baseline softness, inadequate pixel footprint |
| Actor moves, camera fixed | Lighting and background | Actor material/animation, moving contour attachment |
| Camera translates or orbits, actor stationary | Pose and lighting | Screen-locked patterns, texture minification, camera/presentation issues |
| Actual walking and stopping | Native presentation and default effects | Real gameplay clarity, crawling and settling behavior |

Compare baseline and individual effects at the same view/resolution, changing one relevant component at a time. Examples: line jitter off/on, post-ink off/on, one AA/filter stage isolated, native scale versus scaled presentation. Restore settings after each test; do not disable all AA permanently as a blanket fix. A debug toggle must remain effective when scene scripts update globals each frame.

Inspect a moving sequence or live motion at normal playback as well as paused frames. Track a recognizable edge or mark on the same object; continuity matters more than whether the shader uses TIME. If profiling is needed, record CPU/GPU frame times when available and presentation limits. Distinguish blur from dropped/uneven frames. A shader becoming more expensive is a hypothesis until measured, not a demonstrated explanation.

Do not claim motion clarity from a still, successful screenshot save, or a nonzero player movement distance. When motion evidence cannot be inspected, label that acceptance gate unverified. If the defect remains, stop aesthetic parameter stacking and report what has and has not been isolated.

## Give each line a role

Separate silhouette/occlusion, structural crease, authored seam, light-band boundary, cast-shadow boundary, and surface mark. They need independently reviewable masks, colors, widths, opacity and distance policy. A single near-black ink setting for all roles is not a hierarchy.

For shade boundaries, derive an appropriate darker color from the receiving material, shade and lighting or use a curated material palette. Keep the user-approved shadow block depth separate from line darkness. Verify the line remains visible at gameplay distance without looking like a black cutout or disappearing into a blurred color transition. Do not simply lower every line's opacity when the complaint concerns only the shade boundary.

Before tuning a stepped light boundary on rounded geometry, inspect shared/split normals, seam continuity, profile resolution, face orientation, shadow-map bias/filtering/cascades and self-shadow. A flat-normal quad grid can produce rectangular tone blocks on a round roof; higher contrast ink cannot repair it. Distinguish shadow-map steps from face-normal steps through isolated views. A self-shadow fix must preserve cast shadows and intentional hard edges.

## Attach the drawing deliberately

| Coordinate choice | Suitable uses | Required check |
| --- | --- | --- |
| Object/UV/authored curve | Moving props, characters, seams and construction marks | Pose/UV/scale continuity; skinning or deformation attachment |
| World | Static terrain, fixed architecture and environmental marks | Moving objects need a different attachment policy |
| Screen | Intentional paper overlay, constant-pixel width, chosen print effect | Objects move through its pattern; stationary screen noise is not object-stable |

A depth/normal-only screen pass has no automatic object-local identity, UVs or skinned attachment. Use controlled materials, authored line geometry/masks, or a deliberately implemented auxiliary pass when required and feasible. State adapter and buffer limits rather than claiming object attachment from screen noise. Screen-space pixel-width control can coexist with object-attached variation.

## Build drawing rhythm, not a universal wobble

Regular sine displacement is a prototype, not evidence of convincing pen work. Choose mark direction and placement from structure: folds follow tension, cracks follow material, arches follow construction. Use purposeful longer strokes, selected short accents, taper or pressure variation, and restrained irregularity. Not every boundary needs a visible wobble or break. Keep structural joins, roots, openings and gameplay anchors stable.

For overly rigid handmade forms, change category-appropriate source geometry as well: cloth sag and hems, curved/tapered timber, measured wall/profile variation. Preserve functional architectural regularity; do not wobble every box or smooth every model into a blob. Review uncluttered silhouettes separately from line treatment.

When moving a screen edge, derive clean coverage first and preserve buffer sampling/reconstruction consistency. Interpolating final ink coverage may reduce texel jumps, but can also soften lines and increase sampling cost. It is a candidate with clarity/performance tradeoffs, not a validated universal fix. Do not bilinearly blend raw depth across silhouettes as though it were a continuous surface. Check thin geometry, grazing ground, occlusion and both target resolutions after any sampling change.

## Distance hierarchy

For distance-aware width/coverage and background treatment, use distance-and-depth.md. A clean static thin line can still pop when it becomes subpixel; retain the actor/camera/walking checks here. Screen-locked displacement and full-frame softening are not substitutes for spatial hierarchy.

## Character/environment consistency

Compare the character and environment at the default walking distance: apparent line width and softness, mark density, shadow levels, palette relationship, texture detail and animation attachment. Existing illustrated character textures and generated environmental lines may need different adapters to reach the same visual hierarchy. Preserve rigging, authored facial/detail marks and silhouette readability; do not blur the character until its mismatch is hidden.

The exit condition is a clear, stable default gameplay view with readable, intentional lines during actor and camera motion. Separate implemented changes, observed improvements, remaining defects, and the user's artistic acceptance.
