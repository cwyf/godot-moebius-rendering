# Sources and evidence boundaries

Research checked 2026-11-02. Recheck version-sensitive Godot behavior at implementation time.

## User-provided references

- Video: https://www.youtube.com/watch?v=jlKNOirh66E
  - Initial access returned a sign-in/bot-verification page. A later browser pass on 2026-11-02 accessed the player, sampled frames, and read its full exported English transcript. See research.md for verified timestamps and methods. Do not describe this as continuous frame-by-frame viewing.
- Montrouge Grand Prix: https://uselessgamedev.itch.io/montrouge-grand-prix
  - Author identifies it as a proof of concept for a Moebius-style hand-drawn renderer.
  - In author replies, confirms Unity and describes screenspace processing as applying the shader to the final image and treating dark areas as shade/shadows.
  - Inspected screenshot shows thin dark contours, warm terrain, blue/cyan sky, diagonal and crosshatched shade. Exact edge/noise algorithms were not confirmed from source code.
  - Page screenshots are suitable for visual study. Do not redistribute them as the user's original art or assume the demo's code is freely licensed.
- Moebius official site: https://www.moebius.fr/
  - Art-direction reference, not shader documentation. Site and one Edena artwork thumbnail were inspected; no exhaustive catalog study was performed. Use the specific requested artwork rather than reducing the artist's varied work to a single palette.
- Cara artwork: https://cara.app/post/06e313c5-f353-46b3-9ded-5e6ab0bc5462
  - Initial request returned HTTP 403. Artwork contents and authorship were not inspected or verified.

## Primary technical documentation

- Godot advanced post-processing:
  https://docs.godotengine.org/en/stable/tutorials/shaders/advanced_postprocessing.html
  Full-screen mesh, depth reconstruction, reverse-Z, NDC conventions, culling.
- Godot screen-reading shaders:
  https://docs.godotengine.org/en/stable/tutorials/shaders/screen-reading_shaders.html
  Screen/depth/normal-roughness inputs, renderer restrictions, screen-copy timing.

The initial research did not produce a runnable shader. Later the desert-scene test project test-copy work implemented and visually tested a limited depth/normal outline, luminance-based hatch and scene-detail prototype. That prototype does not establish global stylistic equivalence. The later global workflow adds verified video/third-party research; its full model reconstruction and separated-color migration remain a proposal until implemented and tested. Separate video-confirmed methods from our engineering choices using research.md.
