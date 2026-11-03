# Category-aware organic modeling

This is a proposed modeling workflow, not a claim that a universal organicizer has been implemented. Inspect each asset's purpose and source. Preserve original geometry and protected interfaces. Read research.md for evaluated examples and limitations.

## What makes geometry mechanical

Common causes are exposed primitive silhouettes, identical cross-sections, straight growth axes, equal spacing, abrupt part intersections, repeated noise amplitude at every scale, and texture marks with no relationship to shape. Diagnose in silhouette and a plain clay material. Address the generator's construction logic, not merely the mesh's shading normals.

Do not substitute independent per-vertex random displacement for designed shape. Do not apply smoothing until everything melts. Geometry should have dominant masses and quiet areas, supported medium forms, and restrained tertiary detail. A coherent bend, taper, erosion direction or growth pattern provides organization.

## Recipes by category

| Category | Construction approach | Protected properties |
| --- | --- | --- |
| Rock/outcrop | asymmetric connected masses, broad warp, selected planes, restrained erosion | ground contact, readable mass, passage clearance |
| Plants/roots | curve or growth skeleton with variable taper, branching, gravity/wind response | rooted base, species character, collision/gameplay clearance |
| Terrain | broad landform first, drainage/wind-informed secondary forms, sparse local erosion | traversal slopes, settlement footprints, transitions/collision parity |
| Handmade architecture | deliberate plan and supports, varied profiles, curved/chamfered transitions and controlled wall irregularity | foundations, wall thickness, openings, stairs, door swings |
| Tools/props | functional core with shaped grip, material-specific edges and connected parts | handles, sockets, animation/interaction pivots |
| Rigged body/cloth | topology-preserving broad shape and fold edits, masked by joints/seams | skin weights, joints, blend shapes, animation bounds |

Architectural regularity is allowed, but avoid perfectly repeated primitives where hand-built material is intended. Columns can taper and vary slightly; arch transitions can be continuous; walls can have differentiated foot/body/rim profiles. Recesses and voids should have credible thickness. Do not distort every opening or make every building a melted clay mound.

## Route 1: preserve topology and form constraints

Use when UVs, rigging or intended construction are important. Build masks for roots, joins, flat contacts, sockets, hinge regions, openings and marked hard edges. Apply low-frequency coherent bend/twist/lattice deformation where appropriate, with amplitude relative to asset scale and semantic region. Add medium forms with smooth falloff. Limit deformation near protected areas and check surface intersections and thickness.

Normals/smoothing, selective beveling and detail masks follow the form edit. They do not replace a silhouette change. If a low-resolution primitive cannot represent the intended shape, rebuild/subdivide it deliberately and document topology consequences rather than pushing its few vertices harder.

## Route 2: reconstruct static organic masses

For disposable-topology natural assets, combine shaped masses using a controlled union/voxel-remesh or an implicit-field workflow when those tools are available. Curve-driven surfaces suit stems, roots and branching structures. Resolve visible primitive intersections at the intended connection, while preserving intentional gaps and cavities.

A possible offline stack is: semantic massing → broad deformation → join/remesh where needed → medium-form displacement → controlled smoothing/planar simplification → selected edge treatment → normals/UV/material/detail → game mesh and collision export. This order is a starting design, not a fixed recipe for every object.

For Blender, choose remesh resolution relative to the smallest feature that must survive. Coarse voxels can fill openings or destroy thin features; small voxels can explode memory and triangle count. Remeshing changes topology and should not be applied blindly to rigged assets. Transfer or rebuild UVs, material assignment and collision proxies as necessary. Inspect the result, not just whether the operation returned success.

## Route 3: rebuild at the generator level

Prefer this when mechanical appearance comes from loops that repeat identical cylinders, boxes or circular sections. Replace the abstraction:

- A plant becomes a centerline plus taper and branching grammar rather than a stack of rigid rectangles.
- A rock becomes a curated mass/plane structure rather than a sphere with high-frequency noise.
- A dwelling becomes foundations, thick wall profiles, openings, roof transitions and interior spaces rather than an intersecting cylinder and sphere.
- A stone seat becomes an intentionally shaped slab and support system with connected proportions rather than generic stacked boxes.

Keep semantic parameters separate from mesh construction, detail and export. Each output records recipe version, seed, source identity, dimensions, protected anchors and resource mapping. Generated structures should be reproducible and owned so reruns replace only their outputs.

## Organic surface detail

Place strata according to material flow, folds according to tension, cracks according to structural context, and wear according to contact/exposure. Use geometry only when silhouette, parallax or shadow needs it. Use explicit line masks for flat drawn detail rather than high-contrast noise over every surface. Remove old procedural crack/grain layers if they compete with the new geometry or become outlined twice.

## Rounded lighting and material projection

Inspect a rounded roof/body in a plain lit material before treating rectangular shade patches as a texture defect. Flat normals shared within each quad, split seams and a coarse profile can create visible rectangular tone cells; use appropriate continuous normals across smooth regions while preserving deliberate creases. Isolate self-shadow and cascade/filter artifacts separately. Extra subdivision or ink contrast alone is not a reliable remedy.

After shape edits, inspect UV/triplanar scale and direction around the entire surface. A discrete dominant-axis projection can leave bands; cell-based noise can expose grids. Detail should follow construction/material flow without stretching into vertical stripes or flattening into a tiled speckle carpet. Recheck moving and distant views rather than compensating with full-screen blur.

For architectural contact graphs, curved-wall openings, canopy supports and leaning props, read [architectural-joinery.md](architectural-joinery.md).

## Validation

Compare silhouette, front/side/three-quarter clay views, wireframe, final material and default gameplay distance. Check contact, disconnected parts, winding/normals, nonmanifold areas when relevant, triangle/material budgets, UV distortion, openings, and bounds. For changed collision-critical geometry verify visual/collision agreement; for animated assets test representative poses and extreme joint motion.

Review at least one static and one moving camera view with the final line renderer. Reduce detail or line contribution when curves turn into ink clutter or plants flicker. A procedural candidate can be structurally valid and aesthetically poor; reject it rather than increasing texture noise to hide it.
