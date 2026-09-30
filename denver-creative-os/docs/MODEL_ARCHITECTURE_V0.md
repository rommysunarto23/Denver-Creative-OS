# MODEL_ARCHITECTURE_V0

**Locked:** 2026-09-30T16:15:00+08:00 (Asia/Makassar)  
**Scope:** Denver Creative OS V0 - Hermes agent runtime model tree.  
**Proof:** config switch + text/vision smoke (see `PROVIDER_GATE.md` append + smoke table below).

## Architecture tree (locked)

```text
Agent Runtime:     Hermes (docker container `hermes`, data root E:\Hermes)
Reasoning/Vision:  GPT-6.1 Sol @ Medium   <-- DEFAULT
Escalation:        GPT-6.1 Sol @ High     <-- difficult visual QA only
Image Generator:   ChatGPT Images         <-- manual human checkpoint (NO Image API)
Final Authority:   Rommy
```

## Exact model / config IDs

| Role | Exact id / value | Where |
|------|------------------|-------|
| Default model | `gpt-6.1-sol` | `E:\Hermes\config.yaml` -> `model.default` (also `/opt/data/config.yaml` in container) |
| Provider | `openai-codex` | `model.provider` (unchanged) |
| Default reasoning | `medium` | `agent.reasoning_effort` in same config |
| Escalation reasoning | `high` | per-invocation override (not the default) |
| Catalog aliases seen | `openai/gpt-6.1-sol`, `openai/gpt-6.1-sol-pro` | Hermes model catalog / models.dev cache - **active wire id for Codex is bare `gpt-6.1-sol`** (matches prior `gpt-6-luna` style) |

Previous default (replaced): `gpt-6-luna` + `reasoning_effort: "high"`.  
Backup before switch: `E:\Hermes\backups\config\config.yaml.pre-sol-medium.20260930-161230`.

## How Hermes applies this

1. **Default path (intake / plan / prompt / routine vision QA):** use config defaults - no `-m` / `--reasoning` needed.
2. **Escalation (hard visual QA only):** same model id, raise reasoning to High for that run only.
3. **Image generation:** operator runs ChatGPT Images UI manually at the PAUSE / `AWAITING_GENERATION` checkpoint. Hermes does not call any paid Image API in V0.
4. **Final authority:** Rommy approves / overrides. Hermes may recommend only.

## Escalation - practical flag / CLI

Official CLI (proven in Hermes help):

```powershell
docker exec hermes hermes chat -q "<hard visual QA prompt>" --image <container-path> --oneshot -Q --reasoning high --format text
```

Notes:

- `--reasoning high` overrides `agent.reasoning_effort` for that session only (same levels as `/reasoning` slash command).
- Do **not** change the global default to High for escalation; leave config at Medium.
- Optional explicit model pin (usually unnecessary after switch): `-m gpt-6.1-sol`.
- Supported reasoning values for `gpt-6.1-sol` on openai-codex (from provider 400 text during aux title path): `low`, `medium`, `high`, `xhigh`, `max`. Prefer Medium default; High for hard visual QA.

**Operator convention if CLI unavailable in a future surface:** state in the job QA note `reasoning_effort: high` / "escalate Sol High for this shot" and re-run with `--reasoning high`. Do not invent Image API or browser automation.

## Smoke proof (NEW default)

| Gate | Verdict | Model | Reasoning | Wall | Session |
|------|---------|-------|-----------|------|---------|
| Text ping | **PASS** | `gpt-6.1-sol` | `medium` | 18.6 s | `20260930_081315_c05581` |
| Vision smoke | **PASS** | `gpt-6.1-sol` | `medium` | 27.1 s | `20260930_081342_64dabd` |

Commands (Asia/Makassar wall times ~16:13-16:14):

```powershell
docker exec hermes hermes chat -q "Reply with exactly one word: pong" --oneshot -Q --reasoning medium --format text
docker exec hermes hermes chat -q "Describe this image in one short sentence. What object or scene do you see?" --image /opt/data/workspace/dco0-gate/smoke.png --oneshot -Q --reasoning medium --format text
```

Evidence (no secrets): `state.db` sessions rows show `model=gpt-6.1-sol` and `reasoning_config.effort=medium`; `agent.log` lines `model=gpt-6.1-sol` for both sessions. Text output `pong`. Vision output mentions four colorful dice.

Container memory remained `2147483648` (2g). Status: Up.

## V0 denies (unchanged)

- No paid Image API / image_gen automation
- No browser control of ChatGPT UI
- No new bunk-bed / next product job started by this switch
- No DFI secrets in docs or git
- Keep Hermes `--memory=2g`

## Config change commands used

```powershell
docker exec hermes hermes config set model.default gpt-6.1-sol
docker exec hermes hermes config set agent.reasoning_effort medium --force
```

Note: `hermes config get agent.reasoning_effort` warns the key is unrecognized by the CLI schema, but runtime (`agent` section) and session `reasoning_config` both apply it - confirmed by smoke DB rows.
