# Prompt - SHOT-02-STRAIGHT v4

## REVISION NOTES
- Prior QA: `qa/SHOT-02-STRAIGHT-cand-03.yaml` (prompt_version 3, Cand-03.png)
- Hermes decision: REVISE (fail-closed) — session `20260930_014858_b4f509`
- Blocking: source_fidelity BLOCK + geometry BLOCK — body still too wide vs compact source; front legs still too thick vs slender tapered source
- Soft: commercial_usability WARN (rug texture prominent)
- Same failure family as cand-01 and cand-02 (three consecutive geometry/source_fidelity BLOCKs)
- Keep: light-wood box body, dark two-tone legs, four-leg outward splay, straight-on framing, calm lifestyle backdrop, bare tabletop
- Change smallest set: **much narrower body width** (match attached source compact ratio exactly); **needle-thin tapered dark legs** (stick/dowel, not posts)
- Cycle note: default max 2 revise cycles already used; this is operator-override cycle 3 / escalate path

## JOB
- job_id: DCO-20260930-001
- product_label: Fictional Oak Side Table
- product_class: side-table
- commercial_use: catalog-lifestyle
- generation_mode: MANUAL_CHATGPT_IMAGES
- prompt_version: 4
- revision_round: 3

## SHOT
- shot_id: SHOT-02-STRAIGHT
- shot_type: straight
- purpose: clear front read of proportions and symmetry
- camera_framing: straight-on front elevation, centered, minimal perspective distortion

## SOURCE ANCHOR
- path: source/product-reference.png (ATTACH THIS IMAGE — identity lock)
- identity lock: thick light-wood **box** body + four **needle-slender** dark tapered outward-angled legs
- proportion lock: source body is **compact/narrow** — roughly a short square-ish box, NOT a wide console or chunky rectangle. Prior fails stretched width ~20-40% too wide; target body width ≈ source body width relative to height
- leg lock: each leg is a **thin tapered stick** (dowel-like), slightly thicker at the top join under the body, thinning toward the floor; clear outward splay; diameter reads like a pencil/stick next to the thick body — never furniture posts or stump legs
- demo note: fictional / demo sample only

## MUST PRESERVE
- front elevation proportions matching source **compact** height-to-width (narrower than ALL prior fails: cand-01/02/03)
- left-right symmetry of dark tapered legs
- four-leg count; **needle-slender** cylindrical taper (thinner toward floor), clear outward angle — not thick posts
- thick light wood body profile and grain family (box depth like source, not flattened/wide slab)
- two-tone light body / dark legs contrast
- no invented storage features or metal redesign

## SCENE
Calm bright interior backdrop. **Bare tabletop required** (no plant/books/ceramic on the product) so silhouette and leg geometry stay unobstructed. Soft floor contact shadow only. Product centered. Prefer a **quiet plain floor** (avoid busy high-contrast rugs that compete with leg silhouette). Minimal side props only if behind/beside, never on the top.

## CAMERA
Straight-on front elevation, normal lens (no fisheye). Camera height at mid-body. Centered, level horizon. Full product including feet with **generous breathing room** so the table reads compact in frame (do not fill edge-to-edge — that exaggerated width in prior fails). Avoid low/wide angles.

## LIGHTING
Even soft daylight. Gentle under-table contact shadow. Even left-to-right illumination so symmetry is honest. Do not crush dark legs. Keep leg taper readable via soft side light.

## NEGATIVE / DO NOT CHANGE
- Do not thicken the legs or make them post-like / stump-like / chair-leg chunky (failed three times)
- Do not widen/stretch the body beyond source compact proportions (failed three times)
- Do not warp perspective or hide a leg
- Do not unify finishes into a single wood tone
- Do not load the tabletop with decor
- Do not use a loud patterned rug under the product
- No watermarks, logos, text gibberish, melted geometry
- Human ChatGPT Images only

## OUTPUT EXPECTATION
Single photoreal front-elevation catalog still with **source-faithful needle-slender dark tapered legs** and **narrow compact body proportions** matching the attached source. Save PNG to candidates/SHOT-02-STRAIGHT/ (suggested: `cand-04.png`). Keep prior Cand-03.png, cand-02.png, and ChatGPT v1 file.
