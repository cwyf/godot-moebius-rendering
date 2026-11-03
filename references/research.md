# Research informing the global workflow

Checked 2026-11-02. Repositories and source snippets were read, not installed, executed, or benchmarked. No third-party implementation code is bundled with this skill. Evaluate compatibility and applicable licenses before incorporating code/assets; method-level references are not a claim of a ready Godot conversion pipeline.

## Video: Useless Game Dev

https://www.youtube.com/watch?v=jlKNOirh66E

An earlier attempt was blocked. On this research pass, the browser could access the player and export the complete English transcript. Key frames were sampled; this was not continuous frame-by-frame viewing.

Verified topics and timestamps:

- 0:50–3:13: consistent thin screen-space lines; Sobel on depth and normal data; restrained UV perturbation.
- 3:26–4:06: authored texture information is routed into normal data for outlining. The author identifies close-up double-edge limitations.
- 4:15–5:38: layered hatching responds to brightness. Surface-following alternatives are discussed, but the demo retains screen-space hatching.
- 5:57–6:25: stylized highlight regions are also outlined.
- 6:37–7:19: simple bright colors/gradients, then grading and deliberately low-rate grain changes.

Design consequence: separate base color, intentional internal marks and line-based shade instead of accumulating effects over a noisy lit image. The video does not implement automatic organic mesh reconstruction.

## Windokk: rendering reference, not a Godot package

- Repository: https://github.com/Windokk/MoebiusShaderTest
- Author breakdown: https://windokk.dev/moebius-style-shader-in-ue5/

The author describes normal-Sobel plus depth-Laplacian edges, compositing against diffuse color and adding hatch from a lit-image-based mask. This supports the separation of signals in the proposed design, but the implementation is UE5-specific and cannot simply be pasted into Godot. The prose's printed Laplacian matrix appears inconsistent; derive/check a zero-sum kernel rather than copying the typography.

Repository metadata reports GPL-3.0; its README separately identifies a sample vehicle as CC BY-NC. Do not assume all demo assets share the code license or import that vehicle into a commercial project by default.

## Stylized Rock Blender: inspect a modifier-stack pattern

- Repository: https://github.com/mertnizamoglu/Stylized-Rock-Blender
- Code inspected: https://github.com/mertnizamoglu/Stylized-Rock-Blender/blob/main/StylizedRock.py

Actual code stacks subdivision, two procedural displacements, collapse/dissolve simplification, smoothing, bevel, weighted normals, triangulation and another simplification. It provides different rock presets. Useful as an example of staged form processing; it is not suitable for every asset category and its final planar look may itself be too geometric for a selected reference.

The bake operator copies an object but applies modifiers to the active original. High subdivision defaults and world-scale displacement strengths are not safe project defaults. Adapt and test in staging rather than running unreviewed operators on the user's scene. The search metadata reported GPL-3.0; code reuse requires confirming the repository license at adoption time.

## Blender Rock Generator: limited natural-asset example

- Repository: https://github.com/lupin4/Blender-Rock-Generator
- Code inspected: https://github.com/lupin4/Blender-Rock-Generator/blob/main/procedural_rock.py

The script starts from a cube, subdivides, applies Voronoi displacement, reduces polygons and offsets vertices. It demonstrates a small reproducible modeling pipeline, but arbitrary per-vertex offsets are not a universal organic-form solution. The script explicitly calls scene cleanup at startup. Reuse ideas only through an isolated, source-preserving adapter. Metadata reports MIT.

## Infinigen: asset families and procedural organization

https://github.com/princeton-vl/infinigen

The project provides procedural nature, interiors and articulated-asset generation routes. Its relevant lesson is category-specific generation and structured asset/scene production. Its stated target is photorealistic worlds, so its appearance, dependency footprint and output complexity should not be adopted as the Moebius style itself. The reviewed main README was on its V2 route; verify the selected branch/environment before implementation. Metadata reports BSD-3-Clause; check individual dependencies/assets separately as needed.

## Sverchok: optional parametric authoring

https://github.com/nortikin/sverchok

Its README describes node-based geometry, curves, scalar/vector fields, solids, and Python custom nodes. This is a possible authoring tool for growth/field-driven families, not an automatic conversion of arbitrary existing meshes. Use only if its benefit warrants an additional Blender dependency. Metadata/README identify GPL-3.0.

## Godot search result not adopted

https://github.com/JoshuaManuel/Art-Shader

The inspected ArtShader.gdshader reconstructs depth with a particular NDC convention; Moebius.gdshader uses derivatives of screen color. These files do not establish the full color/detail/shade pipeline proposed here. No reusable license was confirmed, and runtime compatibility was not tested. Do not treat the repository name as evidence of production readiness.

## Primary documentation for implementation

- Blender remesh: https://docs.blender.org/manual/en/latest/modeling/modifiers/generate/remesh.html
  Describes topology regeneration, voxel volume reconstruction and limitations for thin/flat input.
- Blender displacement: https://docs.blender.org/manual/en/latest/modeling/modifiers/deform/displace.html
  Documents texture-based displacement and influence control using vertex groups.
- Godot screen inputs: https://docs.godotengine.org/en/stable/tutorials/shaders/screen-reading_shaders.html
- Godot depth reconstruction: https://docs.godotengine.org/en/stable/tutorials/shaders/advanced_postprocessing.html

Category recipes, global profiles, protected-region handling, propagation status and aesthetic gates in this skill are our proposed synthesis. They have not been proven as a universal converter by these references or by earlier the desert-scene test project experiments.
