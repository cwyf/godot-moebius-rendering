# Global Moebius-inspired transformation

## Desired outcome and boundary

The user wants an editable game's entire visual language transformed: geometry, materials, light, line, composition, detail, and motion. A global skill is an orchestrated workflow with shared parameters and category adapters. It is not a shipped universal converter simply because its instructions exist. Distinguish researched, implemented, tested-on-samples, and propagated-to-project states.

For other engines, preserve engine isolation and create an engine-specific adapter only within the authorized task. Do not present Godot shaders as Unity/Unreal implementations. Compiled games without editable assets/source require a different scope; do not promise automatic import of arbitrary executables.

## A. Inventory before transformation

For execution requests, the phases below are work to perform, not milestones at which to stop and ask the user whether to continue. Follow outcome-acceptance.md for iteration and completion. For a plan-only request, deliver the plan and state that implementation has not happened.

Read available source generators, scene graphs, mesh resources, material assignments, lights, environment settings, animation/rigs, collision, navigation, interaction anchors, instancing, camera and UI layers. Capture fixed outdoor, indoor, close, distant and moving views. Identify every major visible asset family, including generated-at-runtime geometry.

Use an inventory with asset ID, source path, generator/parameters, category, instances, visual role, polygon/triangle count, material count, rig/blend shapes, collision relationship, protected regions, output path, recipe, seed, and status. Explicit overrides take precedence over inferred categories. Do not infer category solely from filenames.

Ingestion routes:

- Python/Blender source: edit the generator and emit staged outputs with stable identities.
- Godot procedural geometry: edit its actual builders or export a controlled mesh for offline reconstruction. Do not pretend a Python source exists.
- Static exported meshes: work on copies; assess topology, UVs, disconnected components, and protected openings before deformation.
- Animated/rigged assets: default to topology-preserving edits; topology changes require re-rigging/weight and animation validation.
- Missing/unsupported assets: mark for replacement or manual reconstruction; process supported categories independently.

## B. Write a shared style profile

Choose specific accessible references and a target composition. Moebius' work spans multiple styles; do not define one mandatory global orange filter.

The profile should contain:

| Group | Parameters and decisions |
| --- | --- |
| Shape | dominant masses, allowable asymmetry, curvature transitions, regularity limits by category |
| Color | palette by material/region, sky/ground relationship, value range, accent roles, fog |
| Ink | separate silhouette/crease/seam/shade-boundary roles, material-relative line color, pixel width, attachment and distance simplification |
| Shade | accepted block depth, dividing-line policy, shade signal source, optional hatch layers and coordinate policy |
| Detail | where to add marks/geometry, where to remove noise, empty-area and focal hierarchy |
| Motion | wind coherence, secondary-motion amplitude, drawing-noise temporal policy |
| Integration | protected gameplay anchors, budgets, category recipes, rollback mapping |

Use a project-owned configuration (for example `style_profile.json`) and asset recipe manifest when implementing; create only the fields actually consumed. A document alone does not implement configuration-driven conversion.

## C. Fix geometry before dressing

Read the organic-modeling reference. Evaluate each family in silhouette with textures, hatch and grain disabled. If a boulder still reads as a deformed sphere, or grass as rigid strips, rebuild its construction logic. Add small details after the large and medium shapes work.

For the current the desert-scene test project test, earlier rounds added procedural blobs, straight grass blades, box seats, and screen overlays. Those changes were tested but do not establish the target's shape language. Use them as a reversible baseline, not an accepted style standard. Prioritize terrain/large rock silhouette, curved growth-based plants, village dwelling proportions/transitions, and temple construction before another global clutter pass.

Retain negative space and navigation. Global processing does not require equal distortion, wear, or detail everywhere. Restore selected regularity where an architectural or mechanical function requires it.

## D. Rebuild color, light and line as a system

Separate object color, lighting/shade and intentional lines as distinct decisions. The technical video is one implementation reference; it does not override the user's accepted palette or preference for deep colored shadow blocks without hatching. Start from the accepted base-color view. Selectively attenuate conflicting crack patterns, PBR highlights, AO or repeated grading; preserve useful original detail, material identity and interaction/emission signals.

Design the following signals explicitly:

1. **Base color**: palette-mapped albedo or a deliberate gradient, distinct from lit scene brightness.
2. **Geometric boundaries**: depth and suitable geometric normals, with perspective-slope rejection and renderer-correct reconstruction.
3. **Intentional internal marks**: artist/generator-authored seams, strata, folds and construction lines. A dedicated mask is preferable when repurposing normal data would corrupt other shading.
4. **Shade signal**: direct lighting/shadow information when available, independently from dark albedo. Luminance-only inference is a documented prototype fallback.
5. **Ink composite**: contours, internal marks, colored shade boundaries and optional hatch applied with the agreed shading, with near/distant simplification.
6. **Final finish**: restrained grading and grain, with UI and transparent effect handling verified.

In Godot, the ordinary screen texture contains shaded color and is not a free diffuse-albedo or shadow buffer. Do not claim access to G-buffer channels that the renderer does not expose. Choose a feasible implementation: controlled per-material NPR lighting, or deliberately implemented auxiliary mask/proxy passes or compositor resources. Extra viewports require camera/geometry/material synchronization and measurable cost. Verify actual version support before adopting any mechanism.

The Unity reference's technique of encoding drawn information into a normal buffer is an artistic experiment, not a general buffer API contract. In Godot, validate prepass behavior and preserve normal validity or use separate detail masks. Test close-up double edges, thin vegetation, sky, skinned meshes, transparency and camera motion. Keep the validated grazing-surface artifact checks from rendering.md.

## E. Composition, habitat and motion

Use scene-enrichment.md after shape/render calibration. Context determines stone and plant placement, material transitions, settlement density, and interior organization. Add visual rhythms and evidence of use. Design sparse secondary motion only where it contributes; keep roots, structural joins and gameplay anchors stable. A global transformation must improve default gameplay views, not just one staged close-up.

## F. Calibration and propagation

Choose representative natural terrain/rock, vegetation, architecture, prop, and animated asset when available; include an interior and outdoor view. Review the following independently:

- Geometry alone: purposeful silhouette, mass/void, flow, irregularity and clean joins.
- Color alone: readable palette and composition without sepia/noise hiding defects.
- Ink/shade alone: intentional line hierarchy and agreed shade marks, no false surface bands.
- Combined still and motion: readable navigation, focal hierarchy, stable drawing and preserved effects.

Record mismatch and revise the responsible stage. Generate several seeded form candidates where useful and choose a coherent family; automatic generation does not eliminate curation. No rule that “passes” a topology test establishes aesthetic success.

Once representative results match the agreed target, apply their recipes to all supported assets/scenes in batches. Preserve resource mappings and authored exceptions. Verify no old material family remains unintentionally visible and no runtime generator restores an obsolete style. Revisit failed families without restarting unaffected work.

Deliver a project-wide status manifest, fixed before/after views, model turnarounds, runtime motion evidence, performance observations, and explicit exceptions. Do not equate a large asset count with success or call the entire game finished after transforming only props.
