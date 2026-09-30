# AGENTS.md — Denver Creative OS (Codex / Cursor contract)

**Audience:** Codex, Cursor, and other coding agents working in this repo.  
**Operator:** Rommy (final authority).  
**Language:** English agent contracts + short Indonesian (ID) operator summary.  
**Updated:** 2026-09-30 (Asia/Makassar, UTC+8)

> Pointer files: `AGENT.md` → this file. Router: `routing.md` (see also `ROUTER.md`).

---

## ID ringkas (operator)

- Outcome produk: cutout furniture/PPH → ≥3 shot lifestyle studio enterprise.
- Hermes orkestrasi; ChatGPT Images = human V0; Rommy final authority.
- Ideal **V0.2** = evidence-aware fidelity + `SOURCE_PRESERVE` primary + optional identity lock untuk `NOVEL_VIEW` — **pending ChatGPT final + Codex implement**.
- **Jangan** Image API / browser auto / auto client-release.
- Baca dulu: `routing.md` → `CONTEXT.md` → architecture Ideal V0.2.

---

## Who you are (Codex)

You are an implementation agent for **Denver Creative OS**: a Hermes-orchestrated, file-based, human-in-the-loop product-to-lifestyle pipeline.

| Role | Owns |
|------|------|
| **Hermes** | Intake, brief, shot plan, prompts, vision QA, revise loops, packaging state |
| **ChatGPT Images (human)** | All lifestyle / lock pixels (manual UI only in V0/V0.2 design) |
| **Rommy** | Final authority: release, experiment accept, pitch claims, spend |
| **Codex (you)** | Repo docs, skill/templates/fixtures patches **when instructed**; verify with contract fixtures |

You do **not** generate client images, call Image APIs, drive browsers, or auto-approve releases.

---

## Product outcome (true north)

```text
PPH / furniture cutout
  → Hermes orchestrates job files
  → ≥3 enterprise studio lifestyle shots
  → human ChatGPT Images at PAUSE
  → Hermes vision QA
  → Rommy final authority
```

Demo proof: `denver-creative-os/jobs/DCO-20260930-001/` (DELIVERED, Image API spend US$0).  
Honest gap: SHOT-02 geometry_drift + **release-contract contradiction** (BLOCK + human override → DELIVERED). That drives Ideal V0.2.

---

## Canonical architecture reads (do this before coding fidelity)

Under `denver-creative-os/docs/architecture/`:

| Doc | Why |
|-----|-----|
| **`SYNTHESIS.md`** | **Ideal V0.2** merge verdict (authoritative design intent) |
| **`COMPARE_GROK_CHATGPT.md`** | Orthogonal layers: generation (Grok B) vs release/QA (ChatGPT) |
| **`GROUNDING.md`** | How the live V0 loop actually works + fidelity imbalance census |
| `CANDIDATES.md` / `CHATGPT_AUDIT_NOTES.md` | Inputs to the merge; audit of geometry-override contradiction |

Also: `denver-creative-os/docs/CURRENT_CHECKPOINT.md`, `MODEL_ARCHITECTURE_V0.md`, `PROVIDER_GATE.md`.

Skill: `denver-creative-os/skills/denver-creative-os/SKILL.md` (+ `references/`, `templates/`, `fixtures/`).

Demo lessons: `jobs/DCO-20260930-001/` especially `OPERATOR_NEXT.md`, `delivery/JOB_SUMMARY.md`, `retest-sol/COMPARISON.md`.

---

## Ideal V0.2 (design — implement only when Rommy/ChatGPT final says go)

**Status:** Pending **ChatGPT final** + **Codex implement**. Do **not** invent a partial skill patch without an explicit task.

Dual layer (not either-or):

1. **Evidence-aware fidelity / release triad** (ChatGPT): `evidence` → `verdict` (PASS/FAIL/UNVERIFIABLE) → `release` (ELIGIBLE/BLOCKED/NEEDS_EVIDENCE); `view_support`; `product_truth` vs `generation_guardrails`; `presentation_quality` ≠ `product_fidelity`; **no client-release override** (`EXPERIMENT_ACCEPTED` ≠ client-releasable).
2. **Generation contract** (Grok B): primary path **`SOURCE_PRESERVE`** (cutout plate authority); optional **identity lock + proportion gate + edit/relight** for **`NOVEL_VIEW`**.

