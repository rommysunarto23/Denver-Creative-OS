# CURRENT_CHECKPOINT

**Status:** `MVP_REOPENED_FOR_HERMES_NATIVE_CREATIVE_MESH_V02_R2_LITE`
**Written:** 2026-09-30T19:55:00+08:00 (Asia/Makassar)
**Demo job:** `DCO-20260930-001`  
**Product target (operator):** PPH-style furniture AI lifestyle from cutouts → enterprise studio (≥3 shots); Hermes orchestrates; V0 gen = Hermes image_generate (Codex OAuth; handoff amended); Rommy cross-check / human release gate before client; email/WA/portal later.

## Magic string

MVP_REOPENED_FOR_HERMES_NATIVE_CREATIVE_MESH_V02_R2_LITE

**PATCH-0 (2026-09-30, Asia/Makassar):** Fidelity/release contract reopened under [`FINAL_CODEX_HANDOFF_DCO_V02_R1.md`](architecture/FINAL_CODEX_HANDOFF_DCO_V02_R1.md) §35. The V0 demo remains historical orchestration proof; its SHOT-02 geometry override does not establish V0.2-R1 client-release eligibility.

Pitch preparation remains gated until every item in the handoff's **Pitch-ready return gate** passes, including POS/NEG/AMB 9/9 on Sol Medium, SOURCE_PRESERVE E2E, and NOVEL_VIEW insufficient-evidence routing. PATCH-0 changes checkpoint status only; contract implementation and acceptance are pending.
**V0 gen path amended (2026-09-30 Asia/Makassar, handoff authority):** Hermes `image_generate` via OpenAI Codex OAuth — not manual ChatGPT Images paste. Human release gate + SOURCE_PRESERVE / Evidence Authority unchanged. Implementation still pending PATCH sequence; this line is docs/handoff only.


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

- Paid OpenAI Images API key as required V0 dependency (optional later)
- Browser automation of ChatGPT Images UI
- Auto client-release without human gate
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

**Codex HOLD.** Wait for ChatGPT final repo audit + post-audit Codex handoff. Do **not** implement PATCH-1..15 from R1.
Architecture candidate: `architecture/V02_R2_LITE.md`.

## Historical V0 pitch handoff — superseded by PATCH-0

The following V0 handoff is historical context. Current next action is PATCH-1; this section does not authorize pitch preparation while the fidelity contract is reopened.

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
| Image gen | Handoff amended: Hermes Codex OAuth `image_generate` (impl pending); paid Images API key not required |
| Final authority | Rommy |
| Memory | Still 2g (`2147483648`) |
| Not done | No new bunk-bed job; no DFI; no Image API |

Historical checkpoint at the time of this V0 model-lock append: `MVP_READY_FOR_PITCH_PREPARATION`. Current status is the reopened V0.2-R1 magic string above.

## Append — V0.2-R2-Lite accepted (2026-09-30T19:55:00+08:00)

**Magic string:** `MVP_REOPENED_FOR_HERMES_NATIVE_CREATIVE_MESH_V02_R2_LITE`

| Item | Value |
|------|-------|
| Canonical architecture | [`architecture/V02_R2_LITE.md`](architecture/V02_R2_LITE.md) |
| Operator status | ACCEPTED for ChatGPT final repo audit (Grok reconciled R2-lite) |
| Codex | **HOLD** — do not implement PATCH-1..15 from R1; wait for post-audit handoff |
| R1 handoff | SUPERSEDED (historical). PATCH-0 local reopen folded into this checkpoint |
| Next | ChatGPT final repo audit → freeze → Codex implementation handoff |

**Grok residual risks (implementation smoke, not redesign):** (1) `ctx.dispatch_tool` from tool handler must be smoked on this Hermes install; (2) project plugins need `HERMES_ENABLE_PROJECT_PLUGINS=true` + `plugins.enabled`; (3) single pitch gate requires Mode A+B+C+9/9 before any pitch.

**Next step (supersedes PATCH-1):** No Codex patches until post-audit handoff. Do not start skill/plugin/code.
