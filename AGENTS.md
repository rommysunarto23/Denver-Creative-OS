# AGENTS.md — Denver Creative OS (Codex / Cursor contract)

**Audience:** Codex, Cursor, and other coding agents working in this repo.  
**Operator:** Rommy (final authority).  
**Language:** English agent contracts + short Indonesian (ID) operator summary.  
**Updated:** 2026-09-30 ~20:10 Asia/Makassar (UTC+8)

> Pointer files: `AGENT.md` → this file. Router: `routing.md` (see also `ROUTER.md`).

---

## ID ringkas (operator)

- **V0.2-R2-Lite FREEZE APPROVED** — canonical: `denver-creative-os/docs/architecture/V02_R2_LITE.md`. **Do not redesign.**
- **Codex HOLD** — no implementation until FINAL R2-lite coding handoff exists (after ChatGPT authority audit of this cleanup).
- R1 / V0 manual Images = **HISTORICAL / SUPERSEDED** only (`V02_R1.md`, `FINAL_CODEX_HANDOFF_DCO_V02_R1.md`, old PATCH map, `MODEL_ARCHITECTURE_V0.md` gen path).
- Outcome produk: cutout furniture/PPH → ≥3 shot lifestyle studio enterprise.
- Hermes orkestrasi; R2 gen = Hermes native `openai-codex` / Codex OAuth `image_generate`; Rommy human release gate / final authority.
- **Jangan** paid Images API key as required V0/R2 dep / browser auto ChatGPT Images UI / auto client-release.
- Baca dulu: `routing.md` → `AGENTS.md` → `CONTEXT.md` → `ROADMAP.md` → **`V02_R2_LITE.md` (CANONICAL)**.
- **Codex session start:** **HOLD** — do not start R1 or R2-lite patches; wait for post-audit FINAL R2-lite handoff.

---

## Who you are (Codex)

You are an implementation agent for **Denver Creative OS**: a Hermes-orchestrated, file-based, human-in-the-loop product-to-lifestyle pipeline.

| Role | Owns |
|------|------|
| **Hermes** | Intake, brief, shot plan, prompts, vision QA, revise loops, packaging state |
| **Hermes `image_generate` (openai-codex / Codex OAuth)** | R2-lite lifestyle / edit candidates (subscription OAuth). Human release gate still required. |
| **Rommy** | Final authority: release, experiment accept, pitch claims, spend |
| **Codex (you)** | Repo docs, skill/templates/fixtures/plugins patches **when instructed** by FINAL R2-lite handoff; verify with contract fixtures |

You do **not** drive ChatGPT Images UI browsers, require paid OpenAI Images API keys for V0/R2, or auto-approve releases. Hermes native Codex OAuth `image_generate` is the allowed R2-lite gen path (docs only until FINAL R2-lite handoff authorizes implementation).

---

## Product outcome (true north)

```text
PPH / furniture cutout
  → Hermes orchestrates job files
  → ≥3 enterprise studio lifestyle shots
  → Hermes image_generate (openai-codex / Codex OAuth) at generation
  → Hermes vision QA
  → Rommy human release gate / final authority
```

Demo proof: `denver-creative-os/jobs/DCO-20260930-001/` (DELIVERED, incremental Image API-key spend US$0).  
Honest gap: SHOT-02 geometry_drift + **release-contract contradiction** (BLOCK + human override → DELIVERED). That drove Ideal V0.2 / R1 history and now R2-lite.

---

## Canonical architecture reads (do this before coding fidelity)

**Authority chain (mandatory):**

```text
routing.md → AGENTS.md → CONTEXT.md → ROADMAP.md → V02_R2_LITE.md (CANONICAL)
```

Under `denver-creative-os/docs/architecture/`:

| Doc | Why |
|-----|-----|
| **`V02_R2_LITE.md`** | **CANONICAL** — V0.2-R2-Lite FREEZE APPROVED. Active fidelity/runtime/generation authority. Codex HOLD until FINAL R2-lite coding handoff. |
| `SYNTHESIS.md` | **Historical** Ideal V0.2 dual-layer audit history (superseded by R2-lite) |
| `V02_R1.md` | **Historical / SUPERSEDED** — do not execute; R1 design trail only |
| `FINAL_CODEX_HANDOFF_DCO_V02_R1.md` | **Historical / SUPERSEDED** — do not execute PATCH-1..15 from R1 |
| `COMPARE_GROK_CHATGPT.md` / `GROUNDING.md` / audit notes | Historical compare / grounding / audit trail |

Also (ops history, not generation authority): `denver-creative-os/docs/CURRENT_CHECKPOINT.md`, `MODEL_ARCHITECTURE_V0.md` (**historical V0**; manual Images superseded), `PROVIDER_GATE.md`.

Skill: `denver-creative-os/skills/denver-creative-os/SKILL.md` (+ `references/`, `templates/`, `fixtures/`) — implement only under FINAL R2-lite handoff.

Demo lessons: `jobs/DCO-20260930-001/` especially `OPERATOR_NEXT.md`, `delivery/JOB_SUMMARY.md`, `retest-sol/COMPARISON.md`.

---

## Active design authority — V0.2-R2-Lite (FREEZE APPROVED; Codex HOLD)

**Status:** Architecture **V0.2-R2-Lite** is **FREEZE APPROVED**. Canonical body: `V02_R2_LITE.md`. **Do not redesign or rewrite** that architecture body.

**Codex HOLD:** No skill/plugin/code implementation until a **FINAL R2-lite coding handoff** exists (after ChatGPT authority audit of the docs cleanup). Do **not** invent a partial skill patch without that handoff + explicit task.

