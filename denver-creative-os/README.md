# Denver Creative OS

Local Hermes skill + folder workspace for a human-in-the-loop furniture/interiors product-to-lifestyle demo.

**Root:** `E:\rommy\Denver Creative OS\denver-creative-os\`

## Immediate Goal

Build only this loop:

```text
Product reference
      →
Hermes product intake
      →
Fidelity contract
      →
3-shot plan
      →
Versioned prompt pack
      →
Manual ChatGPT Images generation
      →
Hermes vision QA
      →
Revision if needed
      →
Human approval
      →
3-image delivery package
```

North star: **One product → three approved commercial shots with traceable workflow and zero incremental Image API spend.**

The MVP must be demonstrable in one focused day. V0 is skill plus folders only.

## Explicit V0 Deny List

Do **not** add any of the following in V0:

| Denied | Reason |
|--------|--------|
| **Image API** | Zero incremental Image API spend; generation is manual via ChatGPT Images UI |
| **Browser automation** | No background/browser-control of ChatGPT UI |
| **n8n** | No workflow graph / DFI coupling; deferred until external integrations exist |
| **MCP** | Out of scope for V0 |
| **cron** | No Hermes cron / unattended scheduling for V0 |

Also out of scope V0: webhooks, database, VPS, local FLUX requirement, multi-agent architecture, fully autonomous approval, production-ready claims.

## Architecture (V0)

```text
HERMES = reasoning + workflow procedure + vision QA
FILES  = job state + prompt history + QA history
HUMAN  = generation + final approval
```

Dependency rules:

```text
skill → local files                 ALLOW
skill → Hermes vision               ALLOW
operator → ChatGPT Images UI        ALLOW
Hermes → paid Image API             DENY V0
Hermes → browser-control ChatGPT    DENY V0
Hermes → client external systems    DENY V0
```

## Layout

```text
denver-creative-os/
├── README.md
├── .gitignore
├── docs/                    # pointers + PROVIDER_GATE + scripts
├── jobs/                    # job workspaces (stub)
├── samples/fictional-furniture/  # demo sample stub
└── skills/denver-creative-os/    # project skill stub (SKILL.md in DCO-2)
```

## Source documents (parent folder — do not move)

Canonical PRD/blueprint/readme stay at the parent path. Pointers live under `docs/`:

1. `../PRD_DENVER_CREATIVE_OS.md`
2. `../DENVER_CREATIVE_OS_ARCHITECTURE_AND_REPO_BLUEPRINT.md`
3. `../DENVER_CREATIVE_OS_DOCS_README.md`

## Scaffold check

```powershell
.\docs\scripts\check_scaffold.ps1
```

```bash
bash docs/scripts/check_scaffold.sh
```

## Status

- DCO-0: provider gate evidence in `docs/PROVIDER_GATE.md`
- DCO-1: this scaffold
- DCO-2+: skill body, demo job, checkpoint — not in this PR
