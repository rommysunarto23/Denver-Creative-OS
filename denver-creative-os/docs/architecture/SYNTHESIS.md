# SYNTHESIS.md - V0.1 / Ideal V0.2 merge

> **SUPERSEDED (pending operator approve):** Authoritative design intent is now **Ideal V0.2-R1** in `V02_R1.md` (Evidence Authority + Raster Preservation).  
> Ideal V0.2 dual-layer below remains the **base merge** (ChatGPT release contract + Grok B generation). ChatGPT paste @ `fb9bd9b` did **not** approve V0.2 as-is; recommended R1 with **6 deltas**.  
> **Grok stance:** Agree — adopt V0.2-R1 over V0.2 as-is; Codex must **wait** for Rommy approve + ChatGPT coding handoff. **No skill implement this turn.**  
> See also: `CHATGPT_V02_R1_NOTES.md`, brief note in `COMPARE_GROK_CHATGPT.md`.

**Phase:** B pick -> ChatGPT compare merge -> **V0.2-R1 harden (design only)**  
**Updated:** 2026-09-30 ~17:36 Asia/Makassar (UTC+8)  
**Inputs:** `GROUNDING.md`, `CANDIDATES.md`, `COMPARE_GROK_CHATGPT.md`, `CHATGPT_AUDIT_NOTES.md`, `CHATGPT_V02_R1_NOTES.md` (operator paste), demo job + Sol retest.  
**Non-goals:** Implementation, Image API enablement, DFI/secrets, pitch deck, coding handoff execution.

---

## Status vs Ideal V0.2-R1

| Item | State |
|------|--------|
| Ideal V0.2 (this file body) | Historical dual-layer merge — **still correct as base** |
| Ideal V0.2-R1 (`V02_R1.md`) | **Pending Rommy approve** — recommended superseding pick |
| Codex skill patch | **Blocked** until approve + ChatGPT handoff |
| Checkpoint magic string | Unchanged this turn (still reopen conceptually) |

**R1 six deltas (pointer only — full text in `V02_R1.md`):** (1) lock = `DERIVED_RENDER` not ground truth; (2) SOURCE_PRESERVE = deterministic cutout raster composite; (3) `SHOT_FEASIBILITY_GATE`; (4) multidimensional release; (5) POS/NEG/AMB x3 = 9/9; (6) hard checkpoint return gate.

---
## Merge verdict (primary) — Ideal V0.2 base (superseded by R1 pending approve)

**Ideal V0.2 = both layers, not either-or:**

1. **ChatGPT Evidence-Aware Three-Path Fidelity Contract** → fixes **release/QA contract honesty** (evidence / verdict / release; view_support; product_truth vs guardrails; no client-release override; POS/NEG/AMB fixtures; reopen checkpoint).  
2. **Grok Candidate B (identity-first)** → fixes **generation contract** where pixels are invented (optional **identity lock + proportion gate + edit/relight**), especially under **NOVEL_VIEW**.  
3. **Primary production path:** **`SOURCE_PRESERVE`** (cutout authority; scene/light/props around product) — closest to Alex/ITWR cutout reality and lowest geometry risk.  
4. **Secondary / high-risk path:** **`NOVEL_VIEW_GENERATIVE`** — requires evidence-aware UNVERIFIABLE handling **and** optional Grok-B identity lock before claiming verifiable front/elevation geometry.  
5. Candidate A remains **policy overlay** (fail-family tracker, override→experiment ledger), not the fidelity architecture.

This is **not** shallow: ChatGPT alone leaves TXT2I redraw drift; B alone can still package OVERRIDE as client DELIVERED.

---

## What to adopt from each

### From ChatGPT v0.2 (adopt)

| Item | Why |
|------|-----|
| Split `evidence` → `verdict` (PASS/FAIL/UNVERIFIABLE) → `release` (ELIGIBLE/BLOCKED/NEEDS_EVIDENCE) | Stops treating missing observability as FAIL |
| `view_support`: SUPPORTED / PARTIAL / NOVEL_VIEW | Matches demo SHOT-02 reality |
| `SOURCE_PRESERVE` vs `NOVEL_VIEW_GENERATIVE` modes | Business-aligned generation menus |
| `product_truth` (observed/inferred/unknown) vs `generation_guardrails` | Stops heuristics posing as product facts |
| No client-release override; `EXPERIMENT_ACCEPTED` ≠ client-releasable | Closes demo contract contradiction |
| Separate `presentation_quality` from `product_fidelity` / release | Cand-04-class honesty for agencies |
| POSITIVE / NEGATIVE / AMBIGUOUS contract tests on Sol Medium | Real "100% PASS" definition |
| Checkpoint reopen until 3/3 | Pitch hygiene |

### From Grok Candidate B (adopt)

| Item | Why |
|------|-----|
| Identity lock + proportion gate **before** lifestyle when path is NOVEL_VIEW or evidence insufficient for critical geometry | Attacks generator invention locus |
| Lifestyle as **edit/relight from lock** (human Images), not TXT2I from angled cutout alone | Changes generation ownership |
| Lineage `source → lock_id → shot` in manifest | Auditability |
| Thin C folded in: lock/evidence pack includes front/elevation-friendly view | Reduces angled→front guesswork |
| Image API = **later phase only** if manual SOURCE_PRESERVE / lock-edit still fails | Keeps V0 deny list |
| Refuse "prompt-only / Sol upgrade → geometry PASS" as primary | Already falsified |

