# CHATGPT_AUDIT_NOTES.md — operator paste evidence

**Captured:** 2026-09-30 ~17:12 Asia/Makassar (UTC+8)  
**Source:** Operator clipboard paste of ChatGPT architect audit (Indonesian + English technical terms).  
**Repo audited (per paste):** `rommysunarto23/Denver-Creative-OS` `main` @ `86772cf4375c22718a31d9ee574f8f71749f84c8`  
**Mode claimed:** read-only static inspection; no scripts/tests run; no repo writes in that turn.  
**This file:** Summarizes the paste only. Does not invent findings, patches, or approvals beyond what the paste said.

---

## Paste headline

ChatGPT concluded: **MVP must be reopened before pitch**. Primary problem is **not the model**, but a **QA/release contract** that is too binary and contains an **internal contradiction**.

---

## Material findings (as stated)

| Finding (paste) | Evidence cited | Impact (paste) |
|-----------------|----------------|----------------|
| QA only knows `PASS/WARN/BLOCK` | `VISUAL_QA_RULES.md`, `QA_REPORT.yaml`, `SKILL.md` | Insufficient evidence treated like real failure |
| Fidelity rule: BLOCK must not be approved | `PRODUCT_FIDELITY_RULES.md` | Correct fail-closed intent |
| Demo approved SHOT-02 while still BLOCK | `job.yaml`, `qa-report-v5.yaml`, `DELIVERY_MANIFEST.yaml` | **Contract contradiction**; human override bypasses release safety |
| Shot planner always forces same 3 shots | `SHOT_PLAN.yaml` | Ignores source angle limits |
| SHOT-02 needs novel-view reconstruction from one angled source | demo job | System tries to verify geometry not fully observable |
| Product truth mixed with generation heuristics | shot-plan uses `~1/3-2/5`, `pencil-thin` | Prompt guardrails read as product facts |
| `commercial_usability` BLOCKs when fidelity fails | Sol retest | Visual quality mixed with release safety |
| Validator only checks key/text presence | `check_skill_templates.ps1` | No positive/negative/ambiguous semantic proof |
| Checkpoint still `MVP_READY_FOR_PITCH_PREPARATION` | `CURRENT_CHECKPOINT.md` | No longer matches quality bar operator set |

**Most serious (paste):** `PRODUCT_FIDELITY_RULES.md` says fidelity/geometry BLOCK must not be APPROVEd without a new passing candidate, but `DCO-20260930-001` allowed operator override and packaged `DELIVERED`. Paste says close this before talking to Alex/ITWR.

---

## Recommended patch name (paste)

**Evidence-Aware Three-Path Fidelity Contract v0.2**

Do **not** merely add `UNKNOWN` to `PASS/WARN/BLOCK`. Separate **evidence**, **truth verdict**, and **release decision**.

### Schema sketch (verbatim structure from paste)

```yaml
fidelity_check:
  attribute: leg_splay
  criticality: CRITICAL
  evidence:
    observability: DIRECT | PARTIAL | NOT_OBSERVABLE
    source_support: SUFFICIENT | LIMITED | INSUFFICIENT
  verdict:
    result: PASS | FAIL | UNVERIFIABLE
    reason: "..."
release:
  decision: RELEASE_ELIGIBLE | RELEASE_BLOCKED | NEEDS_EVIDENCE
```

### Aggregation (paste)

- critical FAIL → `RELEASE_BLOCKED`
- no critical FAIL + ≥1 critical UNVERIFIABLE → `NEEDS_EVIDENCE`
- all critical attributes observable + all critical PASS → `RELEASE_ELIGIBLE`

### "100% PASS" redefined (paste)

Not "every image APPROVED". Means correct decision for three fixture classes:

| Fixture | Expected verdict path | Test result if system matches |
|---------|----------------------|-------------------------------|
| POSITIVE | PASS → RELEASE_ELIGIBLE | TEST PASS |
| NEGATIVE | FAIL → RELEASE_BLOCKED | TEST PASS |
| AMBIGUOUS | UNVERIFIABLE → NEEDS_EVIDENCE | TEST PASS |

