# CONTEXT.md — current state (Denver Creative OS)

**As of:** 2026-09-30 ~19:55 Asia/Makassar (UTC+8)
**Repo:** `rommysunarto23/Denver-Creative-OS` · branch `main`  
**Audience:** Codex / Cursor / operators. English + short ID summary.

---

## ID ringkas

- **V0.2-R2-Lite ACCEPTED** (2026-09-30) for ChatGPT final repo audit — canonical: `denver-creative-os/docs/architecture/V02_R2_LITE.md`. **Codex: HOLD.** R1 handoff SUPERSEDED; do **not** implement PATCH-1..15 from R1; wait for post-audit Codex handoff.
- V0 demo **selesai** (`DCO-20260930-001` DELIVERED, paid Image API key = US## ID ringkas

- V0 demo **selesai** (`DCO-20260930-001` DELIVERED, paid Image API key = US$0). **V0 gen path amended:** Hermes Codex OAuth `image_generate` (docs/handoff; skill impl pending).
- Ada lubang kontrak: SHOT-02 geometry BLOCK + override → package DELIVERED.
- Ideal **V0.2-R1** (`V02_R1.md` / FINAL R1 handoff) — **SUPERSEDED / HOLD**. Do not implement PATCH-1..15 from R1. Succeeded by **V0.2-R2-Lite** (`V02_R2_LITE.md`).
- Model Hermes default: **`gpt-6.1-sol` medium**. Hermes data: **`E:\Hermes`** (di luar repo).
- Codex docs root: `AGENTS.md`, `routing.md`, this file, `ROADMAP.md`.
- **Codex session start:** HOLD — do not paste R1 start prompt for implementation; wait for post-audit handoff. Architecture candidate: `V02_R2_LITE.md`.

---

## Product outcome (locked intent)

PPH / furniture **cutout** → Hermes orchestrates → **≥3** enterprise studio lifestyle shots → **Hermes `image_generate` (OpenAI Codex OAuth)** for V0 candidates → Rommy human release gate / final authority.

Later (not now): email / WhatsApp / portal upload; paid OpenAI Images API key path only if operator opts in (not required for V0). Manual ChatGPT Images paste is no longer the intended V0 gen path.

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
| Image generation | **Hermes `image_generate` + OpenAI Codex OAuth** (V0 path; handoff amended) | paid Images API key not required; human release gate kept |
| Container memory | ~2g (`2147483648`) | gate / model doc |
| Final authority | **Rommy** | always |

Previous default (`gpt-6-luna` / high) replaced 2026-09-30; Sol retest did **not** flip SHOT-02 Cand-04 geometry to PASS.

---

## Checkpoint honesty

`denver-creative-os/docs/CURRENT_CHECKPOINT.md` still carries magic string:

```text
MVP_REOPENED_FOR_HERMES_NATIVE_CREATIVE_MESH_V02_R2_LITE
```

Architecture merge treats the **fidelity/release contract** as **conceptually reopened** for Ideal **V0.2-R1** (`V02_R1.md`; V0.2 base in `SYNTHESIS.md`) until R1 return gate (9/9 fixtures + SOURCE_PRESERVE E2E + override impossible). Do **not** pitch "client-safe fidelity" on the SHOT-02 override path.

Demo lessons (geometry override contradiction):

- Fail-closed geometry BLOCK ×4 on SHOT-02; GPT Image primary cause.
- Operator override B packaged Cand-04 with `geometry_drift: true`; Hermes stayed REVISE; status still DELIVERED.
- That contradiction is exactly what Ideal V0.2 / V0.2-R1 release law closes (`EXPERIMENT_ACCEPTED` != client `RELEASE_ELIGIBLE`).

---

## What is done (V0)

| Gate | Status |
|------|--------|
| DCO-0 provider gate (text + vision) | Proven |
| DCO-1 scaffold | Proven |
| DCO-2 project skill V0 | Proven (files in repo) |
| DCO-3 demo job end-to-end | Proven (`jobs/DCO-20260930-001/`) |
| Sol Medium model lock | Proven (smoke + retest docs) |
| Ideal V0.2 design (SYNTHESIS) + **V0.2-R1** (`V02_R1.md`) | Written; R1 **ACCEPTED by Rommy 2026-09-30**; Codex handoff ready |
| Ideal V0.2-R1 **skill implement** | **Not done** (wait: explicit Codex implementation task; intentionally excluded here) |
| POS/NEG/AMB semantic fixtures | **Not done** |
| Identity lock proof trial | **Not done** (V0.1 track on roadmap) |
| Portal / paid Images API key | **Later** (V0 gen = Hermes Codex OAuth; see FINAL handoff) |

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

- **Codex session start:** HOLD — do not paste R1 start prompt for implementation; wait for post-audit handoff. Architecture candidate: `V02_R2_LITE.md`.
- Handoff pointer: `CODEX_HANDOFF.md` → FINAL authority + checklist  
- Behavior contract: `AGENTS.md`  
- Router: `routing.md`  
- Sequencing: `ROADMAP.md`  
- Ideal V0.2-R1: `denver-creative-os/docs/architecture/V02_R1.md` (base: `SYNTHESIS.md`)  
- Session checklist: `denver-creative-os/docs/architecture/CODEX_SESSION_CHECKLIST.md`
