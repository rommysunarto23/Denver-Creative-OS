---
name: denver-creative-os
description: Run a human-in-the-loop furniture/interiors product-to-lifestyle workflow with structured shot planning, prompt artifacts, visual QA, revision, and delivery packaging.
version: 0.1.0
platforms: [linux, macos, windows]
metadata:
  hermes:
    tags: [creative-production, image-generation, furniture, visual-qa]
    category: creative-production
---

# Denver Creative OS

Hermes project skill for one furniture/interiors demo job. V0 is **skill plus folders only**. Generation is manual via ChatGPT Images. Hermes owns reasoning, file artifacts, vision QA, revision prompts, and delivery packaging.

Canonical shot IDs (fixed for V0):

```text
SHOT-01-ANGLED
SHOT-02-STRAIGHT
SHOT-03-MEDIUM-CLOSE
```

Templates live under `templates/`. Rules live under `references/`. Job workspaces live under repo `jobs/DCO-YYYYMMDD-NNN/`.

## When to Use

Load this skill when the operator asks to:

- run a Denver Creative OS / DCO furniture product-to-lifestyle job;
- intake a product reference into a structured brief;
- plan the three canonical shots;
- write versioned generation prompts;
- pause for manual ChatGPT Images generation;
- run visual QA on candidates;
- revise a failed candidate prompt;
- record human approval;
- package three approved shots into delivery.

## Inputs

Minimum inputs for a job:

| Input | Path / form |
|-------|-------------|
| Job id | `jobs/DCO-YYYYMMDD-NNN/` |
| Source image | `source/product-reference.png` (immutable; never overwrite) |
| Operator facts | product class, known materials/colors, audience, visual world notes |
| Authorized asset | user-owned, fictional, or licensed — never reuse private client assets as pitch proof without permission |

Optional: corrected source as `source/product-reference-v2.png` with an explicit job.yaml note.

## Non-Negotiable Invariants (V0 Deny List)

**DENY — do not do any of these:**

1. **Paid Image API** — no OpenAI Images / DALL·E / equivalent API calls; incremental Image API spend must stay `0`.
2. **Browser automation** — no scraping, UI click automation, cookie reuse, or undocumented ChatGPT endpoints.
3. **Auto-approve** — Hermes may recommend APPROVE; only a human sets final APPROVED. Never auto-approve.
4. **Client external systems** — no n8n, MCP, cron, webhooks, or DFI coupling in V0.
5. **Secret leakage** — never write tokens, `.env`, or `auth.json` into job YAML/Markdown/chat.

**ALLOW:**

- skill → local job files;
- skill → Hermes vision on source/candidates;
- operator → ChatGPT Images UI (manual).

## Job States

Drive `job.yaml` `status` explicitly. No implicit jumps.

```text
CREATED → INTAKE → NEEDS_INPUT → BRIEF_APPROVED → SHOT_PLAN_READY
  → PROMPT_PACK_READY → AWAITING_GENERATION → CANDIDATES_READY
  → QA_REVIEW → (REVISION_REQUIRED → AWAITING_GENERATION) | HUMAN_APPROVAL
  → APPROVED → PACKAGED
```

Side state: `ABORTED`.

`job.yaml` minimum fields:

```yaml
job_id: DCO-YYYYMMDD-001
status: CREATED
product_label: ""
generation:
  mode: MANUAL_CHATGPT_IMAGES
  incremental_image_api_spend_usd: 0
shots:
  - SHOT-01-ANGLED
  - SHOT-02-STRAIGHT
  - SHOT-03-MEDIUM-CLOSE
current_revision_round: 0
```

## Job Folder Contract