Hermes orchestrates; ChatGPT Images stays human; Rommy final authority **without rewriting QA facts**.

---

## Do

- Follow `routing.md` before large edits.
- Prefer docs + skill/templates/fixtures changes that match Ideal V0.2 when the patch task is explicit.
- Keep generation mode `MANUAL_CHATGPT_IMAGES`; `incremental_image_api_spend_usd: 0`.
- Preserve immutable `source/product-reference.png` (never overwrite).
- Version prompts (`*-vN.md`); never silent overwrite of QA history.
- Record experiment accepts honestly; never relabel BLOCK/UNVERIFIABLE as client `RELEASE_ELIGIBLE`.
- After skill/contract changes: add or update **POS / NEG / AMB** fixtures and run verification (see below).
- Secret-scan before commit; never commit `.env`, `auth.json`, tokens, keys.

## Do not

- Implement Ideal V0.2 skill patch unless the user/task explicitly asks (this docs-only task does **not**).
- Call or enable **Image API** / paid image generation.
- **Browser-automate** ChatGPT Images UI.
- **Auto client-release** or auto-approve (Hermes recommends only).
- Claim "prompt escalate / Sol High alone → geometry PASS" (falsified by DCO-20260930-001 + Sol retest).
- Add n8n, MCP, webhooks, DB, VPS, local FLUX, multi-agent splits, DFI coupling in V0/V0.2 core.
- Touch `E:\Hermes` config/secrets unless Rommy explicitly asks; Hermes data root is **out of repo**.
- Wipe or rewrite delivered demo package bytes without instruction.

---

## Definition of done — next fidelity patch (Ideal V0.2 skill)

When (and only when) tasked to implement V0.2:

1. Skill + `references/` + `templates/` encode evidence-aware triad + `SOURCE_PRESERVE` / `NOVEL_VIEW` modes + no client-release override.
2. Optional identity-lock procedure gated for `NOVEL_VIEW` / insufficient evidence (not forced on every `SOURCE_PRESERVE` shot).
3. Override / experiment ledger cannot produce client `DELIVERED` / `RELEASE_ELIGIBLE` on critical FAIL or unresolved UNVERIFIABLE.
4. **POS / NEG / AMB** contract fixtures exist and pass verification on Sol Medium path (see Verify).
5. Checkpoint / roadmap text updated honestly (reopen closed only after fixtures 3/3).
6. No Image API, no browser auto, no auto-approve.
7. Secret scan clean; commit message states contract scope.

**Out of scope for that patch:** portal, email/WA, Image API enablement, new client jobs, pitch deck.

---

## How to verify

| Check | Where / how |
|-------|-------------|
| Scaffold | `denver-creative-os/docs/scripts/check_scaffold.*` |
| Skill templates (keys present) | `denver-creative-os/docs/scripts/check_skill_templates.ps1` |
| Provider gate (ops) | `docs/PROVIDER_GATE.md` — do not invent paid APIs |
| **Contract fixtures POS** | Expected: known good evidence → `RELEASE_ELIGIBLE` (or clear ELIGIBLE path) |
| **Contract fixtures NEG** | Expected: critical FAIL → `RELEASE_BLOCKED`; override cannot flip to client release |
| **Contract fixtures AMB** | Expected: insufficient observability → `UNVERIFIABLE` / `NEEDS_EVIDENCE` (not fake FAIL or fake PASS) |
| Demo regression lesson | Re-read SHOT-02 override contradiction; V0.2 must make that packaging path **non-client-releasable** |

Until POS/NEG/AMB fixtures are added under the skill tree (planned with V0.2), treat current `fixtures/*.yaml` as **schema shape samples only**, not semantic contract proof.

---

## Machine / path constraints (agents)

| Item | Value |
|------|--------|
| Repo root | `E:\rommy\Denver Creative OS\` (this tree) |
| Package | `denver-creative-os/` |
| Hermes data (out of repo) | `E:\Hermes` — config, workspace, skills install target |
| Default model | `gpt-6.1-sol` @ **medium** (`MODEL_ARCHITECTURE_V0.md`) |
| Escalation | same model, `--reasoning high` for hard visual QA only |
| Memory | Hermes container ~2g |

---

## Related root docs

- `CONTEXT.md` — current repo/runtime state  
- `ROADMAP.md` — V0 → V0.2 → later  
- `routing.md` — read order + decision tree + when to stop and ask  