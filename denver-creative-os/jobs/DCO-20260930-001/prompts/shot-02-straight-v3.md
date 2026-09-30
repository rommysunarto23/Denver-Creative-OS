# Prompt - SHOT-02-STRAIGHT v3

## REVISION NOTES
- Prior QA: `qa/SHOT-02-STRAIGHT-cand-02.yaml` (prompt_version 2, cand-02.png)
- Hermes decision: REVISE (fail-closed)
- Blocking: source_fidelity BLOCK + geometry BLOCK — body still too wide/oversized vs compact source; legs still too thick vs slender tapered source
- Soft: commercial_usability WARN
- Keep: light-wood box body, dark two-tone legs, four-leg outward splay, straight-on framing, calm lifestyle backdrop, bare tabletop
- Change smallest set: **narrow body width** to source compact ratio; **thin legs** to distinctly slender taper (not posts)
- Also prior v1 fail (cand-01): same geometry family — treat this as cycle 2 / last default revise before escalate

## JOB
- job_id: DCO-20260930-001
- product_label: Fictional Oak Side Table
- product_class: side-table
- commercial_use: catalog-lifestyle
- generation_mode: MANUAL_CHATGPT_IMAGES
- prompt_version: 3
- revision_round: 2

## SHOT
- shot_id: SHOT-02-STRAIGHT
- shot_type: straight
- purpose: clear front read of proportions and symmetry
- camera_framing: straight-on front elevation, centered, minimal perspective distortion

## SOURCE ANCHOR
- path: source/product-reference.png
- identity lock: thick light-wood box body + four **very slender** dark tapered outward-angled legs
- proportion lock: **compact** side-table — body width roughly similar to source (NOT a wide console / chunky block). Body height is a thick slab, but width stays narrow/compact.
- leg lock: each leg is thin like a tapered stick/dowel that flares slightly at the top join and thins toward the floor; clear outward angle; never thick furniture posts
- demo note: fictional / demo sample only

## MUST PRESERVE
- front elevation proportions matching source **compact** height-to-width (narrower than prior fails)
- left-right symmetry of dark tapered legs
- four-leg count; **distinctly slender** cylindrical taper (thinner toward floor), clear outward angle — not thick posts
- thick light wood body profile and grain family (box depth like source, not flattened/wide slab)
- two-tone light body / dark legs contrast
- no invented storage features or metal redesign

## SCENE
Calm bright interior backdrop. **Bare tabletop required** (no plant/books/ceramic on the product) so silhouette and leg geometry stay unobstructed. Soft floor contact shadow only. Product centered. Minimal side props only if behind/beside, never on the top.

## CAMERA
Straight-on front elevation, normal lens (no fisheye). Camera height at mid-body. Centered, level horizon. Full product including feet with modest breathing room. Avoid low/wide angles that exaggerate body width. Prefer slight distance so the table reads compact, not filling the frame edge-to-edge.

## LIGHTING
Even soft daylight. Gentle under-table contact shadow. Even left-to-right illumination so symmetry is honest. Do not crush dark legs. Keep leg taper readable via soft side light.

## NEGATIVE / DO NOT CHANGE
- Do not thicken the legs or make them post-like / stump-like
- Do not widen/stretch the body beyond source compact proportions (this failed twice)
- Do not warp perspective or hide a leg
- Do not unify finishes into a single wood tone
- Do not load the tabletop with decor
- No watermarks, logos, text gibberish, melted geometry
- Human ChatGPT Images only

## OUTPUT EXPECTATION
Single photoreal front-elevation catalog still with **source-faithful slender dark tapered legs** and **narrow compact body proportions** matching the attached source. Save PNG to candidates/SHOT-02-STRAIGHT/ (suggested: cand-03.png). Keep prior cand-02.png and ChatGPT v1 file.
