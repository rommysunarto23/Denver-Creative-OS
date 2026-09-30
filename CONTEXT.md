# CONTEXT.md — current state (Denver Creative OS)

**As of:** 2026-09-30 ~20:10 Asia/Makassar (UTC+8)
**Repo:** `rommysunarto23/Denver-Creative-OS` · branch `main`  
**Audience:** Codex / Cursor / operators. English + short ID summary.

---

## ID ringkas

- **V0.2-R2-Lite FREEZE APPROVED** — canonical: `denver-creative-os/docs/architecture/V02_R2_LITE.md`. **Codex: HOLD** until FINAL R2-lite coding handoff (after ChatGPT authority audit of docs cleanup).
- V0 demo **selesai** (`DCO-20260930-001` DELIVERED). Billing aligned with R2-lite: **incremental Image API-key spend US$0**; **`billing_mode: CHATGPT_CODEX_OAUTH`**; **subscription allowance consumed: UNKNOWN**.
- Ada lubang kontrak historis: SHOT-02 geometry BLOCK + override → package DELIVERED (V0 demo).
- Ideal **V0.2-R1** (`V02_R1.md` / FINAL R1 handoff) = **HISTORICAL / SUPERSEDED**. Do not implement PATCH-1..15 from R1.
- V0 manual ChatGPT Images path = **HISTORICAL**; active R2 gen = Hermes native `openai-codex` / Codex OAuth `image_generate`.
- Model Hermes default: **`gpt-6.1-sol` medium**. Hermes data: **`E:\Hermes`** (di luar repo).
- Authority chain: `routing.md` → `AGENTS.md` → this file → `ROADMAP.md` → **`V02_R2_LITE.md` (CANONICAL)**.
- **Codex session start:** HOLD — do not paste R1 start prompt for implementation; wait for FINAL R2-lite handoff.

---

## Product outcome (locked intent)

PPH / furniture **cutout** → Hermes orchestrates → **≥3** enterprise studio lifestyle shots → **Hermes `image_generate` (openai-codex / Codex OAuth)** for R2-lite candidates → Rommy human release gate / final authority.

Later (not now): email / WhatsApp / portal upload; paid OpenAI Images API key path only if operator opts in (not required). Manual ChatGPT Images paste is **historical demo path only**, not the intended R2-lite gen path.

---

## Repo layout (what lives where)

```text
E:\rommy\Denver Creative OS\                 ← git root
├── AGENTS.md / AGENT.md                     ← Codex contract (+ pointer)
├── routing.md / ROUTER.md                   ← router (+ pointer)
├── CONTEXT.md / ROADMAP.md                  ← state + sequencing
├── README.md, PRD_*.md, DOCS_README, BLUEPRINT (baseline copies)
├── docs\HERMES_MVP_MULTI_PHASE_PLAN.md
└── denver-creative-os\                      ← working package
    ├── docs\                                ← checkpoint, model, provider gate, architecture/*
    ├── skills\denver-creative-os\           ← SKILL.md + templates/references/fixtures
    ├── jobs\DCO-20260930-001\               ← demo proof + Sol retest
    └── samples\fictional-furniture\
```

**Out of repo:** `E:\Hermes` — Hermes container data root (`config.yaml`, workspace, possible skills install). Do not commit Hermes secrets or `auth.json`.

---

## Runtime / models

| Item | Current value | Evidence |
|------|---------------|----------|
| Agent runtime | Hermes Docker container `hermes` | `PROVIDER_GATE.md`, `MODEL_ARCHITECTURE_V0.md` (ops history) |
| Hermes data root | `E:\Hermes` | out of repo |
| Default model | **`gpt-6.1-sol`** | `model.default` |
| Default reasoning | **`medium`** | `agent.reasoning_effort` |
| Escalation | same model + `--reasoning high` (hard visual QA only) | MODEL doc (historical ops) |
| Provider | `openai-codex` (ChatGPT/Codex OAuth) | gate PASS |
| Image generation (active R2-lite) | **Hermes native `openai-codex` / Codex OAuth `image_generate`** | `V02_R2_LITE.md`; paid Images API key not required; human release gate kept |
| Billing | `CHATGPT_CODEX_OAUTH`; incremental Image API-key spend **US$0**; subscription **UNKNOWN** | `V02_R2_LITE.md` § Billing terminology |
| Container memory | ~2g (`2147483648`) | gate / model doc |
| Final authority | **Rommy** | always |

