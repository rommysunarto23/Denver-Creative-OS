# PROVIDER_GATE (DCO-0)

Hermes provider gate evidence. Paths and timestamps only. No tokens, no auth.json, no .env values.

## Environment (pre-smoke)

| Check | Result | Evidence |
|-------|--------|----------|
| Container name | hermes | `docker ps` |
| Status | Up | Up ~31+ minutes at gate start; still running after smokes |
| Memory limit | 2147483648 | `docker inspect hermes` HostConfig.Memory |
| Data root | `E:\Hermes` (container `/opt/data`) | listing succeeds |
| Provider | openai-codex | `E:\Hermes\config.yaml` model.provider |
| Default model | gpt-6-luna | config `model.default` |
| Reasoning | high | config `reasoning_effort: "high"`; smokes used `--reasoning high` |
| Gateway | running | `gateway_state.json` gateway_state=running |
| Paid Image API | DENY / not used | Gate uses vision analyze via chat `--image` only; no image_gen / FAL call |

FreeRAM note (host, Asia/Makassar): before text smoke ~1350.7 MB free of ~12067 MB total; after vision smoke ~1109.6 MB free. Container memory cap remains 2g (2147483648). Host free RAM is tight for further parallel hermes runs.

## Text ping

| Field | Value |
|-------|-------|
| Verdict | **PASS** |
| Timestamp start | 2026-09-30 08:31:43 +08:00 (Asia/Makassar) |
| Timestamp end | 2026-09-30 08:32:04 +08:00 (Asia/Makassar) |
| Wall time | 20.4 s (under 60 s perf budget) |
| Command | `docker exec hermes hermes chat -q "Reply with exactly one word: pong" --oneshot -Q --reasoning high --format text` |
| Output (redacted) | `pong` (non-empty; session_id omitted from secrets concern — session id is non-secret but not needed here) |
| Exit code | 0 |

## Vision smoke

| Field | Value |
|-------|-------|
| Verdict | **PASS** |
| Timestamp start | 2026-09-30 08:32:13 +08:00 (Asia/Makassar) |
| Timestamp end | 2026-09-30 08:32:38 +08:00 (Asia/Makassar) |
| Wall time | 25.1 s |
| Image path (host) | `E:\Hermes\workspace\dco0-gate\smoke.png` |
| Image path (container) | `/opt/data/workspace/dco0-gate/smoke.png` |
| Image source | Public Wikimedia Commons thumb (PNG transparency demo, 120px) |
| Command | `docker exec hermes hermes chat -q "Describe this image in one short sentence. What object or scene do you see?" --image /opt/data/workspace/dco0-gate/smoke.png --oneshot -Q --reasoning high --format text` |
| Output (redacted) | `A colorful cluster of four dice.` (non-empty QA text) |
| Exit code | 0 |
| Evidence missing | none |

## PASS/FAIL summary

| Gate | Verdict |
|------|---------|
| Text ping | PASS |
| Vision smoke | PASS |
| Memory 2147483648 | PASS |
| hermes Up | PASS |
| provider openai-codex | PASS |
| No secrets in this doc | PASS |
| No paid Image API in gate | PASS |

## Unit assert

Run: `denver-creative-os/docs/scripts/check_provider_gate.sh` (or `.ps1`).

Expects both markers in this file:

- `Text ping` section Verdict **PASS**
- `Vision smoke` section Verdict **PASS**

Exact marker strings used by the script:

- `TEXT_PING_PASS`
- `VISION_SMOKE_PASS`

TEXT_PING_PASS
VISION_SMOKE_PASS

## Blockers / notes for DCO-1

- DCO-0 does not create full `denver-creative-os` scaffold (README, .gitignore, jobs/, samples/, skills/). That is DCO-1.
- Host FreeRAM ~1.1–1.4 GB after smokes; keep hermes at `--memory=2g` and avoid parallel heavy agent runs during DCO-1 live lanes.
- Do not edit `E:\Hermes\.env` or commit `auth.json`.
- Do not touch DFI.
- Vision CLI is clear: `hermes chat --image <path>` with `--oneshot -Q`.


---

## Model switch append (2026-09-30 Asia/Makassar) — GPT-6.1 Sol Medium

Architecture lock documented in `docs/MODEL_ARCHITECTURE_V0.md`.

| Field | Before | After |
|-------|--------|-------|
| `model.default` | `gpt-6-luna` | `gpt-6.1-sol` |
| `agent.reasoning_effort` | `high` | `medium` |
| `model.provider` | `openai-codex` | `openai-codex` (unchanged) |
| Container memory | 2147483648 | 2147483648 (2g, unchanged) |
| Config path | `E:\Hermes\config.yaml` | same (`/opt/data/config.yaml`) |
| Backup | — | `E:\Hermes\backups\config\config.yaml.pre-sol-medium.20260930-161230` |

### Text ping (new default)

| Field | Value |
|-------|-------|
| Verdict | **PASS** |
| Timestamp start | 2026-09-30 16:13:11 +08:00 (Asia/Makassar) |
| Timestamp end | 2026-09-30 16:13:30 +08:00 (Asia/Makassar) |
| Wall time | 18.6 s |
| Model | `gpt-6.1-sol` (config default; no `-m`) |
| Reasoning | `medium` (`--reasoning medium`; session `reasoning_config.effort=medium`) |
| Command | `docker exec hermes hermes chat -q "Reply with exactly one word: pong" --oneshot -Q --reasoning medium --format text` |
| Output (redacted) | `pong` |
| Session | `20260930_081315_c05581` |
| Exit code | 0 |

### Vision smoke (new default)

| Field | Value |
|-------|-------|
| Verdict | **PASS** |
| Timestamp start | 2026-09-30 16:13:37 +08:00 (Asia/Makassar) |
| Timestamp end | 2026-09-30 16:14:04 +08:00 (Asia/Makassar) |
| Wall time | 27.1 s |
| Model | `gpt-6.1-sol` |
| Reasoning | `medium` |
| Image | `/opt/data/workspace/dco0-gate/smoke.png` (host `E:\Hermes\workspace\dco0-gate\smoke.png`) |
| Command | `docker exec hermes hermes chat -q "Describe this image in one short sentence. What object or scene do you see?" --image /opt/data/workspace/dco0-gate/smoke.png --oneshot -Q --reasoning medium --format text` |
| Output (redacted) | `The image shows four colorful dice clustered together.` |
| Session | `20260930_081342_64dabd` |
| Exit code | 0 |

### Markers (scripts still look for original PASS markers above)

TEXT_PING_PASS  
VISION_SMOKE_PASS  

Additional explicit markers for this switch:

SOL_MEDIUM_TEXT_PING_PASS  
SOL_MEDIUM_VISION_SMOKE_PASS  

Escalation for hard visual QA only: `--reasoning high` (same model). No Image API. No DFI secrets in this doc.

