# Reference-linked outcomes and revision

## Define the visual target from evidence

Use the user's images, video frames and explicit corrections as the target. Reuse established choices rather than repeatedly asking what “Moebius” means. When a needed reference cannot be inspected, identify what remains unknown and use the accessible material with a stated assumption; do not invent unseen content.

Create a concise mismatch table: reference feature, current visible behavior, responsible subsystem, proposed change, evidence view, status. For example: “reference has clean bright color with ink shade; current game has dense dark material cracks; change base material/detail masks, not prop count.” Keep it tied to actual frames, not generic adjectives.

Do not invent a percentage similarity or treat a model's own aesthetic score as objective proof. A fixed target palette, screen line width and geometry constraints can be measured; stylistic resemblance still needs visual judgment and user acceptance.

## Gates for a complete global pass

| Gate | Evidence required | Revise when |
| --- | --- | --- |
| Major forms | Texture-free silhouettes and clay views of representative families | Natural assets still expose repeated circles, spheres, cylinders or rigid strips; transitions remain visibly pasted together |
| Organic organization | Rock mass/plane hierarchy, curved/tapered vegetation, functional handmade architectural transitions | Variation is only random surface noise, extra bevels, more subdivisions or uniformly melted geometry |
| Color and light | Base-color view, shade/ink view, combined runtime view | Old volume shading, sepia grading, crack noise and hatch obscure the reference's intended color/line relationship |
| Lines and surface marks | Near/far details, grazing ground, thin vegetation and sky silhouettes | Ink doubles, crawls, stripes, fills every small object or ignores meaningful internal structure |
| Spatial line hierarchy | Same near/middle/far views and approach/recede or orbit motion at target resolutions | Far landmarks retain foreground-width ink, shade lines bypass the policy, or subpixel lines pop/vanish |
| Motion clarity and attachment | Actor-only, camera-only and actual walking sequences at intended presentation, plus relevant layer isolation | Output softens, trails, crawls or swims; only stills or movement distance were checked; blur cause is still guessed |
| Character/environment agreement | Default gameplay view and motion comparison of line width, clarity, marks and shade | Character looks pasted in, or is blurred to hide the mismatch |
| Architectural assembly | Front/side joint views, default-distance windows and grounded props across all supported variants | Door infill escapes the frame, window trim disappears, poles miss beams, or ladders float; contact is only assumed from node positions |
| Place and life | Default walking view, exterior/interior views and contextual detail groups | Dressing is uniformly random, paths are cluttered, interiors are blank or motion is synchronized/unmotivated |
| Integration and coverage | Resource/status manifest plus representative runtime checks for all processed families | Major asset families, runtime generators, old materials or relevant scene types remain unintentionally unchanged |

Use gates at the scope requested. A tiny shader fix need not remodel a game. A whole-game transformation must not be declared complete after only a tiny shader fix.

For the user's stated target, small stone scatter, dry grass, collar rings and box seats alone do not pass major-form or global-style gates. Treat those earlier additions as optional dressing whose value must be reevaluated after rebuilding the dominant forms.

## Iteration loop

1. If a rendering defect impairs gameplay clarity, isolate it before aesthetic embellishment; use line-and-motion.md. Preserve accepted palette, detail and shade choices. Implement the highest-impact unresolved mismatch: often a main silhouette or the color/shade system before micro-detail.
2. Render comparable game views and inspect them. Also inspect geometry without texture when the problem concerns structure. A screenshot from a separate illustration tool cannot stand in for a Godot frame.
3. Attribute the remaining mismatch to a subsystem, then change that subsystem. Avoid stacking effects to hide poor geometry or increasing clutter to hide empty composition.
4. Recheck previous fixes and gameplay constraints. Roll back a regression independently when possible.
5. Once category rules work, apply them across the inventory and verify the result. Keep unresolved cases visible; do not silently skip difficult families.

Choose a small set of meaningful captures and checks, not a bloated test suite. An after image must represent the actual default result; disclose any special camera, disabled layer or debug-only setting that changes its appearance. Pair stills with an actual motion check for thin details, lines, optional hatch and animated objects. Inspect playback/live movement and paused frames; screenshot save success or nonzero actor displacement does not establish visual stability. Report motion acceptance unverified if that evidence cannot be inspected.

Do not stop at “the first version works” when major mismatches remain and a feasible correction is available. Do not pursue indefinite random tweaking either: if successive experiments do not materially improve the image, return to the mismatch table, inspect the construction/source and change approach. If an essential capability, source asset or user decision is genuinely missing, name it and finish unaffected work.

## Final handoff

Deliver the actual edited project/copy, before/after runtime views, model evidence where relevant, concise controls, processed/preserved/replaced/unresolved coverage, validation and material limitations. Explain which parts remain proposals or unimplemented adapters. Preserve source checks and rollback mapping when copy-only work was requested.

Describe observable outcomes rather than “more organic,” “fully optimized,” or “Moebius achieved” without evidence. Technical checks support a reviewable result; the user decides whether its artistic direction meets their intent.
