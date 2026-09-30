# COMPARE_GROK_CHATGPT.md — Grok Candidate B vs ChatGPT Fidelity Contract v0.2

**Written:** 2026-09-30 ~17:15 Asia/Makassar (UTC+8)  
**Inputs:** `CANDIDATES.md` (Grok B), `SYNTHESIS.md` (prior B pick), `CHATGPT_AUDIT_NOTES.md` (operator paste of ChatGPT audit @ `86772cf`).  
**Constraint:** Design compare only. **No implementation. No Image API enablement.**

---

## One-line thesis

| Side | Layer it actually fixes | Blind spot alone |
|------|-------------------------|------------------|
| **Grok Candidate B** | **Generation contract** — who owns identity before lifestyle (lock → proportion gate → edit/relight) | Release honesty: override→DELIVERED still possible; evidence/observability not first-class |
| **ChatGPT Evidence-Aware Three-Path v0.2** | **Release/QA contract** — evidence vs verdict vs release; SOURCE_PRESERVE vs NOVEL_VIEW; no client-release override | Does not by itself change how ChatGPT Images invents proportions under TXT2I lifestyle |

They are **orthogonal layers**, not rival "pick one" architectures. Shallow merge = paste B's folders onto A/ChatGPT YAML. Deep merge = both layers (see SYNTHESIS).

---

## Structured compare

### 1. Problem diagnosis

| Axis | Grok B | ChatGPT v0.2 |
|------|--------|--------------|
| Root cause named | Generator identity binding (Images invents body/legs under hard elevation) | QA/release contract too binary + internal contradiction (BLOCK + human APPROVE → DELIVERED) |
| Falsified premise | "Smarter Hermes prompts/models → geometry PASS" | "PASS/WARN/BLOCK alone + override = client-safe release" |
| Evidence base | Demo job + Sol same-pixel BLOCK (generation locus) | Static repo audit of skill/rules/templates/checkpoint + demo override contradiction |
| Pitch posture | Keep orchestration honesty; change generation ownership for V0.1 | **Reopen** MVP before pitch until contract tests 3/3 |

**Compatible:** Both reject "model swap fixes SHOT-02." Both keep Sol Medium default. Both deny Image API as V0 core.

### 2. Ownership / authority

| Concern | Grok B | ChatGPT v0.2 |
|---------|--------|--------------|
| Identity authority | **Lock raster + proportion card** (gate PASS before lifestyle) | Cutout authority under **SOURCE_PRESERVE**; novel angles explicitly high-risk |
| Generation mode | **Edit/relight from lock** (not TXT2I lifestyle from angled cutout) | **SOURCE_PRESERVE** (env/light integrate cutout) vs **NOVEL_VIEW_GENERATIVE** (reconstruct) |
| QA authority | Compare candidates to **lock + source** | Attribute-level: only score what evidence can prove (`DIRECT/PARTIAL/NOT_OBSERVABLE`) |
| Release authority | Rommy final; fail-closed on lifestyle vs lock (B design) | Human **cannot** flip QA facts; `RELEASE_APPROVED` only if `RELEASE_ELIGIBLE`; else `EXPERIMENT_ACCEPTED` / not client-releasable |
| Brief truth | Must-preserve vs flexible (existing) | Explicit split: **`product_truth`** (observed/inferred/unknown) vs **`generation_guardrails`** |

### 3. Three-path / view support (ChatGPT) vs lock (Grok)

| Concept | ChatGPT | Grok B | Merge note |
|---------|---------|--------|------------|
| Evidence path | PASS / FAIL / UNVERIFIABLE → RELEASE_ELIGIBLE / BLOCKED / NEEDS_EVIDENCE | ProportionGate PASS\|BLOCK then lifestyle QA | ChatGPT release triad wraps B's gates |
| View class | SUPPORTED / PARTIAL / NOVEL_VIEW on each shot | Lock should include front/elevation-friendly view (thin C folded in) | NOVEL_VIEW without lock → UNVERIFIABLE/NEEDS_EVIDENCE, not fake geometry PASS |
| SOURCE_PRESERVE | Primary client path: integrate cutout, don't redraw | Overlaps B's "edit from lock" when lock ≈ source-faithful plate; stronger when cutout itself is composite plate | Prefer SOURCE_PRESERVE as default production mode |
| NOVEL_VIEW | Higher risk; no fidelity cert from single angle alone | B's reason for existing: straight shot from angled-only source | Optional **identity lock** required before claiming verifiable novel-view geometry |

### 4. Override / package honesty

| | Grok B (prior synthesis) | ChatGPT v0.2 |
|--|--------------------------|--------------|
| Demo override | Allowed for demo with `geometry_drift: true`; Hermes stays REVISE | **Forbidden for client release**; experiment accept ≠ DELIVERED client-safe |
| Package claim | Must not claim geometry PASS when drifted | `presentation_quality` may PASS while `product_fidelity` FAIL → `RELEASE_BLOCKED` |
| Checkpoint | Synthesis left open pending ChatGPT paste | Paste: drop to `MVP_REOPENED_FOR_FIDELITY_CONTRACT_V02` until POS/NEG/AMB fixtures pass |

**Adoption:** Take ChatGPT's **no client-release override** as hard release law. Keep Rommy authority for experiment packaging with explicit non-client flag (aligns Grok honesty + ChatGPT client gate).

