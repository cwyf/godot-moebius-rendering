# Architectural joinery, openings and grounded props

Read when doors pierce frames, windows lose their trim at distance, awning supports float, or ladders fail to touch the wall/ground. Preserve accepted palette and distance-aware line hierarchy; repair geometry and attachment rather than globally darkening or thickening the renderer.

## Use a contact graph, not unrelated offsets

List the actual connections: wall → opening → reveal → frame/trim; wall → ledger → canopy → front beam → posts → ground; wall → ladder top and each ladder foot → ground. Name these parts and derive both sides of a joint from shared anchors. Add controlled irregularity between endpoints; keep contacts constrained. Intentional embedment for a joint is different from uncontrolled penetration.

Read the actual mesh/profile/transform. A radius guessed from an AABB or a generic cylinder can disagree with an organic shell. Use the source surface recipe, a mesh query or a suitable collision query, and state which represents the visible wall. Keep local/world transforms consistent, including opposite facades and non-flat ground. Cache surface data when many samples would otherwise slow generation.

## Arched openings on curved walls

A rectangular black plane is not an arched doorway. Its upper corners can protrude beyond the inner arch even when the outer frame looks correct. Derive the dark infill contour from the inner opening, leave a controlled covered margin, and inspect the complete perimeter from front and side.

A large triangle fan over a curved wall can cut through it between sampled points. Tessellate/conform the infill or construct the real opening, with deliberate layer order and small bounded separation; do not push the whole opening far away to hide the intersection. Check the bottom edge, apex, jambs, sill and side view. An overlaid dark infill is only a visual recess, not an enterable hole; actual playable openings require wall thickness, collision and navigation changes within the requested scope.

## Windows that read as assembled structures

Derive facade orientation from the actual local wall normal. Model the wall-to-frame collar, a restrained bevel/reveal, sill, inset plane and visible dark gasket/inner border as distinct functional layers. Seat their rear surfaces against the wall instead of leaving an independent box hovering in front. Keep the gasket's physical width and contrast readable at default middle/far walking views while preserving the accepted overall near/far hierarchy; do not disable global distance fading just to rescue one window.

Place shutter pivots at real hinge pins. The leaf, straps and hinge should share their reference frame; add opening rotation after establishing the joint. Seat existing lit-window planes and decorative glow in the new reveal rather than leaving a duplicate light patch on the wall. Preserve actual lighting/gameplay signals unless a change is authorized.

## Canopies and supports

Choose wall ledger, front beam, span, pitch, cloth sag and support locations together. Sample the actual canopy underside/beam for each post top; do not infer its height from the centre alone. Rotation and sag change corner heights. A post must meet the beam, not stop below a visually nearby canopy or stand outside its width. Shape bracing and rope around those same joints.

Fit the rear attachment to the curved wall, including the ends of the ledger. Ground each post separately on the actual terrain. Preserve passage width, headroom and door access. Vary handmade timber and cloth between fixed endpoints instead of displacing their contact points.

## Ladders and small props

Place ladder tops against the wall and solve the two feet independently on terrain, then build rails and rungs from those anchors. A position plus an arbitrary rotation does not establish support. Give each rung endpoints on the rail curves, choose a plausible lean, and keep the ladder outside door/window operation and travel space. Curvature must vanish at constrained contacts.

Apply the same ground/contact check to vessels, thresholds and foundation fragments after changing the facade. Do not silently add colliders to decorative joinery or turn a visual doorway into a gameplay entrance.

## Validate the assembled result

Inspect front, oblique/side and close joint views, then the default middle/far gameplay view with the real renderer. Audit every supported instance/variant and lit-window case, not one attractive house. Include a short camera movement check for z-fighting and disappearing gasket lines.

Use independent geometry checks where useful: query rendered triangle surfaces or exported geometry, measure post-to-canopy/beam relation, ladder-to-wall distance and each ground endpoint. Judge distances against physical component radii/thickness and intended embedment; demanding zero centreline separation would falsely reject a good joint. A stored anchor or a node name alone does not prove mesh contact.

In the desert-scene case, 8 houses, 16 posts and 4 ladders were inspected at 1600x900 and 1280x720. Independent point-to-rendered-triangle measurements found post tips within about 20.3 mm of the cloth underside, bridged by the 55 mm-radius front beam; ladder rail centres were about 26 mm from the wall with 29 mm rail tips, and feet were grounded/embedded by their radii. These are scene-specific dimensions, not universal tolerances. Door infills were surface-tessellated after an initial triangle fan exposed wall triangles. Windows gained visible gaskets, reveals, sills and actual hinge pivots.

Record implemented contacts, checked variants, preserved constraints and remaining visual approximations. Screenshots, contact measurements and runtime compilation complement each other; none establishes universal style conversion or full gameplay acceptance.