**Historical note:** V0 demo used `MANUAL_CHATGPT_IMAGES`. That path is superseded for active R2-lite work. Previous default model (`gpt-6-luna` / high) replaced 2026-09-30; Sol retest did **not** flip SHOT-02 Cand-04 geometry to PASS.

---

## Checkpoint honesty

`denver-creative-os/docs/CURRENT_CHECKPOINT.md` carries magic string:

```text
MVP_REOPENED_FOR_HERMES_NATIVE_CREATIVE_MESH_V02_R2_LITE
```

Architecture freeze treats **`V02_R2_LITE.md`** as **CANONICAL**. V0 demo / R1 / Ideal V0.2 materials are **historical baseline / audit trail**. Do **not** pitch "client-safe fidelity" on the SHOT-02 override path.

Demo lessons (geometry override contradiction — historical):

- Fail-closed geometry BLOCK ×4 on SHOT-02; GPT Image primary cause.
- Operator override B packaged Cand-04 with `geometry_drift: true`; Hermes stayed REVISE; status still DELIVERED.
- That contradiction is exactly what R2-lite release law must keep non-client-releasable (`EXPERIMENT_ACCEPTED` != client `RELEASE_ELIGIBLE`).

---

## What is done / not done

| Gate | Status |
|------|--------|
| DCO-0 provider gate (text + vision) | Proven |
| DCO-1 scaffold | Proven |
| DCO-2 project skill V0 | Proven (files in repo) |
| DCO-3 demo job end-to-end | Proven (`jobs/DCO-20260930-001/`) — historical manual Images path |
| Sol Medium model lock | Proven (smoke + retest docs) |
| Ideal V0.2 / **V0.2-R1** design | Written; **SUPERSEDED** by R2-lite (historical) |
| **V0.2-R2-Lite** architecture | **FREEZE APPROVED** (`V02_R2_LITE.md`) |
| R2-lite **skill/plugin implement** | **Not done** — Codex HOLD until FINAL R2-lite handoff |
| POS/NEG/AMB semantic fixtures + Mode A/B/C E2E | **Not done** |
| Identity lock proof trial | **Not done** (V0.1 track on roadmap) |
| Portal / paid Images API key | **Later** |

---

## Machine constraints (operators & agents)

1. Prefer native Windows paths under `E:\rommy\Denver Creative OS\`.  
2. Hermes CLI typical pattern: `docker exec hermes hermes …` (see MODEL / PROVIDER docs).  
3. Do not raise global reasoning to High; escalate per invocation only.  
4. Job folders are the source of truth for state (`job.yaml` + artifacts).  
5. `.gitignore` blocks `.env`, `auth.json`, keys, tokens — keep it that way.  
6. Fictional / owned assets only for pitch proof (`samples/fictional-furniture/`).  
7. Hermes project-skill load into `E:\Hermes\skills` vs project-local path: **still an ops gap** (see checkpoint known gaps).

---

## Pointers

- **Codex session start:** HOLD — wait for FINAL R2-lite handoff. Canonical architecture: `V02_R2_LITE.md`.
- Handoff pointer: `CODEX_HANDOFF.md` → HOLD + R2-lite pointer (R1 FINAL = historical)
- Behavior contract: `AGENTS.md`  
- Router: `routing.md`  
- Sequencing: `ROADMAP.md`  
- **Canonical architecture:** `denver-creative-os/docs/architecture/V02_R2_LITE.md`  
- Historical R1: `denver-creative-os/docs/architecture/V02_R1.md` (do not execute)
