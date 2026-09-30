# GROUNDING.md - Denver Creative OS current loop

**Phase:** A Ground (read-only investigation -> design docs)  
**Written:** 2026-09-30 ~17:05 Asia/Makassar (UTC+8)  
**Scope:** How the V0 loop actually works after DCO-0..3 + Sol retest. No implementation. No Image API enablement. No DFI/secrets.

**Evidence base:** `PRD_DENVER_CREATIVE_OS.md`, `DENVER_CREATIVE_OS_ARCHITECTURE_AND_REPO_BLUEPRINT.md`, `DENVER_CREATIVE_OS_DOCS_README.md`, `skills/denver-creative-os/SKILL.md`, `docs/MODEL_ARCHITECTURE_V0.md`, `docs/CURRENT_CHECKPOINT.md`, `jobs/DCO-20260930-001/` (JOB_SUMMARY, job.yaml, prompts, qa, retest-sol/COMPARISON.md).

---

## Overview

Denver Creative OS V0 is a **single-agent, file-oriented, human-in-the-loop** product-to-lifestyle workflow:

```text
cutout / product-reference.png
        -> Hermes intake (vision) -> fidelity brief
        -> 3-shot plan (angled / straight / medium-close)
        -> versioned prompt pack
        -> PAUSE: human generates in ChatGPT Images UI
        -> candidates drop into job folder
        -> Hermes vision QA (fail-closed fidelity/geometry)
        -> REVISE prompts (loop) or human APPROVE
        -> package 3 delivery PNGs + manifest
```

**Product outcome (operator):** PPH-style - client cutout -> >=3 enterprise studio lifestyle shots; Hermes orchestrates; Rommy final authority; upload/email/WA/portal later. ChatGPT Images remains human V0 generator.

**Proven, not aspirational:** One fictional oak side-table demo (`DCO-20260930-001`) reached `PACKAGE_DONE` / `DELIVERED` with Image API spend **US$0**. SHOT-02 required operator override after four geometry BLOCKs.

---

## Key Concepts

| Concept | Meaning in V0 |
|---------|----------------|
| **Hermes** | Reasoning + skill procedure + vision QA. Does **not** generate lifestyle pixels. |
| **ChatGPT Images (human)** | Sole image generator. Operator pastes prompt + attaches source; drops PNG into `candidates/`. |
| **Rommy** | Final authority. Hermes recommends; human sets `human_decision`. |
| **Job folder** | Entire state machine: YAML/MD/PNG under `jobs/DCO-YYYYMMDD-NNN/`. No DB. |
| **Fail-closed fidelity** | Any BLOCK on `source_fidelity` or `geometry` -> Hermes `decision: REVISE`. Beauty cannot override. |
| **Operator override** | Human may APPROVE a REVISE candidate and mark `geometry_drift: true`. Package must not claim geometry PASS. |
| **Must-preserve vs flexible** | Hard product identity vs soft scene/styling. Bound into brief -> prompt -> QA. |
| **Revision cycle** | New prompt version filename; never overwrite. Default max 2/shot; operator can escalate. |
| **Model tree (locked)** | Sol Medium default; Sol High for hard visual QA only; Images still manual. |

### Actor census - who holds fidelity imbalance

The fidelity problem is **not evenly distributed**. Census from DCO-20260930-001 + Sol retest:

| Actor | Role in fidelity | Evidence of imbalance |
|-------|------------------|----------------------|
| **Image generator (ChatGPT Images)** | **PRIMARY holder of fidelity failure.** Emits body/leg proportions that diverge from source under straight-on lifestyle constraint. | SHOT-02 cand-01..04: same fail family (wide/shallow body + thick/wrong legs) despite v1->v5 escalate prompts including numeric ratios + strategy rewrite. JOB_SUMMARY: "GPT Image is the primary cause." |
| **Hermes reasoning (prompt author)** | Can sharpen constraints and diagnose fail family; **cannot force generator compliance.** | v5 strategy rewrite landed scene (plain studio) but not geometry. Sol Medium prompt draft softens numeric language - still cannot change pixels already generated. |
| **Hermes vision QA (evaluator)** | Detects imbalance; does not create it. Stricter Sol Medium BLOCKED SHOT-01/03 that luna APPROVED - evaluator variance, not generator fix. | COMPARISON.md: Sol Medium+High retain geometry BLOCK on Cand-04 same pixels. Sol High: *"Changing the evaluator architecture, model, or reasoning effort alone does not flip this unchanged candidate to geometry PASS."* |
| **Human operator (Rommy)** | Supplies generation labor + final gate. Can override drift for demo; cannot make generator obey by authority alone. | Override B packaged Cand-04 with `geometry_drift: true`; Hermes decision stayed REVISE. |
| **Source / cutout** | Immutable identity authority. Angled-only source vs straight-shot demand creates projective ambiguity. | Sol High notes camera/perspective limits certainty; fail-closed still BLOCK. |
| **Skill / state machine** | Orchestrates pause, versioning, fail-closed policy. Does not hold pixel fidelity. | Skill correctly forced REVISE x4; did not invent Image API or auto-approve. |

**Attacked premise (falsified by evidence):**  
> "Better Hermes reasoning / escalate prompts alone -> geometry PASS."

Counter-evidence: four prompt escalations + Sol Medium/High re-QA on **same pixels** -> still BLOCK. The imbalance lives in the **generator's identity binding**, not in the orchestrator's eloquence.

---

## How It Works

### Loop (skill procedure)

