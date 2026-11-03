# Making procedural scenes feel alive

Use for AI/Python-generated models and Godot environments that feel empty, uniformly scattered, mechanically perfect, or lacking contextual detail. The outcome is a place with believable spatial relationships and an illustrated visual hierarchy. More objects, more polygons, more noise, or more wear are not goals by themselves.

## 1. Read the scene and its generation pipeline

Inspect the playable view, ground-level view, silhouettes, focal points, and a close model view. Locate the actual source: Python/Blender scripts, exported meshes, Godot procedural mesh builders, scatter data, shaders, and hand-authored overrides. An exported GLB does not prove the Python generator exists locally. Report unavailable authoring sources rather than inventing their structure.

Record what already works, empty versus intentionally quiet areas, primitive-looking forms, repetition, asset scale, material detail, and traversal/interaction exclusions. Read the project's narrative before adding cultural objects. An original world's vocabulary takes precedence over generic desert stereotypes; avoid adding bones, abandoned weapons, religious symbols, or damage that implies an unapproved history.

For each proposed addition, state its purpose, contextual location, approximate physical scale relative to the player, preferred representation, and cost. Use actual camera distance and pixel footprint to choose geometry versus painted marks. Tune one visible patch and one representative model before expanding across the world.

## 2. Work across scales

| Scale | Examples | Decision |
| --- | --- | --- |
| Large | landform breaks, building proportions, silhouettes, routes | Establish composition and navigation before dressing |
| Medium | wall bases, ribs, buttresses, recesses, ledges, rock groups | Break primitive forms and connect structures to the ground |
| Small | pebbles, dry grass clumps, threshold debris, joints, small tools | Place in meaningful clusters and visible locations |
| Surface | sand ripples, sediment edges, fine grains, subtle scratches | Prefer restrained material/mesh coloration when separate geometry adds no readable shape |

Keep a density hierarchy: focal clusters, supporting clusters, and quiet ground. Retain clean sky, open travel space, readable landmarks, and breathing room between details. A dense close-up is not proof that the walking camera looks better.

## 3. Desert ground and small assets

### Pebbles and rock fragments

- Build related variants with distinct silhouettes: squat angular pieces, flatter chips, rounded weathered stones. Vary proportions and vertex positions with bounded, correlated deformation; do not merely resize identical spheres or independently randomize every vertex.
- Relate fragment shape and color to nearby larger rocks or construction material. Use small groups, scattered outliers, and sparse open patches. Accumulate material at outcrop bases, depressions, and wall feet where plausible.
- Partially embed stones to avoid floating contact and expose a stable resting face. Check intersections and terrain contact after terrain generation/flattening, not before.
- Avoid outlining every pebble as heavily as a building. Reduce micro-detail density or line contribution if distant stones become black dots or sparkle during movement.

### Dry grass and desert plants

- Use sparse tufts with varied stem count, height, lean, and a coherent root. Combine a few recognizable silhouettes rather than large numbers of identical upright spikes.
- Put plants in locally plausible pockets: sheltered cracks, terrain depressions, or around rocks. Species and density should match the world's climate; a desert does not require grass everywhere.
- Share a broad wind direction with small local variations. Keep roots fixed, bend increasingly toward tips, and avoid synchronized motion. Static grass is acceptable if movement is outside scope; living detail does not require animation everywhere.
- Choose simple blade geometry or cards based on the camera and renderer; test alpha edges, backfaces, shadows, and outlining. Do not trade the grass's shape for transparent shimmer.

### Sand, paths, and transitions

- Layer broad sand color variation, directional ripples, local accumulation, and sparse fine grains. Keep ripple scale consistent with the scene and dominant wind; do not turn all ground into a uniform noisy carpet.
- Make traveled routes quieter or more compacted, with detail collecting near their edges. Use dust/sand skirts and sediment transitions where structures meet terrain.
- Introduce footprints, wheel tracks, or tool marks only when supported by actual activity or the scene's fiction. They should lead somewhere and match scale and direction.
- Use mesh vertex colors, shader masks, authored patches, decals, or shallow geometry as appropriate. Verify depth separation and renderer support before choosing an API; avoid z-fighting and hovering overlay planes.

## 4. Contextual placement instead of uniform randomness

Represent a scatter layer with variant family, seed, density, cluster scale, scale range, slope/height limits, contact offset, orientation policy, exclusions, and distance visibility. Use project-specific values rather than universal asset counts.

A useful placement model combines broad biome/region suitability, cluster density, local jitter, terrain constraints, and exclusion masks. Distance to rocks, walls, paths, entrances, and focal props can guide density. Mix a few authored anchor clusters with reproducible procedural fill. Pure uniform random and perfectly even Poisson spacing can both look artificial when used without composition.

Protect door swings, walkable width, steps, quest objects, sightlines, interaction reach, camera clearance, and NPC routes. Decorative scatter should not silently add collision or navigation cost. Give collision only to objects whose size and gameplay role require it.

Use a stable seed and stable region/layer identities so regenerating one area does not rearrange the whole world. Permit explicit per-cluster overrides and preserve hand-placed work. Regeneration should be idempotent: replace only owned generated output, not append duplicates or remove unrelated nodes.

### Preserve richness without repeating a decoration kit