---

## Shot planner: evidence-aware (paste)

Each shot gets `view_support.class`: `SUPPORTED_VIEW | PARTIAL_VIEW | NOVEL_VIEW`.

Demo mapping (paste estimate):

- SHOT-01 ANGLED → `SUPPORTED_VIEW`
- SHOT-02 STRAIGHT → `NOVEL_VIEW`
- SHOT-03 MEDIUM-CLOSE → `PARTIAL_VIEW`

For `NOVEL_VIEW`, Hermes must not treat projected proportions from angled source as ground truth. QA moves from "is all geometry PASS?" to "which attributes are actually provable from available evidence?"

---

## Product truth vs generation guardrails (paste)

Split brief into:

- `product_truth`: `observed` / `inferred` / `unknown`
- `generation_guardrails`: soft prompt constraints (e.g. avoid wide-console proportions, keep legs slender)

Hard prompts allowed without pretending exact physical dimensions are known. Paste notes Sol already resisted treating projected ratios as absolute.

---

## Two production modes (paste) — Alex/ITWR-facing

1. **`SOURCE_PRESERVE`** — cutout remains visual authority; AI mainly does environment/lighting/background/props; product integrated without redrawing geometry. Paste: likely primary valuable path for clients with cutouts.
2. **`NOVEL_VIEW_GENERATIVE`** — model reconstructs new angles; higher risk; **must not get fidelity certification** from a single source angle unless critical identity attributes are verifiable.

---

## Human override rewrite (paste)

Current: Hermes FAIL + Human APPROVE → DELIVERED — **must be removed for client release**.

Replace with:

- Hermes FAIL/UNVERIFIABLE + human accepts for experiment → `EXPERIMENT_ACCEPTED` / **NOT CLIENT RELEASEABLE**
- Human may set `RELEASE_APPROVED` **only if** release gate is already `RELEASE_ELIGIBLE`
- Human keeps final authority but **cannot rewrite QA facts**

---

## Visual quality separation (paste)

Cand-04 example:

```yaml
presentation_quality: PASS
product_fidelity: FAIL
release_eligibility: RELEASE_BLOCKED
```

Not collapsing into `commercial_usability: BLOCK` (paste: image can be commercially attractive as generic furniture yet unsafe as exact product representation).

---

## Test contract before pitch-ready again (paste)

Deterministic Sol Medium on three fixtures: POSITIVE / NEGATIVE / AMBIGUOUS → 3/3 contract tests PASS. High not required for acceptance (paste cites operator retest: Medium and High same on SHOT-02).

Checkpoint should drop to something like `MVP_REOPENED_FOR_FIDELITY_CONTRACT_V02` until then.

---

## Blast radius claimed (paste)

Touches: `SKILL.md`, `PRODUCT_FIDELITY_RULES.md`, `VISUAL_QA_RULES.md`, `PRODUCT_BRIEF.yaml`, `SHOT_PLAN.yaml`, `QA_REPORT.yaml`, fixtures, validators, `CURRENT_CHECKPOINT.md`; small note in `MODEL_ARCHITECTURE_V0.md`. Default model stays Sol Medium.

Also suggested formalizing `.ai-architect/` + ADR-001 (paste only; **not created in this Grok compare turn**).

---

## ChatGPT ask to operator (paste ending)

Recommend **approve** Evidence-Aware Three-Path Fidelity Contract v0.2 + source-view compatibility + SOURCE_PRESERVE/NOVEL_VIEW split + no client-release override. If approved, next step would be a coding handoff (file-by-file) — **not executed here**.

---

## Non-claims (this notes file)

- Does **not** assert ChatGPT ran jobs or saw pixels beyond static repo inspection.
- Does **not** approve or reject the patch; that is operator/Rommy authority.
- Does **not** implement code, enable Image API, or change checkpoint status.
- Grok Candidate B comparison lives in `COMPARE_GROK_CHATGPT.md`; merge in `SYNTHESIS.md`.
