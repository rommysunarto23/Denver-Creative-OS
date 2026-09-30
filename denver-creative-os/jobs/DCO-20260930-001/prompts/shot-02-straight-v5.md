# Prompt - SHOT-02-STRAIGHT v5 (STRATEGY REWRITE)

## REVISION NOTES
- Prior QA: `qa/SHOT-02-STRAIGHT-cand-03.yaml` (prompt_version 3, Cand-03.png)
- Operator choice: **rewrite strategy**, then drop cand-04 (not a polish of v4)
- Diagnosis: source body is **compact** — height ≈ **1/3–2/5** of full product height; width reads **square/compact**, not console-wide. Legs are **slender stick/dowel**, dark, tapered. cand-01/02/03 all failed **wide body + thick legs**.
- Why rewrite: v1–v4 repeated "needle" language but also kept **"thick body"** wording; that tension pulled the model toward chunky/wide bodies and post-like legs. Drop "thick" as a body cue.
- Strategy change: numeric ratio locks; "vertically deep slab, horizontally compact"; hard match-to-reference; **plain studio / solid floor or black void** (no rug/sofa/lifestyle clutter this revise).

## JOB
- job_id: DCO-20260930-001
- product_label: Fictional Oak Side Table
- product_class: side-table
- commercial_use: catalog-lifestyle
- generation_mode: MANUAL_CHATGPT_IMAGES
- prompt_version: 5
- revision_round: 4
- strategy: rewrite (not v4 polish)

## SHOT
- shot_id: SHOT-02-STRAIGHT
- shot_type: straight
- purpose: clear front read of proportions and symmetry
- camera_framing: straight-on front elevation, centered, minimal perspective distortion

## SOURCE ANCHOR (IDENTITY + PROPORTION LOCK)
- path: `source/product-reference.png` — **ATTACH THIS IMAGE**
- **Match the attached reference photo proportions exactly.** Treat the photo as the sole proportion authority; do not invent a wider or taller body.
- Body: light wood; **vertically deep slab, horizontally compact** (square-ish footprint in front elevation — NOT a wide console, NOT a long rectangular bench). Avoid the word/idea "thick/chunky mass"; depth is vertical slab depth, width stays compact.
- Numeric ratios (front elevation):
  - **Body height ≈ ⅓–⅖ of full product height** (legs dominate the vertical span).
  - **Body width: compact / near-square** relative to body height — not a wide console.
  - **Leg diameter ≪ body thickness** — each leg reads as a **pencil / stick / thin dowel**, tapered (slightly thicker at the top join under the body, thinning toward the floor), clear outward splay.
- Four dark legs; two-tone **light body + dark legs** only.
- Demo note: fictional / demo sample only.

## MUST PRESERVE
- Straight-on front elevation matching SHOT-02 plan (centered, level, minimal perspective distortion)
- Source-faithful compact body height-to-width (body short vs full height; not console-wide)
- Left-right symmetry of four dark tapered stick legs
- Outward splay; pencil/dowel thickness — never posts
- Two-tone light body / dark legs contrast
- No invented drawers, shelves, metal redesign, or hardware

## SCENE (CLEAN STUDIO THIS REVISE)
**Plain studio or solid floor, or black void.** No rug, no sofa, no lifestyle clutter, no side props. Soft contact shadow under feet only. Product centered on empty ground so silhouette and leg thinness stay unambiguous.

## CAMERA
Straight-on front elevation, normal lens (no fisheye / no wide-angle stretch). Camera height at mid-body. Centered, level horizon. Full product including feet with **generous breathing room** so the compact body does not fill the frame edge-to-edge (edge-fill exaggerated width in prior fails). Avoid low/wide angles.

## LIGHTING
Even soft daylight / soft studio key. Gentle under-table contact shadow. Even left-to-right so symmetry is honest. Keep dark stick legs readable (do not crush blacks). Soft side fill so taper is visible.

## NEGATIVE / DO NOT
- Do **not** make a **wide console** or stretched rectangular body
- Do **not** make **post-like / stump / chair-leg-chunky** legs — diameter must stay ≪ body thickness (pencil/stick)
- Do **not** use "thick chunky body" mass language in the render — body is a **compact vertically deep slab**
- Do **not** add rug, sofa, plants, books, ceramics, or lifestyle clutter
- Do **not** warp perspective, hide a leg, or unify finishes into one wood tone
- No watermarks, logos, text gibberish, melted geometry
- Human ChatGPT Images only

## OUTPUT EXPECTATION
Single photoreal **straight-on front elevation** catalog still: **source-matched compact body** (height ≈⅓–⅖ of product; horizontally compact) + **pencil-thin dark tapered stick legs** + two-tone light body / dark legs on **plain studio / solid floor or black void**. Save PNG to `candidates/SHOT-02-STRAIGHT/` (suggested: `cand-04.png`). Keep prior Cand-03.png, cand-02.png, and ChatGPT v1 file.
