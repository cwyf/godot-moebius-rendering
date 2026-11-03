---
name: godot-moebius-rendering
description: Transform editable 3D game projects toward a coherent Moebius-inspired style through global art-direction profiles, category-aware organic model rebuilding, separated color and ink rendering, and contextual scene composition. Use for whole-scene restyling, mechanical Python/procedural geometry, or this style's rendering defects; not generic development or a guaranteed one-click conversion of arbitrary games.
---

# Godot Moebius Rendering

Build a coherent illustrated scene with readable silhouettes, controlled color, ink lines, intentional shadow marks, and evidence of place and use. Make AI-generated or Python-modeled environments feel specific and alive through structure, materials, contextual details, and composition as well as rendering. A post-process filter or indiscriminate prop scatter is not enough. Match the user's chosen references rather than imposing one palette or making every effect mandatory.

## Execution contract: one request, end-to-end work

An instruction to optimize/transform a supplied game means execute the authorized transformation, not merely explain a plan. Inspect, plan internally, implement, run, inspect images/motion, revise, propagate, and deliver within the same continuing task. Do not end after drafting a profile, changing skill prose, producing a first rough pass, or making one sample scene. If the user specifically asks only to research, plan, or edit this skill, respect that scope and do not modify a game.

Carry existing copy-only/source-preservation constraints forward. Reuse the agreed test copy unless a new copy is requested or needed. Do not ask for renewed approval at routine phase boundaries. Ask only for information or authorization that is actually missing; continue independent authorized work while it is pending.

This skill supplies an execution and revision workflow, not a guarantee of one-pass aesthetic equivalence or a functioning universal conversion program. Reuse available generators and implement missing adapters within scope. Do not describe instructions, research links, a hypothetical configuration, or generated concept art as a completed runtime transformation.

For a full transformation, read [references/outcome-acceptance.md](references/outcome-acceptance.md) before editing. Use its reference-linked outcome gates throughout, not just at final delivery.

## Global transformation is the primary workflow

When the user asks for a global transformation or says the scene still feels mechanical, read [references/global-transformation.md](references/global-transformation.md) first. Treat this as a project-wide art and geometry migration, not a request to scatter more props. Read [references/organic-modeling.md](references/organic-modeling.md) when inspecting/rebuilding geometry, and [references/research.md](references/research.md) before selecting third-party techniques.

Produce an inventory and shared style profile, choose a representative scene and asset set, transform the major forms and material/lighting system, evaluate them, and then propagate validated category rules across the inventory. A representative scene is a calibration step, not a reason to leave the requested global scope unfinished. Track every asset as processed, preserved, replaced, or requiring review.

Separate albedo/paper color from shade/ink generation. Adding outlines and hatching to already shaded, noisy materials does not reproduce the reference's rendering logic. If the scene remains dependent on noisy primitive shapes or uniform texture detail, fix those sources before adding dressing. Geometry change and render restyling must each remain independently reviewable.

Organic form means controlled shape language, scale hierarchy, functional connections, and contextual variation. Use category-specific recipes: rock massing, plant growth curves, terrain processes, handmade architecture, and topology-preserving animated assets. Do not convert all objects into noisy blobs. Preserve architectural openings and load-bearing/formal organization while allowing measured handcrafted variation.

Support broad ingestion of editable projects and meshes through explicit adapters. Do not claim a skill can automatically recover intent, rigging, editable source, or gameplay constraints from any arbitrary game or mesh. Report adapter limits and route unsupported assets for reconstruction while continuing supported work.

## Establish scope

- Identify whether the user wants research, a standalone prototype, or integration into an existing project. Research does not authorize project modification.
- Inspect the actual Godot version, renderer, target platform, resolution, camera, and existing post-processing before choosing an implementation. Do not assume a version from older chats.
- Follow applicable project instructions and the global game-development scaffold when available. Keep Unity reference techniques separate from Godot implementation.
- For implementation details and failure modes, read [references/rendering.md](references/rendering.md). For provenance and reference access limits, read [references/sources.md](references/sources.md).
- For sparse, sterile, repetitive, or primitive-looking scenes, model improvement, desert details, small props, or interiors, read [references/scene-enrichment.md](references/scene-enrichment.md). This can be used without changing a working shader.

## Choose the work

- Rendering defect or style prototype: use the rendering workflow below.
- Scene feels empty but its forms already work: use scene enrichment.
- Scene feels mechanical, overly procedural, or built from obvious primitives: use the global and organic-modeling workflows first. Inspect actual generator scripts and rebuild deficient forms; scattering details is not a substitute. Python may be the authoring tool, but do not assume all procedural geometry is generated by Python.
- Both: repair rendering artifacts first, enrich one representative area, then tune the combined result. Do not pile detail on top of a broken edge detector.

For scene enrichment, prioritize major form and spatial rhythm, medium-scale structural features, contextual prop clusters, then fine surface detail. Include model-internal features and usable interiors when relevant. Preserve intentional empty areas, paths, interaction spaces, the user's fiction, and accepted silhouettes.

## Preserve the target across revisions

Lock accepted palette, shadow depth, useful detail and scene constraints before revising a failing layer. Read [references/regression-cases.md](references/regression-cases.md) for recurring defects and the desert-scene test project-specific choices; apply its project preferences only to the matching project. Earlier runs and screenshots do not override later user-reported regressions or establish artistic acceptance.