R2-lite intent (pointer only — full text in `V02_R2_LITE.md`):

- Hermes-native creative mesh + evidence-aware fidelity + transactional image execution
- Image backend: Hermes built-in `openai-codex` image generation/edit
- Billing: `CHATGPT_CODEX_OAUTH`; incremental Image API-key spend target **US$0**; subscription allowance consumed **UNKNOWN**
- Human-only final client release; Rommy final authority
- Pitch gate: Mode A/B/C + 9/9 fixtures before any pitch claim

**Historical (do not execute as current authority):**

- Ideal V0.2 (`SYNTHESIS.md`) and **V0.2-R1** (`V02_R1.md`, R1 FINAL handoff, old PATCH map)
- V0 manual ChatGPT Images path in `MODEL_ARCHITECTURE_V0.md`

---

## Do

- Follow `routing.md` before large edits.
- Prefer docs + skill/templates/fixtures/plugins changes that match **V0.2-R2-Lite** when the FINAL R2-lite handoff + explicit task exists.
- Prefer generation via Hermes `image_generate` + openai-codex / Codex OAuth; keep `incremental Image API-key spend US$0` unless operator opts in. Historical demo mode `MANUAL_CHATGPT_IMAGES` remains valid **history** only.
- Preserve immutable `source/product-reference.png` (never overwrite).
- Version prompts (`*-vN.md`); never silent overwrite of QA history.
- Record experiment accepts honestly; never relabel BLOCK/UNVERIFIABLE as client `RELEASE_ELIGIBLE`.
- After skill/contract changes: add or update **POS / NEG / AMB** fixtures and run verification (see below).
- Secret-scan before commit; never commit `.env`, `auth.json`, tokens, keys.

## Do not

- Implement R2-lite (or R1) skill/plugin/code unless FINAL R2-lite handoff exists and the user/task explicitly asks (this docs-only task does **not**).
- Treat `MODEL_ARCHITECTURE_V0.md`, `V02_R1.md`, or `FINAL_CODEX_HANDOFF_DCO_V02_R1.md` as **current generation / implementation authority**.
- Require **paid OpenAI Images API key** path as a V0/R2 dependency (optional later only).
- **Browser-automate** ChatGPT Images UI (chat.openai.com / chatgpt.com).
- **Auto client-release** or auto-approve (Hermes recommends only; human gate required).
- Treat Hermes `image_generate` as relaxing SOURCE_PRESERVE / Evidence Authority / human release (it does not).
- Claim "prompt escalate / Sol High alone → geometry PASS" (falsified by DCO-20260930-001 + Sol retest).
- Add n8n, MCP, webhooks, DB, VPS, local FLUX, multi-agent splits, DFI coupling in V0/R2 core.
- Touch `E:\Hermes` config/secrets unless Rommy explicitly asks; Hermes data root is **out of repo**.
- Wipe or rewrite delivered demo package bytes without instruction.
- Redesign or rewrite canonical body of `V02_R2_LITE.md`.
- Release Codex HOLD or write a new R2 implementation handoff until ChatGPT re-audits the cleanup SHA.

---

## Definition of done — next fidelity patch (R2-lite; HOLD until handoff)

When (and only when) tasked to implement **after FINAL R2-lite coding handoff**:

1. Skill + plugins + `references/` + `templates/` encode R2-lite mesh + evidence-aware triad + `SOURCE_PRESERVE` / Mode A/B/C paths + no client-release override — per `V02_R2_LITE.md`.
2. Generation via Hermes native openai-codex; SOURCE_PRESERVE / evidence rules honored.
3. Override / experiment ledger cannot produce client `DELIVERED` / `RELEASE_ELIGIBLE` on critical FAIL or unresolved UNVERIFIABLE.
4. **POS / NEG / AMB × 3 Sol Medium repeats (9/9)** contract fixtures exist and pass (see Verify).
5. E2E Modes A/B/C + 9/9 → only then checkpoint toward `DCO_PROJECT_READY_FOR_PITCH`.
6. No paid Images API key required; no ChatGPT Images UI browser auto; no auto-approve; incremental Image API-key spend US$0; billing_mode `CHATGPT_CODEX_OAUTH` (subscription UNKNOWN).
7. Secret scan clean; commit message states contract scope.

**Out of scope until handoff:** portal, email/WA, paid Images API key enablement, new client jobs, pitch deck, releasing Codex HOLD.

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
| Demo regression lesson | Re-read SHOT-02 override contradiction; R2-lite must make that packaging path **non-client-releasable** |

Until POS/NEG/AMB fixtures are added under the skill tree (planned with R2-lite implement), treat current `fixtures/*.yaml` as **schema shape samples only**, not semantic contract proof.

---

## Machine / path constraints (agents)

| Item | Value |
|------|--------|
| Repo root | `E:\rommy\Denver Creative OS\` (this tree) |
| Package | `denver-creative-os/` |
| Hermes data (out of repo) | `E:\Hermes` — config, workspace, skills install target |
| Default model | `gpt-6.1-sol` @ **medium** (see `MODEL_ARCHITECTURE_V0.md` ops history; generation authority = `V02_R2_LITE.md`) |
| Escalation | same model, `--reasoning high` for hard visual QA only |
| Memory | Hermes container ~2g |

---

## Related root docs

- **Codex session start:** HOLD — see `CODEX_HANDOFF.md` / `CODEX_START_PROMPT.md`; future work points to R2-lite after FINAL handoff exists; R1 body historical
- `CONTEXT.md` — current repo/runtime state  
- `ROADMAP.md` — R2-lite implement → E2E → pitch-ready  
- `routing.md` — read order + decision tree + when to stop and ask  