### 5. What each adopts / refuses

| | Adopts | Refuses |
|--|--------|---------|
| **Grok B** | Identity lock stage; proportion gate; lifestyle as edit; lineage source→lock→shot; Image API later-only | Prompt-only as primary fidelity fix; lifestyle before lock PASS; evaluator swap as identity fix; auto-approve; Image API now |
| **ChatGPT v0.2** | Evidence/verdict/release split; view_support; product_truth vs guardrails; SOURCE_PRESERVE/NOVEL_VIEW; EXPERIMENT_ACCEPTED; POS/NEG/AMB contract tests; reopen checkpoint | Binary QA pretending observability; client DELIVERED on BLOCK; commercial_usability collapsing fidelity; High as acceptance gate; inventing dimensions from unmatched angles |

### 6. Conflict matrix (real, not rhetorical)

| Conflict | Nature | Resolution for Ideal V0.2 |
|----------|--------|---------------------------|
| B adds human lock PAUSE friction | Cost vs fidelity | Keep for **NOVEL_VIEW** path; **SOURCE_PRESERVE** may skip lock if cutout is the plate |
| ChatGPT UNVERIFIABLE vs B hard BLOCK on geometry | Semantics | Map: FAIL→RELEASE_BLOCKED; UNVERIFIABLE→NEEDS_EVIDENCE (may open lock/evidence gather, not blind REVISE); lock FAIL stays BLOCK lifestyle |
| "Primary V0.1 = B only" vs "reopen for contract" | Sequencing | **Contract layer first for honesty** (can be doc/skill policy without new generation); **generation layer (B/SOURCE_PRESERVE) for fidelity EV** — both before pitch-ready |
| Override for pitch demo vs no client-release override | Narrative | Pitch may show EXPERIMENT_ACCEPTED + drift honesty; must **not** label as client-releasable PASS |
| ChatGPT `.ai-architect/` formalization | Process tax | Optional later; not required to merge substance of both layers |

### 7. Anti-shallow screen

| Shallow merge | Why rejected |
|---------------|--------------|
| "Use ChatGPT statuses inside Candidate A loop only" | Fixes honesty, leaves TXT2I geometry invention |
| "Ship B lock/edit, keep override→DELIVERED" | Fixes generation, re-opens Alex/ITWR contract lie |
| "Add UNKNOWN enum and call it Three-Path" | Paste explicitly rejects status-only thickening |
| "SOURCE_PRESERVE without evidence-aware release" | Still can package pretty drift as client-safe |
| "Identity lock for every SOURCE_PRESERVE shot" | Over-friction; lock is for novel/unverifiable geometry path |

**Deep merge (preferred):** ChatGPT fixes **release/QA contract honesty**; Grok B fixes **generation contract**. Ideal V0.2 = **SOURCE_PRESERVE + evidence-aware release + optional identity lock for NOVEL_VIEW**.

---

## Side-by-side cheat sheet

| Dimension | Grok B | ChatGPT v0.2 | Ideal V0.2 |
|-----------|--------|--------------|------------|
| Generation | Lock → edit | SOURCE_PRESERVE / NOVEL_VIEW | SOURCE_PRESERVE default; lock optional for NOVEL_VIEW |
| QA | vs lock+source | evidence → verdict → release | Both: attribute evidence + bind to lock when present |
| Release | drift-honest package | no client override on FAIL/UNVERIFIABLE | ChatGPT gate + experiment flag |
| Brief | must-preserve/flexible | product_truth vs guardrails | Adopt ChatGPT split |
| Pitch | proceed after lock trial | reopen until 3 fixtures | Reopen checkpoint; both layers before pitch-ready |
| Image API | Later if manual edit fails | Not required by contract patch | Still later / deny for now |

---

## Compare verdict

Grok B and ChatGPT v0.2 attack **different broken joints** of the same demo: B the **pixels**, ChatGPT the **contract that called drifted pixels deliverable**. Neither alone is Ideal V0.2. Prefer synthesis that stacks both layers — see updated `SYNTHESIS.md`.
---

## Postscript — Ideal V0.2-R1 (2026-09-30 ~17:36)

ChatGPT decision paste (see `CHATGPT_V02_R1_NOTES.md` / `V02_R1.md`) **keeps** this orthogonal-layer compare, then hardens Ideal V0.2 with six deltas. Material compare impacts:

| Layer | R1 change |
|-------|-----------|
| Generation (Grok B) | Identity lock reframed as **`DERIVED_RENDER` / generation stabilizer** — must **not** alone promote UNVERIFIABLE→PASS; novel geometry PASS needs original multi-view / measures / CAD / client evidence |
| SOURCE_PRESERVE | Must be **raster-true**: generative owns scene; cutout owns product pixels; deterministic local composite (not whole-image repaint) |
| Release (ChatGPT) | Multidimensional gate + early `SHOT_FEASIBILITY_GATE`; fixtures raised to **9/9** (3 paths × 3 Sol Medium) |
| Pick | **Ideal V0.2-R1** recommended over V0.2 as-is; **Grok agrees**; Codex waits for Rommy approve + ChatGPT handoff |

This file's "deep merge" thesis remains valid; R1 is that merge **plus** evidence-authority and raster-preservation constraints.