For blur, swimming lines, weak drawing, over-dark boundaries or character/environment mismatch, read [references/line-and-motion.md](references/line-and-motion.md). Diagnose motion clarity before adding more style effects. Separate silhouettes, seams, shade boundaries and surface marks; regular screen noise is not sufficient evidence of hand-drawn quality or object attachment.

For near-thick/far-thin hierarchy or overdrawn distant scenery, read [references/distance-and-depth.md](references/distance-and-depth.md). Audit every line source, including material shade boundaries and backgrounds; use continuous distance controls without reintroducing sampling artifacts or blur. The reference includes a tested optional Forward+ screen-shader asset, not a universal game converter.

For intersecting openings, weak window trim, disconnected canopies or floating ladders/props, read [references/architectural-joinery.md](references/architectural-joinery.md). Use shared contact anchors and actual surfaces, then check every relevant instance from near, side and gameplay-distance views; preserve already accepted line/color decisions.

## Reference study

Inspect accessible images or video frames before claiming visual analysis. Separate observed appearance, documented author statements, and proposed implementation. If a video or artwork cannot be accessed, report the limit without claiming it was watched. Do not infer the exact algorithm from a screenshot.

Break the target into geometry/composition, palette/lighting, outer contours, internal lines, shadow marks, and surface texture. Use original artwork as art-direction reference and technical demos as implementation reference; neither substitutes for the other.

## Prototype and implementation

For an unconstrained desktop 3D prototype, consider Forward+ because it exposes the normal-roughness screen texture. Preserve the project's renderer unless a change is justified and within scope; provide a depth-only or custom-buffer alternative when needed.

When integrating into an existing project, first inventory material outlines, grain, color grading, transparent effects, and later screen readers. Avoid double outlines and verify both enabling and restoring the original material passes. If the user requests a copy, copy and verify source hashes before editing, isolate save/settings paths, and recheck source hashes at delivery.

Use a small representative scene: ground, rounded and angular forms, overlapping objects, a moving object, and a main light. Offer separate toggles for base shading, depth edges, normal edges, hatching, line perturbation, and grain. Avoid building a full game just to prove the renderer.

1. Establish appealing base colors, lighting, and silhouettes with effects disabled.
2. Add depth outlines and normal creases with independent thresholds. Evaluate color-based edges only when useful for the reference.
3. Choose the agreed shade language: colored stepped blocks and their boundaries, hatching, or a deliberate combination. Hatching is optional and must remain off when rejected. Document the lighting/shadow signal separately from albedo and give shade boundaries their own color/weight controls.
4. Add restrained line irregularity and optional paper grain only after the undistorted edge detector is clean. Perspective depth slope on a continuous grazing surface is not an occlusion boundary. Inspect ground and long shallow slopes with noise both off and on; see the depth-sampling diagnostic in the rendering reference.
5. Decide transparent-object and UI treatment explicitly. Check post-processing order and avoid accidental double grading.

Expose meaningful controls with units where possible: line width in pixels, depth sensitivity, normal sensitivity, ink color, hatch spacing/density, noise amplitude in pixels, and animation rate. Derive texel offsets from the actual render texture dimensions. Keep settings reusable without scattering hardcoded values through shaders.

## Acceptance

Check both stills and movement, at the intended output resolution:

- Distant detail stays readable; nearby contours do not become heavy black bands. When distance hierarchy is requested, near, middle and far lines have distinct weights, with gradual approach/recede transitions across screen, material and fallback outline layers.
- Flat surfaces stay clean; intentional creases remain visible.
- Inspect actual actor-only, camera-only and walking motion, not just displaced-actor stills. No unacceptable softening, trails, line swimming/crawling, texture shimmer or uneven frame delivery; distinguish observed symptoms from proven causes.
- Silhouettes, internal marks and shade boundaries have distinct readable weights/colors; decreasing blackness must not erase the line or blur the image.
- Character and environment share a coherent apparent sharpness and line/detail hierarchy at gameplay distance.
- Lighting changes do not turn every dark material into hatch-covered shadow unexpectedly.
- Sky, silhouettes, transparency, particles, UI, and screen edges behave as intended.
- No fence-like vertical stripes, contour trails, or broad ink bands appear on grazing ground or sloped walls. Test multiple resolutions with noise on, not only a clean noise-off frame.
- Compare the same camera view before/after, and record performance at a stated resolution, renderer, and hardware when available. Do not invent FPS results.

When Godot is available, import/compile and run the prototype, inspect actual rendered frames, and exercise camera/object motion. A parsing check does not verify visual quality. If runtime validation is unavailable, clearly label the implementation unverified.

For a rendering defect, freeze the camera and isolate color-only, depth-only, normal-only, hatch-only, and noise off/on. Preserve a reproducible failing variant, compare against the fix at the same viewpoint, and repeat the combined effect test. Fix the responsible signal before compensating with stronger thresholds or disabling unrelated layers. Do not infer a measured speedup from short FPS snapshots or a frame-rate-capped comparison.

Deliver the requested artifact, a concise explanation of changed files and adjustable controls, validation evidence, and remaining limitations. Do not claim to have installed the skill, modified a project, or reproduced a reference without verifying the relevant result.

For global work, an unresolved dominant style mismatch means the task is incomplete even if shaders compile and the game runs. Continue targeted revision when feasible. If a real blocker or persistent lack of progress prevents further useful work, deliver the reversible work and identify the unresolved category and needed next capability; do not relabel it as success or seek vague permission to continue already authorized work. Never claim that the user's subjective acceptance has been obtained without their feedback.