```text
CREATED -> INTAKE -> (NEEDS_INPUT?) -> BRIEF_APPROVED
  -> SHOT_PLAN_READY -> PROMPT_PACK_READY
  -> AWAITING_GENERATION   <- human ChatGPT Images
  -> CANDIDATES_READY -> QA_REVIEW
  -> REVISION_REQUIRED -> AWAITING_GENERATION  (loop)
  -> HUMAN_APPROVAL -> APPROVED -> PACKAGED -> DELIVERED
```

Side: `ABORTED`, `NEEDS_OPERATOR_DECISION` (after fail-family saturation).

### Per-shot path (canonical IDs)

1. **SHOT-01-ANGLED** - hero three-quarter lifestyle.  
2. **SHOT-02-STRAIGHT** - front elevation / proportion read (hardest for this SKU).  
3. **SHOT-03-MEDIUM-CLOSE** - material/join confidence.

### Generation boundary (hard)

At PAUSE Hermes **stops**. Operator:

1. Opens ChatGPT Images UI.  
2. Attaches `source/product-reference.png`.  
3. Pastes versioned prompt.  
4. Saves PNG under `candidates/SHOT-XX/`.  

**DENY:** paid Image API, browser automation of ChatGPT, auto-approve, n8n/MCP/cron, DFI coupling.

### QA decision rule

```text
BLOCK on source_fidelity OR geometry  ->  Hermes decision = REVISE
else                                  ->  Hermes may recommend APPROVE
human_decision                        ->  empty until Rommy acts
```

### Demo outcome snapshot (DCO-20260930-001)

| Shot | Prompt | Hermes | Human | Note |
|------|--------|--------|-------|------|
| SHOT-01 | v1 | APPROVE (luna) | APPROVED | Sol Medium later REVISE on same pixels |
| SHOT-02 | v5 Cand-04 | REVISE x4 | APPROVED override | geometry_drift true |
| SHOT-03 | v1 | APPROVE (luna) | APPROVED | Sol Medium later REVISE on same pixels |

---

## Where Things Live

```text
E:\rommy\Denver Creative OS\
├── PRD_*.md, BLUEPRINT, DOCS_README          # product + arch baseline (also mirrored under denver-creative-os/docs/)
├── docs/HERMES_MVP_MULTI_PHASE_PLAN.md       # program plan DCO-0..4
└── denver-creative-os/
    ├── docs/
    │   ├── CURRENT_CHECKPOINT.md             # MVP_READY_FOR_PITCH_PREPARATION
    │   ├── MODEL_ARCHITECTURE_V0.md          # Sol Medium / High / Images / Rommy
    │   ├── PROVIDER_GATE.md
    │   └── architecture/                     # THIS folder (Phase A/B design)
    ├── skills/denver-creative-os/
    │   ├── SKILL.md                          # procedure + deny list
    │   ├── references/{PRODUCT_FIDELITY,VISUAL_QA}_RULES.md
    │   ├── templates/*.yaml
    │   └── fixtures/
    ├── samples/fictional-furniture/          # demo source
    └── jobs/DCO-20260930-001/
        ├── job.yaml
        ├── source/product-reference.png      # immutable
        ├── brief/  plan/  prompts/
        ├── candidates/SHOT-0{1,2,3}/
        ├── qa/  retest-sol/
        ├── approved/  delivery/
        └── OPERATOR_NEXT.md
```

**Runtime (not in repo):** Hermes docker `hermes`, data `E:\Hermes`, config model `gpt-6.1-sol` / reasoning medium.

**GitHub:** `rommysunarto23/Denver-Creative-OS` (local path above is source of truth for this investigation).

---

## Gotchas

1. **Premise trap:** Escalating Hermes prompts/models does not move geometry PASS when the Image generator is the failure locus. Treat further "smarter REVISE text" as low-EV unless the generation surface changes (identity lock, edit path, or different generator).  
2. **Evaluator ≠ generator:** Sol is stricter than luna on SHOT-01/03; tightening QA increases BLOCK rate without fixing pixels.  
3. **Same-pixel retests:** Changing QA model on delivered candidates proves evaluator behavior only. Do not claim architecture "fixed" SHOT-02 without new generation.  
4. **Fail-family saturation:** After same fail class xN, skill should escalate to operator options (rewrite / override / stop-or-source-change), not infinite vN.  
5. **Source viewpoint mismatch:** Angled cutout as sole reference for straight elevation invites projective doubt; fail-closed still BLOCKs when identity is not established.  
6. **Override hygiene:** Override is allowed for demo packaging but must keep Hermes REVISE + `geometry_drift` - never rewrite QA to fake PASS.  
7. **Skill load gap:** Project skill files exist; Hermes install into `E:\Hermes\skills` vs project-local trust is **unproven** (CURRENT_CHECKPOINT known gap).  
8. **V0 deny list still active:** Image API, browser automation, auto-approve, multi-agent split, production claim.  
9. **ChatGPT comparison pending:** Operator paste of ChatGPT-side diagnosis vs Hermes not yet in repo - synthesis must not assume it.  
10. **Delivery ≠ geometry PASS:** `PACKAGE_DONE` can coexist with known drift; pitch/proof pack must stay honest.

---

## Grounding verdict (one line)

**V0 proves orchestration + fail-closed honesty; it does not prove pixel-level identity under ChatGPT Images for hard elevations - fidelity imbalance sits in the generator, so V0.1 must change ownership of identity binding, not only prompt eloquence.**
