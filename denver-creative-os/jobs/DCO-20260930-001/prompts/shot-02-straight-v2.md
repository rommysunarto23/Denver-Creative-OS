# Prompt - SHOT-02-STRAIGHT v2

## REVISION NOTES
- Prior QA: `qa/SHOT-02-STRAIGHT-cand-01.yaml` (prompt_version 1)
- Hermes decision: REVISE (fail-closed)
- Blocking: geometry BLOCK — legs substantially thicker/less slender than source; body reads too wide/dominant vs compact source proportions
- Soft: source_fidelity WARN; shot_compliance WARN; commercial_usability WARN; tabletop decor distracts from silhouette
- Keep: thick light-wood box body, dark two-tone legs, four-leg outward splay, straight-on framing, calm lifestyle backdrop
- Change smallest set: slim the legs to source taper, restore compact width-to-height, clear the top for silhouette read

## JOB
- job_id: DCO-20260930-001
- product_label: Fictional Oak Side Table
- product_class: side-table
- commercial_use: catalog-lifestyle
- generation_mode: MANUAL_CHATGPT_IMAGES
- prompt_version: 2
- revision_round: 1

## SHOT
- shot_id: SHOT-02-STRAIGHT
- shot_type: straight
- purpose: clear front read of proportions and symmetry
- camera_framing: straight-on front elevation, centered, minimal perspective distortion

## SOURCE ANCHOR
- path: source/product-reference.png
- identity lock: thick light-wood box body + four **slender** dark tapered outward-angled legs
- proportion lock: compact side-table width-to-height — body must NOT read as a wide console or oversized block
- demo note: fictional / demo sample only

## MUST PRESERVE
- front elevation proportions matching source compact height-to-width (not stretched wider)
- left-right symmetry of dark tapered legs
- four-leg count; **slender** cylindrical taper (thinner toward floor), clear outward angle — not thick posts
- thick light wood body profile and grain family (box depth like source, not flattened/wide slab)
- two-tone light body / dark legs contrast
- no invented storage features or metal redesign

## SCENE
Calm bright interior backdrop. **Bare tabletop preferred** (no plant/books/ceramic on the product) so the silhouette and leg geometry stay unobstructed. Soft floor contact shadow only. Product centered. Minimal side props only if behind/beside, never on the top for this revision.

## CAMERA
Straight-on front elevation, normal lens (no fisheye). Camera height at mid-body. Centered, level horizon. Full product including feet with modest breathing room. Avoid low/wide angles that exaggerate body width.

## LIGHTING
Even soft daylight. Gentle under-table contact shadow. Even left-to-right illumination so symmetry is honest. Do not crush dark legs. Keep leg taper readable via soft side light.

## NEGATIVE / DO NOT CHANGE
- Do not thicken the legs or make them post-like
- Do not widen/stretch the body beyond source compact proportions
- Do not warp perspective or hide a leg
- Do not unify finishes into a single wood tone
- Do not load the tabletop with decor for this shot
- No watermarks, logos, text gibberish, melted geometry
- Human ChatGPT Images only

## OUTPUT EXPECTATION
Single photoreal front-elevation catalog still with **source-faithful slender dark tapered legs** and **compact body proportions**. Save PNG to candidates/SHOT-02-STRAIGHT/ (suggested: cand-02.png).