When cleaning the renderer makes a scene empty, identify which removed details conveyed material, construction or use and restore/rebuild those selectively. Do not restore all noise or delete all texture globally. Distinguish meaningful medium detail from dense micro-speckle that flickers in motion.

Vary dwelling families by plausible construction, shelter, repair and use, with asymmetric groups and quiet areas. Ground square-confetti patterns and stretched wall streaks are material defects, not richness. Inspect default walking views through settlements and outskirts: broad exclusion circles can protect navigation yet accidentally eliminate every visible wall-base or village-edge detail. Use narrower gameplay masks and deliberate contextual clusters where needed.

### Wind cues chosen for the project

If the user chooses tumbleweeds instead of line particles, keep that decision in the project profile and verify the rejected particles are absent. Review rolling direction, apparent ground contact, obstacle/bounds behavior and sparse coherent plant movement. A looping translation or decorative mesh is not automatically a physical simulation; describe the actual implementation. Do not impose tumbleweeds on unrelated biomes or projects.

## 5. Improve the model, including internal detail

### Shape and construction

- Identify primitive assembly artifacts: perfectly cylindrical columns, thin box walls, repeated identical arches, uniform rim thickness, floating bases, and disconnected intersections.
- Add structural hierarchy: base, main body, supporting elements, openings, and termination. Useful features include plinths, collar rings, recessed panels, realistic wall thickness, window reveals, and connected joints.
- Introduce controlled asymmetry and edge variation at visible scales. Preserve supports, attachment points, UV seams, and intentional symmetry. Do not make every surface broken or every edge chipped.
- Use bevels or explicit edge profiles where highlights and ink benefit; set hard/smooth normals deliberately. Inspect triangulation and normal continuity with the actual outline shader. More subdivisions alone do not make a model convincing.

### Detail within the model's silhouette

Recessed seams, grooves, layered stone courses, inset motifs, fastening points, sockets, cracks, and small supporting components can give a simple shape internal organization. Choose details that explain construction or function. Use real geometry for visible recess/parallax or shadow needs, and textures/vertex colors for flat marks; do not outline every tiny engraving at all distances.

### Interior spaces and cavities

Where players can see or enter a model, check wall thickness, opening reveals, undersides, room-to-room transitions, beams, ceiling support, alcoves, stairs, thresholds, and light entry. Avoid an elaborate exterior surrounding a blank or unlit interior.

Place a small number of functional groups appropriate to the space: seating/rest areas, storage niches, workshop implements, or the project's established instruments. Relate each cluster to human scale, circulation, use, and lighting. A prop implying habitation or ritual must fit the existing fiction. Keep interiors playable and do not change puzzle layouts to accommodate decoration.

## 6. Refine Python/procedural model structure

Modify the real source generator when available, and regenerate into a staging/copy location. Preserve a clear chain from generator and parameters to export and Godot resource. Do not patch only a generated mesh while claiming the workflow is reproducible.

Separate responsibilities at the level the project warrants:

- Semantic parameters: overall dimensions, component proportions, opening positions, material families, seed, detail level.
- Shape builders: reusable base/body/opening/support components with consistent axes, units, pivots, and local transforms.
- Detail generation: named structural details and optional fine details, rather than one monolithic random mesh operation.
- Export/integration: stable object/material names, output ownership, transform application, material slots, collision proxies where required, and optional simpler distance variants.

Keep topology and deformation bounded around openings and joins. Check negative scale, winding, invalid/degenerate faces, normals, UV stretching, disconnected fragments, and unexpected export transforms. Reuse material resources and variant meshes. Select seeds deliberately for attractive shapes instead of accepting the first generated batch.

Prefer a small validated family with editable parameters to dozens of unreviewed assets. Refactoring should serve reproducible visual improvement; do not rewrite an unrelated modeling pipeline just to impose a preferred architecture.

## 7. Integrate with the hand-drawn renderer

The combined image is the acceptance target. Test small details with outlining on and off; adjust their size, density, material detail, or outlining contribution if they merge into ink. A surface should not simultaneously carry dense geometry, contrasty procedural cracks, grain, hatching, and equally strong outlines everywhere.

Batch repeated decorations with shared resources; in Godot, consider spatially chunked MultiMesh groups rather than one node per pebble or a world-sized batch with poor culling. Choose visibility distances and simplification by pixel footprint. Treat transparency, shadows, wind animation, collision, and node count as separate costs. Profile a representative dressed region before filling the entire map.

## 8. Review and deliver

Compare fixed before/after camera views at walking distance and close range. Inspect a silhouette view and an interior when relevant. Walk past clutter, orbit the camera, inspect terrain transitions and distant detail; ensure landmarks, routes, interactions, and UI remain readable.

Check visual improvements individually: material/ground detail, scatter, structural model changes, internal/interior details. Provide toggles or a reversible layer structure where useful. Check regenerated output for duplicates and mismatched collisions. Report observed frame time/FPS at stated resolution/hardware, not an assumed benefit from batching.

Deliver a brief account of what now feels more specific, generator/resource changes, reproducible parameters/seeds, comparison images, validation, and remaining limits. Distinguish skill instructions from work actually executed: updating this reference does not mean a game scene has been enriched or a Python model regenerated.