```text
jobs/DCO-YYYYMMDD-001/
├── job.yaml
├── source/
│   └── product-reference.png
├── brief/
│   └── product-brief.yaml
├── plan/
│   └── shot-plan.yaml
├── prompts/
│   ├── shot-01-angled-v1.md
│   ├── shot-02-straight-v1.md
│   └── shot-03-medium-close-v1.md
├── candidates/
│   ├── SHOT-01-ANGLED/
│   ├── SHOT-02-STRAIGHT/
│   └── SHOT-03-MEDIUM-CLOSE/
├── qa/
├── approved/
└── delivery/
```

Copy shapes from `templates/` (`PRODUCT_BRIEF.yaml`, `SHOT_PLAN.yaml`, `QA_REPORT.yaml`, `DELIVERY_MANIFEST.yaml`). Apply `references/PRODUCT_FIDELITY_RULES.md` and `references/VISUAL_QA_RULES.md`.

## Procedure (Commands)

Execute these commands in order unless REVISE loops back to PAUSE.

### INTAKE

1. Set `status: INTAKE`.
2. Inspect `source/` with Hermes vision when available; if vision fails, STOP and report — do not add a paid vision/Image API key.
3. Separate **known facts** vs **inference** vs **unknowns**.
4. Write `brief/product-brief.yaml` from `templates/PRODUCT_BRIEF.yaml` (product_class, known_facts, must_preserve, flexible_styling, unknowns, target_audience, desired_visual_world).
5. If required facts are missing, set `status: NEEDS_INPUT` and ask the operator. Otherwise wait for human brief sign-off → `BRIEF_APPROVED`.

### PLAN

1. Require `BRIEF_APPROVED`.
2. Emit exactly three shots with ids `SHOT-01-ANGLED`, `SHOT-02-STRAIGHT`, `SHOT-03-MEDIUM-CLOSE`.
3. Write `plan/shot-plan.yaml` from `templates/SHOT_PLAN.yaml` (framing, purpose, must_show, constraints bound to must_preserve).
4. Set `status: SHOT_PLAN_READY`.

### PROMPT

1. Require `SHOT_PLAN_READY`.
2. For each shot write `prompts/<shot-slug>-v1.md` with sections: JOB, SHOT, SOURCE ANCHOR, MUST PRESERVE, SCENE, CAMERA, LIGHTING, NEGATIVE / DO NOT CHANGE, OUTPUT EXPECTATION.
3. Forbid redesign of the product; anchor identity to the source.
4. Set `status: PROMPT_PACK_READY`.

### PAUSE

1. Require `PROMPT_PACK_READY` (or return from REVISE with a new prompt version).
2. Set `status: AWAITING_GENERATION`.
3. Instruct the operator clearly:

```text
STATUS: AWAITING_GENERATION
NEXT: generate SHOT-XX using prompt <path>
SAVE TO: candidates/SHOT-XX/<candidate-id>.png
MODE: MANUAL_CHATGPT_IMAGES
DENY: Image API, browser automation
```

4. Stop. Do not generate images. Do not drive a browser. Wait for human file drops under `candidates/`.

### QA

1. When candidates exist, set `status: CANDIDATES_READY` then `QA_REVIEW`.
2. For each candidate write `qa/<candidate-id>.yaml` from `templates/QA_REPORT.yaml`.
3. Score criteria per `references/VISUAL_QA_RULES.md` with PASS/WARN/BLOCK only (no fake numeric quality score).
4. **Fail-closed:** any BLOCK on source fidelity or geometry → decision `REVISE`. No BLOCK → Hermes may recommend `APPROVE`; human still decides.
5. Record blocking_violations, revision_instruction, and leave `human_decision` empty until APPROVE.

### REVISE

1. **Gate:** REVISE requires a prior QA report with decision `REVISE` (or a BLOCK on fidelity/geometry). Do not revise on PASS-only reports.
2. Set `status: REVISION_REQUIRED`.
3. Preserve what already works; change the smallest instruction set.
4. Write `prompts/<shot-slug>-vN+1.md` with REVISION NOTES.
5. Default max **2** revision cycles per shot; then escalate to the operator.
6. Return to PAUSE (`AWAITING_GENERATION`) for the new prompt only.

