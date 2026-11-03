# Regression cases and project-specific decisions

Use this record when a similar defect recurs. It supplies diagnostic leads and failed approaches, not universal shader constants or proof that the current game is accepted. Preserve earlier validated fixes when revising a different subsystem. This is a maintained failure/constraint reference, not a substitute for current runtime inspection.

## Failure patterns from the the desert-scene test project iterations

| Reported problem | What to inspect | Avoid / acceptance condition |
| --- | --- | --- |
| Fence-like vertical lines on grazing ground | Depth-only with noise off/on; texel spacing, same-space reconstruction and plane residual | Do not assume hatching caused every stripe. Preserve true silhouettes without false floor bands at multiple resolutions |
| Square tone patches on round roofs | Flat versus continuous normals, mesh seams/profile, self-shadow and cascades separately | Do not hide blocks with more noise or thicker ink. Rounded tone boundaries should follow the surface while intended creases remain |
| Missing character/cast-shadow contour | Receiving material's light/shadow signal, effective scene config, global updates and toggle ownership | A default-on shader is insufficient if config turns it off. Verify the actual character shadow and switch in runtime |
| Shade boundary too black, or too faint after softening | Separate light/cast-shadow lines from silhouette lines; material-relative colors and default-camera width | Preserve deep colored shadow blocks; keep a legible colored boundary without blanket black ink or disappearing lines |
| Dead-straight or mechanically wobbly lines | Source silhouette and drawing construction; coordinate attachment and periodic modulation | Screen sine/noise alone is not convincing pen work. Improve meaningful stroke rhythm and appropriate source geometry |
| Motion looks soft or strange | Follow line-and-motion.md; distinguish filtering, crawling, presentation and frame delivery | User-reported motion blur remains unresolved until isolated and reviewed in motion; a moved actor plus screenshots is not a pass |
| Stronger hand-drawn effect reintroduces stripes or shimmer | Re-run grazing-ground, thin vegetation and motion checks with the final combined effect | Increasing noise amplitude is not a fix for all straight edges |
| Unrequested recolor | Accepted material/sky/light palette versus new grading/post layers | Lock accepted palette unless the user changes that goal; a style reference does not authorize imposing its palette |
| Clean result becomes empty | Before/after medium and fine detail, original useful marks, detail suppression masks | Selectively simplify conflicting marks; do not equate clean rendering with deleting all meaningful detail |
| Many props but still mechanical | Large/medium shape hierarchy, shared dwelling recipe repetition, use/exposure context | Quantity, subdivision and uniform randomness do not prove organic structure or life |
| Ground looks like square confetti; walls have stretched stripes | Procedural cell/grid visibility, triplanar seams, UV scale/distortion and distance filtering | Retain readable material identity without carpet noise, projection bands or shimmering micro-detail |
| Detail exists only in one close-up | Default routes, outskirts, settlements, terrain transitions and visible interiors | Use varied contextual clusters across supported regions; avoid blanket exclusion masks that empty every settlement |
| Wind indicated by conspicuous streaks | User's requested motion cue and its integration | For this project's choice, use rolling tumbleweeds and coherent secondary vegetation motion; remove rejected streaks |
| Distant scenery has foreground-weight lines | Screen contours, material shade boundaries, hull fallback and sky-painted marks | Apply a continuous role-aware distance policy; keep the stable depth neighborhood and inspect subpixel motion |
| Isolated human-shaped shadow when standing on a rock | Rock batches casting shadows, receiver material, sun angle, elevation and self-shadow | Elevated shadows can be physically displaced; restore missing rock occlusion before inventing a foot blob or changing sunlight |
| Actor and scenery look pasted together | Texture/authored line versus generated line hierarchy and animation attachment | Match perceived clarity and mark scale without erasing the character's authored identity |

## the desert-scene test project's current art constraints

Apply these only when continuing this project or when explicitly requested; they are not a definition of every Moebius-inspired game.

- Edit the agreed test copy and preserve the original. Reuse the existing copy rather than creating a disconnected miniature demo.
- Keep the accepted warm palette. Do not reintroduce a new global grade while fixing lines.
- Keep clearly separated, fairly deep colored shadow blocks, optionally with one or more readable colored dividing lines. Crossed diagonal hatching was rejected; do not restore it through a shader default, material factory or debug shortcut.
- Shade-divider lines should not be near black. Preserve a hierarchy between silhouettes, seams and shade boundaries; do not soften the entire image to address one line type.
- Retain useful original detail. Develop meaningful house construction, windows, fixtures, repairs and appropriate interior detail; vary families by function and use rather than attaching identical decoration kits everywhere.
- Distribute pebbles, dry grass and ground transitions through plausible regions, including selected settlement edges and wall bases while keeping doors and routes open. Rich detail and quiet space can coexist.
- Use tumbleweeds to express wind, with direction, ground contact, rolling, obstacle/bounds behavior and coherent vegetation response. Do not substitute glowing wind lines. Do not add new lore or gameplay through decoration.
- Motion softness was reported. A subsequent pass removed extra screen AA and screen-locked jitter, retained geometric AA, replaced repeated coverage interpolation with stable detection, and captured actor/camera/walking/stopping sequences. These are implemented checks, not user acceptance of the final hand-drawn appearance.
- Follow near-thick/far-thin line hierarchy across screen contours, shade boundaries and backgrounds, preserving close detail and distant landmark readability.

## Evidence boundaries

Code inspection established examples of flat dwelling face normals, scene configuration disabling shadow ink, and screen-coordinate line modulation. Their existence does not identify every visible artifact or prove the cause of motion blur. Earlier depth-stripe fixes were inspected at two resolutions, but still need regression checks after later changes. Softer/interpolated line coverage was implemented and viewed in stills; it must not be described as having solved the user's later motion complaint.

## Subsequent shadow and distance evidence

The rock-shadow case reproduced an isolated human silhouette on the sand below an elevated player. Three visible rock batches had shadow casting disabled. Directly enabling their shadows introduced self-shadow speckles; the chosen test-copy adapter added three shadow-only batches for 165 closed rocks, inset by 4 percent, with visible meshes/collision and global bias unchanged. This proxy is an approximation with extra shadow cost, not a universal solution for thin, open or animated meshes. Test other geometry before reuse. Do not generalize the physically expected displacement of an elevated player's low-sun shadow into a bug in all cases.

The distance pass was checked on Godot 4.7.2 Forward+ in 1600x900 and 1280x720 fixed village, near-house, horizon and interior views plus a camera-orbit sequence. Its policy reduces the background-side depth band and distant crease coverage without varying the depth-tap radius; per-material shade lines, fallback hulls and illustrated sky borders have matching distance/art policies. This does not establish an objective likeness score or a universal fractional-pixel line width.