### From Candidate A (overlay only)

Fail-family streak → operator fork; override ledger rewritten as **experiment package ledger** (never silent client release).

---

## Conflicts and resolutions

| Conflict | Resolution |
|----------|------------|
| B-only primary (prior SYNTHESIS) vs ChatGPT "reopen MVP" | **Update pick:** Ideal V0.2 stacks both; checkpoint conceptually reopened for contract until fixtures exist (**docs/design now; no code this turn**) |
| Always-on lock friction vs SOURCE_PRESERVE | Lock **optional** on SOURCE_PRESERVE when cutout is the authoritative plate; **required or strongly gated** for NOVEL_VIEW claiming geometry cert |
| B ProportionGate BLOCK vs ChatGPT UNVERIFIABLE | Map lock/lifestyle FAIL → RELEASE_BLOCKED; insufficient view → NEEDS_EVIDENCE (gather lock/matched view), not blind REVISE spam |
| Demo override narrative | Keep ability to accept experiment for learning; **forbid** labeling as client RELEASE_ELIGIBLE / fidelity PASS |
| ChatGPT `.ai-architect/` + ADR bundle | Deferred process; substance of contract does not depend on that folder existing yet |

---

## Primary path (Ideal V0.2 design intent)

```text
Intake cutout
  -> classify production_mode: SOURCE_PRESERVE | NOVEL_VIEW_GENERATIVE
  -> brief: product_truth + generation_guardrails (split)
  -> shot plan + view_support (SUPPORTED|PARTIAL|NOVEL)

SOURCE_PRESERVE:
  cutout plate -> scene/light/props integration prompts (human Images)
  -> attribute QA (evidence-aware) -> release gate
  -> Rommy RELEASE_APPROVED only if RELEASE_ELIGIBLE
     else EXPERIMENT_ACCEPTED (not client-releasable)

NOVEL_VIEW (optional B layer):
  -> identity lock (human Images) -> proportion gate
  -> if gate PASS: lifestyle edit/relight from lock
  -> QA vs lock+source with observability classes
  -> same release gate (no client override on FAIL/UNVERIFIABLE)

Package:
  presentation_quality ⟂ product_fidelity ⟂ release_eligibility
  lineage + experiment vs client flags honest
```

Hermes orchestrates; ChatGPT Images stays **human**; Rommy final authority **without rewriting QA facts**; **no Image API** in this phase.

---

## What Ideal V0.2 explicitly does **not** do (this turn / V0 core)

- Implement code, schemas, or `.ai-architect/` writes.  
- Enable paid Image API or browser-automate ChatGPT.  
- Auto-approve or claim Sol High as fidelity fix.  
- Restore "escalate prompts alone → geometry PASS."  
- Call checkpoint pitch-ready until POS/NEG/AMB contract tests exist and pass (future work).  
- Treat ChatGPT paste as pixel proof of Images edit adherence — only contract/static-repo diagnosis + design recommend.

---

## Sequencing recommendation (still design)

1. **Contract layer (ChatGPT)** — skill/rules/templates design for evidence-aware release + modes + override rewrite (**docs first**).  
2. **Fixture contract** — define POS/NEG/AMB acceptance before claiming reopen closed.  
3. **Generation layer (Grok B)** — one SOURCE_PRESERVE trial; one NOVEL_VIEW lock→edit SHOT-02 trial on same oak cutout.  
4. Only then skill procedure edits for IdentityFirst / mode branches.  
5. Image API remains **later-phase flag** if manual paths fail closed.

---

## Prior V0.1 B pick — status after paste

Prior synthesis: **Primary = Candidate B**.  
**Still true for generation.**  
**Incomplete for release.** After operator ChatGPT paste: B is **necessary but not sufficient**. Replace "B alone" with **Ideal V0.2 dual-layer** above. ChatGPT comparison is **no longer pending**.

---

## Screen against shallow modules

| Test | Result |
|------|--------|
| Is Ideal V0.2 just A + UNKNOWN enum? | **No** — generation mode + release triad + optional lock ownership |
| Is it just B with more YAML? | **No** — SOURCE_PRESERVE may skip lock; release law changes override semantics |
| Multi-agent / model swap / API now? | Still rejected |
| Either-or Grok vs ChatGPT? | Rejected — different layers |

---

## 10-line synthesis verdict (updated)

1. V0 proves orchestration + fail-closed *intent*; demo also proved a **release-contract hole** (BLOCK + override → DELIVERED).  
2. Fidelity imbalance census unchanged: **generator primary**; Hermes secondary; Rommy gate tertiary — now plus **contract honesty** as co-equal pitch risk.  
3. Premise "smarter Hermes → geometry PASS" remains **falsified**.  
4. Premise "binary QA + human override = client-safe" is **falsified by ChatGPT audit + demo artifacts**.  
5. **Ideal V0.2 primary path = SOURCE_PRESERVE + evidence-aware release triad + no client-release override.**  
6. **Grok B identity lock/edit = required addon for NOVEL_VIEW / unverifiable critical geometry**, not the only mode.  
7. Candidate A = policy/experiment ledger overlay only.  
8. ChatGPT Images remains human; **Image API = later if manual preserve/lock-edit fail.**  
9. Checkpoint conceptually **reopened for fidelity contract v0.2** until POS/NEG/AMB pass — **no code this turn.**  
10. Next proof (design→trial): one SOURCE_PRESERVE composite + one lock-edit SHOT-02; then skill edits — still no API, no email/WA/portal.