### APPROVE

1. Require QA recommendation path complete for all three shots.
2. **Human-only.** Hermes must not auto-approve. Operator sets `human_decision: APPROVED` on each QA report and confirms.
3. Copy approved files into `approved/`.
4. Set `status: HUMAN_APPROVAL` then `APPROVED` after all three shots are human-approved.

### PACKAGE

1. Require three human-approved shots.
2. Copy finals into `delivery/` (`shot-01-angled.png`, `shot-02-straight.png`, `shot-03-medium-close.png`).
3. Write `delivery/DELIVERY_MANIFEST.yaml` from `templates/DELIVERY_MANIFEST.yaml` (lineage, prompt versions, qa APPROVED, `incremental_image_api_spend_usd: 0`).
4. Optionally write a short `delivery/QA_SUMMARY.md`.
5. Set `status: PACKAGED`.

## QA Rules

See `references/VISUAL_QA_RULES.md`. Summary:

| Criterion | Result |
|-----------|--------|
| source_fidelity | PASS/WARN/BLOCK |
| geometry | PASS/WARN/BLOCK |
| material_color | PASS/WARN/BLOCK |
| shot_compliance | PASS/WARN/BLOCK |
| lighting_shadow | PASS/WARN/BLOCK |
| scene_integration | PASS/WARN/BLOCK |
| ai_artifacts | PASS/WARN/BLOCK |
| commercial_usability | PASS/WARN/BLOCK |

Any BLOCK on source_fidelity or geometry → REVISE. Product fidelity before beauty.

## Revision Rules

- Prior QA fail/BLOCK is mandatory before REVISE.
- Smallest necessary prompt delta; do not rewrite the whole scene for one geometry miss.
- Version filenames; never overwrite prior prompt versions.
- Cap 2 cycles/shot unless operator overrides.

## Delivery Rules

- Exactly three approved assets matching canonical shot ids.
- Manifest must list file, prompt_version, qa: APPROVED, generation_method: MANUAL_CHATGPT_IMAGES, incremental_image_api_spend_usd: 0.
- Known limitations listed explicitly.

## Stop Conditions

Stop and report (do not workaround) when:

- vision/provider unavailable;
- operator requests abort → `ABORTED`;
- required source missing;
- Image API or browser automation would be needed to proceed;
- human approval withheld;
- revision cap exceeded without operator decision.

## Verification

Unit check for this skill:

```powershell
.\docs\scripts\check_skill_templates.ps1
```

Expect PASS for frontmatter name `denver-creative-os`, required template keys, fidelity QA fields, deny list (Image API, browser automation, auto-approve), and canonical shot ids.

## Project Skill Loading / Install (optional)

Prefer **project-local** load so the repo owns behavior:

1. Work from `E:\rommy\Denver Creative OS\denver-creative-os\`.
2. Trust the project skill root per your Hermes version (`hermes skills trust` or current equivalent — confirm with `hermes skills --help`).
3. Invoke the skill by name: `denver-creative-os`.

Optional install copy into Hermes skills (does **not** wipe bundled skills):

```powershell
# Copy only this skill; never delete E:\Hermes\skills\* bundles
$src = "E:\rommy\Denver Creative OS\denver-creative-os\skills\denver-creative-os"
$dst = "E:\Hermes\skills\creative\denver-creative-os"
New-Item -ItemType Directory -Force -Path (Split-Path $dst) | Out-Null
Copy-Item -Path $src -Destination $dst -Recurse -Force
```

- Destination under `creative\` keeps category grouping with other Hermes creative skills.
- Do **not** remove or overwrite unrelated bundled skills under `E:\Hermes\skills\`.
- Prefer project-local + trust over a permanent global copy for pitch reproducibility.
- Leave Hermes `SOUL.md` generic; DCO rules stay in this skill.

See also `INSTALL.md` in this folder.
