# CURRENT_CHECKPOINT

**Status:** `MVP_READY_FOR_PITCH_PREPARATION`  
**Written:** 2026-09-30T15:56:00+08:00 (Asia/Makassar)  
**Demo job:** `DCO-20260930-001`  
**Product target (operator):** PPH-style furniture AI lifestyle from cutouts → enterprise studio (≥3 shots); Hermes orchestrates; human Images V0; Rommy cross-check before client; email/WA/portal later.

## Magic string

MVP_READY_FOR_PITCH_PREPARATION

## Demo job delivery (walkable proof)

Root: `denver-creative-os/jobs/DCO-20260930-001/`

| Artifact | Path |
|----------|------|
| Job state | `jobs/DCO-20260930-001/job.yaml` (status `DELIVERED`, package `PACKAGE_DONE`) |
| Delivery shot 01 | `jobs/DCO-20260930-001/delivery/shot-01-angled.png` |
| Delivery shot 02 | `jobs/DCO-20260930-001/delivery/shot-02-straight.png` |
| Delivery shot 03 | `jobs/DCO-20260930-001/delivery/shot-03-medium-close.png` |
| Manifest | `jobs/DCO-20260930-001/delivery/DELIVERY_MANIFEST.yaml` |
| Summary | `jobs/DCO-20260930-001/delivery/JOB_SUMMARY.md` |
| Approved copies | `jobs/DCO-20260930-001/approved/SHOT-0{1,2,3}-*.png` |

Generation: `MANUAL_CHATGPT_IMAGES`. Incremental Image API spend: **US$0**.

## Proven (DCO-0 .. DCO-3)

| PR | What is proven | Evidence |
|----|----------------|----------|
| **DCO-0** | Hermes text + vision via `openai-codex`; container Up; mem 2g; no paid Image API in gate; no secrets in gate doc | `docs/PROVIDER_GATE.md` (TEXT_PING_PASS / VISION_SMOKE_PASS) |
| **DCO-1** | Repo scaffold: README, .gitignore, docs pointers, `jobs/`, `samples/fictional-furniture/`, `skills/denver-creative-os/` stubs | `denver-creative-os/` tree + `docs/scripts/check_scaffold.*` |
| **DCO-2** | Project skill `denver-creative-os`: INTAKE→PLAN→PROMPT→PAUSE→QA→REVISE→APPROVE→PACKAGE; fail-closed fidelity; human-only approve; Image API + browser automation denied | `skills/denver-creative-os/SKILL.md` + templates/references/fixtures |
| **DCO-3** | One fictional furniture demo end-to-end through PACKAGE/DELIVERED; ≥1 REVISE cycle (SHOT-02 v1→v5); human approval; 3 finals + manifest | `jobs/DCO-20260930-001/` (see delivery table above) |

## MVP Definition of Done (from DOCS_README)

| DoD item | Status | Note |
|----------|--------|------|
| Hermes installed | checked | Container `hermes` Up (DCO-0) |
| ChatGPT/Codex OAuth works | checked | Provider `openai-codex` text PASS |
| vision works | checked | Vision smoke PASS + job QA sessions |
| project skill loads | N/A — Appendix A | Skill files exist in repo; Hermes project-load vs `E:\Hermes\skills` install path **unproven** this program (see Known gaps) |
| product brief generated | checked | `brief/product-brief.yaml` |
| 3 shot plans generated | checked | `plan/shot-plan.yaml` (SHOT-01/02/03) |
| 3 prompt files generated | checked | `prompts/` v1 pack (+ SHOT-02 revise versions) |
| manual generation checkpoint respected | checked | PAUSE / `AWAITING_GENERATION`; no Image API |
| QA report produced | checked | `qa/` per-shot + `qa-report-v*.yaml` |
| REVISE path tested | checked | SHOT-02 through v5 / cand-04 |
| human final approval enforced | checked | human_decision APPROVED; Hermes may recommend only |
| 3 final images packaged | checked | `delivery/shot-0{1,2,3}-*.png` |
| delivery manifest generated | checked | `delivery/DELIVERY_MANIFEST.yaml` |
| paid Image API calls = 0 | checked | `incremental_image_api_spend_usd: 0` |

## Known gaps (honest)

1. **SHOT-02 geometry_drift** — Fail-closed geometry failed 4× (cand-01..Cand-04). Same fail family (wide/shallow body + thick legs). GPT Image is the primary cause. Operator override B accepted Cand-04 for scene/studio; Hermes decision remains **REVISE**. Package does **not** claim geometry passed.
2. **Image API not automated** — V0 generation stays manual ChatGPT Images UI. Paid Image API remains DENY.
3. **Hermes skill project-load (Appendix A) unproven** — Exact install path into `E:\Hermes\skills` versus project-local load was not prototype-proven this session. Default remains project skill + `docker exec hermes hermes` CLI until proven.
4. **Human gate required** — No auto-approve. Rommy cross-check before any client-facing use. Email / WhatsApp / portal integrations are later, not V0.

## V0 denies still hold

Do **not** add in V0 (still active):

- Image API / paid image generation API
- Browser automation of ChatGPT UI
- n8n / MCP / cron / webhooks
- Database / VPS / local FLUX requirement
- Multi-agent split / fully autonomous approval
- DFI coupling or secrets in git/chat
- Production-ready claim

`.gitignore` still covers `.env`, `auth.json`, and related secret surfaces.

## What this checkpoint is not

- Not a full client pitch deck
- Not a bunk-bed / next product job start
- Not Image API enablement
- Not DFI/secrets work
- Not a wipe or rewrite of Hermes skills outside the project skill tree

## Next step (not done)

**Proof pack** for pitch prep — see `docs/PITCH_PREP_STUB.md`.  
Deck / client proposal copy is deferred until Rommy confirms this checkpoint and starts proof-pack work.

## Handoff — start pitch prep from this file alone

Inputs for the operator:

1. This checkpoint (magic string + DoD table).
2. Walkable job folder `jobs/DCO-20260930-001/` (source → brief → plan → prompts → candidates → qa → approved → delivery).
3. Honest SHOT-02 override / geometry_drift note in `delivery/JOB_SUMMARY.md` and manifest.
4. `docs/PITCH_PREP_STUB.md` outline (proof pack only; no full deck here).
5. V0 deny list (above) — do not promise automation the MVP did not prove.

Pitch tracks (hypotheses only, after proof pack): furniture/ecommerce (PPH-style) and interiors/creative agency.


---

## Append — Model architecture V0 lock (2026-09-30T16:15:00+08:00)

**Change:** Hermes default model switched `gpt-6-luna` / High → **`gpt-6.1-sol` / Medium**.

| Item | Value |
|------|-------|
| Doc | `docs/MODEL_ARCHITECTURE_V0.md` |
| Config | `E:\Hermes\config.yaml` (`model.default`, `agent.reasoning_effort`) |
| Smoke | Text + vision **PASS** on new default (see `docs/PROVIDER_GATE.md` append) |
| Escalation | Same model + `--reasoning high` for difficult visual QA only |
| Image gen | Still manual ChatGPT Images; no Image API |
| Final authority | Rommy |
| Memory | Still 2g (`2147483648`) |
| Not done | No new bunk-bed job; no DFI; no Image API |

Checkpoint magic string **unchanged:** `MVP_READY_FOR_PITCH_PREPARATION`.

