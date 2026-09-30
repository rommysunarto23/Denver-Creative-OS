# CONTEXT.md — current state (Denver Creative OS)

**As of:** 2026-09-30 (Asia/Makassar, UTC+8)  
**Repo:** `rommysunarto23/Denver-Creative-OS` · branch `main`  
**Audience:** Codex / Cursor / operators. English + short ID summary.

---

## ID ringkas

- V0 demo **selesai** (`DCO-20260930-001` DELIVERED, Image API = US$0).
- Ada lubang kontrak: SHOT-02 geometry BLOCK + override → package DELIVERED.
- Ideal **V0.2** didesain di `docs/architecture/SYNTHESIS.md`; **belum** diimplement di skill.
- Model Hermes default: **`gpt-6.1-sol` medium**. Hermes data: **`E:\Hermes`** (di luar repo).
- Codex docs root: `AGENTS.md`, `routing.md`, this file, `ROADMAP.md`.

---

## Product outcome (locked intent)

PPH / furniture **cutout** → Hermes orchestrates → **≥3** enterprise studio lifestyle shots → **ChatGPT Images (human V0)** → Rommy final authority.

Later (not now): email / WhatsApp / portal upload; optional Image API only if manual preserve/lock-edit fail closed.

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
| Agent runtime | Hermes Docker container `hermes` | `PROVIDER_GATE.md`, `MODEL_ARCHITECTURE_V0.md` |
| Hermes data root | `E:\Hermes` | out of repo |
| Default model | **`gpt-6.1-sol`** | `model.default` |
| Default reasoning | **`medium`** | `agent.reasoning_effort` |
| Escalation | same model + `--reasoning high` (hard visual QA only) | MODEL doc |
| Provider | `openai-codex` (ChatGPT/Codex OAuth) | gate PASS |
| Image generation | **Manual ChatGPT Images UI** | no Image API |
| Container memory | ~2g (`2147483648`) | gate / model doc |
| Final authority | **Rommy** | always |

Previous default (`gpt-6-luna` / high) replaced 2026-09-30; Sol retest did **not** flip SHOT-02 Cand-04 geometry to PASS.

---

## Checkpoint honesty

`denver-creative-os/docs/CURRENT_CHECKPOINT.md` still carries magic string:

```text
MVP_READY_FOR_PITCH_PREPARATION
```

Architecture merge (`SYNTHESIS.md` / ChatGPT audit) treats the **fidelity/release contract** as **conceptually reopened** for Ideal V0.2 until POS/NEG/AMB fixtures pass. Do **not** pitch “client-safe fidelity” on the SHOT-02 override path.

Demo lessons (geometry override contradiction):

- Fail-closed geometry BLOCK ×4 on SHOT-02; GPT Image primary cause.
- Operator override B packaged Cand-04 with `geometry_drift: true`; Hermes stayed REVISE; status still DELIVERED.
- That contradiction is exactly what Ideal V0.2 release law closes (`EXPERIMENT_ACCEPTED` ≠ client `RELEASE_ELIGIBLE`).

---

## What is done (V0)

| Gate | Status |
|------|--------|
| DCO-0 provider gate (text + vision) | Proven |
| DCO-1 scaffold | Proven |
| DCO-2 project skill V0 | Proven (files in repo) |
| DCO-3 demo job end-to-end | Proven (`jobs/DCO-20260930-001/`) |
| Sol Medium model lock | Proven (smoke + retest docs) |
| Ideal V0.2 **design** (SYNTHESIS) | Written |
| Ideal V0.2 **skill implement** | **Not done** (pending ChatGPT final + Codex) |
| POS/NEG/AMB semantic fixtures | **Not done** |
| Identity lock proof trial | **Not done** (V0.1 track on roadmap) |
| Portal / Image API | **Later** |

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

- Behavior contract: `AGENTS.md`  
- Router: `routing.md`  
- Sequencing: `ROADMAP.md`  
- Ideal V0.2: `denver-creative-os/docs/architecture/SYNTHESIS.md`