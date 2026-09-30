# COMPARISON.md — gpt-6-luna (prior) vs gpt-6.1-sol (retest)

**Job:** DCO-20260930-001  
**Retest folder:** `jobs/DCO-20260930-001/retest-sol/` (does **not** overwrite delivered package)  
**When:** 2026-09-30 ~16:19–16:28 Asia/Makassar (UTC+8)  
**Images reused (no Image API / no ChatGPT Image regen):**
- `source/product-reference.png`
- SHOT-01: `candidates/SHOT-01-ANGLED/ChatGPT Image Sep 30, 2026, 09_14_19 AM.png`
- SHOT-02: `candidates/SHOT-02-STRAIGHT/Cand-04.png` (+ Cand-03 staged, not primary)
- SHOT-03: `candidates/SHOT-03-MEDIUM-CLOSE/ChatGPT Image Sep 30, 2026, 09_16_32 AM.png`

**Hermes now:** `gpt-6.1-sol` / reasoning **medium** default; **high** only for hardest SHOT-02 visual QA.

---

## Headline answer

| Question | Answer |
|----------|--------|
| Did Sol PASS geometry on Cand-04 where luna FAILed? | **No.** Sol Medium **and** Sol High both keep `geometry: BLOCK` → `decision: REVISE` on Cand-04. |
| Does architecture change alone flip SHOT-02 PASS? | **No.** Same pixels; Sol High explicitly: *"Changing the evaluator architecture, model, or reasoning effort alone does not flip this unchanged candidate to geometry PASS."* |
| Did Sol brief differ materially from luna? | **Mostly no on identity; yes on prompt strategy tone.** Intake still: compact square-ish body, ~1/3 body height, slender splayed dark legs, two-tone. Sol prompt draft **softens** v5's numeric ratio + "pencil/stick thin" language. |
| Side effect | Sol Medium is **stricter** on SHOT-01 and SHOT-03 (both REVISE) where luna had APPROVE. |

---

## Decision matrix (Hermes recommendation only)

| Shot | Candidate | luna prior | Sol Medium | Sol High (SHOT-02 only) |
|------|-----------|------------|------------|-------------------------|
| SHOT-01-ANGLED | cand-01 ChatGPT | **APPROVE** (fid/geo PASS) | **REVISE** (fid BLOCK, geo BLOCK) | n/a |
| SHOT-02-STRAIGHT | Cand-04 | **REVISE** (fid BLOCK, geo BLOCK); human override APPROVED | **REVISE** (fid BLOCK, geo BLOCK) | **REVISE** (fid BLOCK, geo BLOCK) — confirms Medium |
| SHOT-03-MEDIUM-CLOSE | cand-01 ChatGPT | **APPROVE** (fid/geo PASS) | **REVISE** (fid BLOCK, geo BLOCK) | n/a |

luna evidence files: `qa/SHOT-*-cand-*.yaml` (`hermes_model: gpt-6-luna`).  
Sol evidence files: this folder `*-sol-medium.yaml` / `*-sol-high.yaml`.

---

## SHOT-02 Cand-04 detail (apple-to-apple)

### luna (prior)
- Session: `20260930_074206_a40aa0`
- Fail family: wide/shallow body; body height below 1/3–2/5; legs too thick / insufficiently tapered
- Other criteria mostly PASS; `commercial_usability: WARN`
- Operator override packaged with `geometry_drift: true`

### Sol Medium
- Session: `20260930_082352_363a8f`
- Fail emphasis **shifted**: stronger outward **splay** + finer foot ends; body shallower vs front width; legs read **narrower** than source (opposite of luna's "too thick")
- Still fail-closed BLOCK on fidelity + geometry

### Sol High escalation
- Session: `20260930_082631_315aee`
- Retains BLOCK/REVISE; notes camera/perspective limits certainty but fail-closed still fails
- Explicit: model/architecture swap alone does **not** produce geometry PASS on unchanged Cand-04

**Flip verdict:** Architecture change alone does **not** flip SHOT-02 Cand-04 to PASS.

---

## Brief / identity: luna vs Sol Medium

| Topic | luna brief (`brief/product-brief.yaml`) | Sol retest (`product-identity-sol-medium.yaml`) | Material? |
|-------|------------------------------------------|--------------------------------------------------|-----------|
| Class / two-tone | side-table; light body + dark legs | same | No |
| Body | thick box-shaped light wood | substantial rectangular block; compact square-ish | No (wording only) |
| Body height ratio | later locked in plan/v5 as ~1/3–2/5 | geometry_notes: **~1/3** of full height | Mild (Sol estimate aligns with v5 band) |
| Legs | four dark slender tapered outward | four slender stick-like, subtle taper + splay | No |
| Storage | unknown; do not invent | same unknowns | No |

**Material brief difference?** **No** for must-preserve identity. Sol is more explicit about viewpoint/perspective caveats and lists more unknowns.

---

## SHOT-02 prompt draft vs v5

Artifact: `shot-02-straight-sol-medium-draft.md` (comparison only; **does not** replace `prompts/shot-02-straight-v5.md`).

| Keep from v5 (Sol) | Change from v5 (Sol) |
|--------------------|----------------------|
| Strict reference match; substantial wood body; slender dark legs; plain studio | Drop rigid numerical body-height target; use source visual relationships |
| Uncluttered setting | Soften "pencil/stick thin" → slender with **visible thickness** |
| | More caution treating angled source top depth as front-face height |

Sol's own BRIEF_COMPARE_TO_V5: broadly consistent on deep-body emphasis; less extreme on leg thinness.

---

## Method notes (fairness)

- Sol QA used side-by-side composites under `E:\Hermes\workspace\dco-20260930-001-retest-sol\compare-shot-*.png` (LEFT source, RIGHT candidate).
- luna prior QA used Hermes vision with workspace image pair + (for 01/03) box Read-tool assist.
- Same source + same candidate bytes; no Image API; delivered `approved/` / `delivery/` untouched.
- No DFI secrets written.

---

## Sessions (Sol retest)

| Step | Reasoning | Session | Wall (approx) |
|------|-----------|---------|---------------|
| Intake | medium | `20260930_081922_4a7d7c` | ~67 s |
| SHOT-02 prompt draft | medium | `20260930_082040_74277f` | ~89 s |
| QA SHOT-01 | medium | `20260930_082223_0503f6` | ~85 s |
| QA SHOT-02 Cand-04 | medium | `20260930_082352_363a8f` | ~76 s |
| QA SHOT-03 | medium | `20260930_082518_c28b05` | ~66 s |
| QA SHOT-02 Cand-04 escalate | **high** | `20260930_082631_315aee` | ~110 s |

---

## Files in `retest-sol/`

- `product-identity-sol-medium.yaml`
- `shot-02-straight-sol-medium-draft.md`
- `SHOT-01-ANGLED-cand-01-sol-medium.yaml`
- `SHOT-02-STRAIGHT-cand-04-sol-medium.yaml`
- `SHOT-02-STRAIGHT-cand-04-sol-high.yaml`
- `SHOT-03-MEDIUM-CLOSE-cand-01-sol-medium.yaml`
- `COMPARISON.md` (this file)
