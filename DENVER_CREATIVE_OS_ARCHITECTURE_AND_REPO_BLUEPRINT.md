# Denver Creative OS — Architecture & Repository Blueprint
## Hermes-Only, Local-First, Human-in-the-Loop MVP

**Disusun:** 30 September 2026  
**Status:** Architecture baseline for V0; approved implementation direction  
**Scope:** Furniture/interiors product-to-lifestyle workflow that can be completed in one focused day  
**Primary constraint:** zero incremental Image API spend

---

## 1. Architecture Decision Summary

### Decision

Gunakan:

> **Hermes Agent + one project-local SKILL.md + local file workspace + manual ChatGPT Images checkpoint.**

Tidak menggunakan pada V0:

- n8n;
- MCP;
- webhook;
- custom backend;
- Svelte/React UI;
- database;
- Supabase;
- Redis;
- VPS;
- Docker requirement;
- image-generation API;
- local FLUX;
- browser automation;
- multi-agent team.

### Rationale

V0 harus membuktikan **workflow value**, bukan infrastructure sophistication.

Kebutuhan inti adalah:

```text
understand product
→ preserve constraints
→ plan shots
→ write prompts
→ pause for human generation
→ inspect images
→ decide revision
→ package outputs
```

Hermes sudah menyediakan agent runtime, tools, skills, files, and vision-capable provider paths. Menambah n8n atau backend pada hari pertama hanya menciptakan plumbing yang belum dibutuhkan.

### Architecture Style

> **Single-agent, file-oriented workflow with explicit human checkpoint.**

Supporting principle:

> **Skill before plugin.**

Hermes documentation recommends a Skill when a capability can be expressed as instructions + existing tools and does not require custom auth/binary processing logic inside Hermes.

---

## 2. Technology Stack

| Area | Decision | Notes |
|---|---|---|
| Agent runtime | **Hermes Agent** | Local CLI/Desktop |
| OS path | Native Windows preferred for current operator; WSL2 acceptable fallback | Follow current official Hermes installer |
| Main inference | **OpenAI Codex via ChatGPT OAuth** | Verify actual account eligibility during setup |
| Vision | **Codex OAuth/main provider** | Must pass image smoke test |
| Image generation | **ChatGPT Images UI/manual** | Existing subscription; no API call |
| Workflow extension | **Hermes project skill** | One skill only V0 |
| State | YAML + Markdown + folders | No DB |
| Source assets | Local files | Preserve originals |
| Prompt artifacts | Markdown | Versioned by filename |
| QA artifacts | YAML/Markdown | PASS/WARN/BLOCK |
| Version control | Git | Docs/skills/templates |
| Job outputs | Local `jobs/` | May be gitignored |
| Secrets | Hermes auth store | Never repository |
| External automation | None | Deferred |
| Local image inference | None | Deferred |

### Current Hermes Setup Reference

Official current quick-install paths include:

**Native Windows / PowerShell**

```powershell
iex (irm https://hermes-agent.nousresearch.com/install.ps1)
```

**Linux/macOS/WSL2**

```bash
curl -fsSL https://hermes-agent.nousresearch.com/install.sh | bash
```

Verification:

```text
hermes doctor
hermes model
hermes
```

Provider selection:

```text
OpenAI Codex
→ ChatGPT / Codex Subscription
→ device-code OAuth
```

Do not hardcode auth commands beyond current official CLI behavior; Cursor/Codex should verify against installed Hermes help before changing config.

---

## 3. Repository Structure

```text
denver-creative-os/
├─ README.md
├─ .gitignore
├─ AGENTS.md                              # optional handoff notes for coding agents
│
├─ docs/
│  ├─ PRD_DENVER_CREATIVE_OS.md
│  ├─ DENVER_CREATIVE_OS_ARCHITECTURE_AND_REPO_BLUEPRINT.md
│  ├─ DENVER_CREATIVE_OS_DOCS_README.md
│  └─ CURRENT_CHECKPOINT.md              # created/updated after implementation
│
├─ skills/
│  └─ denver-creative-os/
│     ├─ SKILL.md
│     ├─ references/
│     │  ├─ PRODUCT_FIDELITY_RULES.md
│     │  └─ VISUAL_QA_RULES.md
│     └─ templates/
│        ├─ PRODUCT_BRIEF.yaml
│        ├─ SHOT_PLAN.yaml
│        ├─ QA_REPORT.yaml
│        └─ DELIVERY_MANIFEST.yaml
│
├─ jobs/
│  └─ .gitkeep
│
└─ samples/
   └─ fictional-furniture/
      ├─ README.md
      └─ source/
```

### Why one project skill?

V0 intentionally does **not** create separate:

```text
intake-agent
shot-agent
qa-agent
revision-agent
delivery-agent
```

All procedures live in:

```text
skills/denver-creative-os/SKILL.md
```

Reason:

- one-day build;
- one agent;
- one state model;
- less routing ambiguity;
- easier debugging;
- easier demo;
- easier Cursor/Codex handoff.

Split skills only if the single skill becomes materially hard to maintain.

---

## 4. Dependency Rule

Core workflow:

```text
Hermes
  ↓
Project Skill
  ↓
Local Job Workspace
  ↑
Human Operator
  ↓
ChatGPT Images UI
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

Generation is deliberately **outside** the agent automation boundary.

---

## 5. Workflow Modules

### 5.1 Intake

Responsibilities:

- inspect source image;
- parse operator facts;
- separate fact vs inference;
- identify unknowns;
- build product fidelity contract.

Output:

`product-brief.yaml`

### 5.2 Shot Planning

Responsibilities:

- build required three shots;
- define framing and commercial purpose;
- bind each shot to must-preserve fields.

Output:

`shot-plan.yaml`

V0 canonical shot IDs:

```text
SHOT-01-ANGLED
SHOT-02-STRAIGHT
SHOT-03-MEDIUM-CLOSE
```

### 5.3 Prompt Authoring

Responsibilities:

- translate shot plan into generation instruction;
- preserve anchor identity;
- forbid redesign;
- name environment/lighting;
- create versioned prompt.

Output:

`prompts/<shot>-vN.md`

### 5.4 Generation Checkpoint

Responsibilities belong to human operator:

- open ChatGPT Images;
- attach authorized source/reference;
- paste current prompt;
- generate;
- save output to candidate folder.

The agent must output a clear instruction:

```text
STATUS: AWAITING_GENERATION
NEXT: generate SHOT-XX using prompt <path>
SAVE TO: <candidate path>
```

### 5.5 Visual QA

Responsibilities:

- compare source vs candidate;
- compare candidate vs shot requirements;
- create criterion findings;
- identify blocker;
- recommend APPROVE or REVISE.

Output:

`qa/<candidate-id>.yaml`

### 5.6 Revision

Responsibilities:

- preserve what already works;
- target only failed criteria;
- produce vN+1 prompt;
- avoid prompt drift.

### 5.7 Delivery Packaging

Responsibilities:

- verify 3 approved shots exist;
- copy/finalize files into delivery folder;
- generate manifest;
- generate QA summary.

---

## 6. Hermes Skill Contract

Target file:

```text
skills/denver-creative-os/SKILL.md
```

Expected frontmatter:

```yaml
---
name: denver-creative-os
description: Run a human-in-the-loop furniture/interiors product-to-lifestyle workflow with structured shot planning, prompt artifacts, visual QA, revision, and delivery packaging.
version: 0.1.0
metadata:
  hermes:
    tags: [creative-production, image-generation, furniture, visual-qa]
    category: creative-production
---
```

The skill should contain:

```text
When to Use
Inputs
Non-Negotiable Invariants
Job States
Procedure
QA Rules
Revision Rules
Delivery Rules
Stop Conditions
Verification
```

### Project Skill Loading

Hermes supports project skills discovered from trusted project roots.

From repository root:

```text
hermes skills trust
```

Cursor/Codex must verify the installed Hermes version and command help before relying on the command.

A project skill is preferable to copying the MVP skill into a global user directory because:

- repo owns behavior;
- repo versioning is explicit;
- pitch/demo remains reproducible;
- global Hermes setup stays clean.

---

## 7. Provider & Authentication Boundary

### Main Provider

Preferred:

```text
Hermes
  ↓
OpenAI Codex provider
  ↓
ChatGPT OAuth device login
  ↓
Codex model
```

Official Hermes documentation states that Codex can authenticate through ChatGPT OAuth and stores credentials in Hermes' auth store.

### Hard Gate

Implementation must validate:

1. login;
2. text reasoning;
3. tool usage;
4. vision on an image.

If vision requires a separate paid API key in the actual environment:

> STOP. Do not add it.

### Quota Discipline

Hermes documentation does not provide a universal guarantee for how every ChatGPT plan tier/quota behaves.

Therefore:

- do not encode assumed monthly/daily allowance;
- do not claim unlimited use;
- do not add automatic API-key fallback;
- record actual setup behavior in `CURRENT_CHECKPOINT.md`.

---

## 8. File / Job Pipeline

### 8.1 Job Folder

```text
jobs/DCO-YYYYMMDD-001/
├─ job.yaml
├─ source/
│  └─ product-reference.png
├─ brief/
│  └─ product-brief.yaml
├─ plan/
│  └─ shot-plan.yaml
├─ prompts/
│  ├─ shot-01-angled-v1.md
│  ├─ shot-02-straight-v1.md
│  └─ shot-03-medium-close-v1.md
├─ candidates/
│  ├─ SHOT-01-ANGLED/
│  ├─ SHOT-02-STRAIGHT/
│  └─ SHOT-03-MEDIUM-CLOSE/
├─ qa/
├─ approved/
└─ delivery/
```

### 8.2 Source Immutability

Never overwrite:

```text
source/*
```

If a corrected source is required:

```text
source/product-reference-v2.png
```

and update job manifest explicitly.

---

## 9. State Model

`job.yaml` minimum:

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

Lifecycle:

```text
CREATED
↓
INTAKE
↓
NEEDS_INPUT
↓
BRIEF_APPROVED
↓
SHOT_PLAN_READY
↓
PROMPT_PACK_READY
↓
AWAITING_GENERATION
↓
CANDIDATES_READY
↓
QA_REVIEW
├─→ REVISION_REQUIRED
│      ↓
│  AWAITING_GENERATION
↓
HUMAN_APPROVAL
↓
APPROVED
↓
PACKAGED
```

No implicit status changes.

---

## 10. Product Fidelity Rules

The skill must distinguish:

### Hard Constraints

Examples:

- frame/silhouette;
- visible structure;
- ladder position;
- rail count;
- legs;
- material;
- base color;
- important joins/hardware;
- product proportions.

A hard-constraint mismatch:

```text
severity = BLOCK
decision = REVISE
```

### Soft Constraints

Examples:

- decor;
- accessory selection;
- wall treatment;
- neutral styling;
- non-product textiles;
- greenery;
- ambient detail.

Soft deviations may be WARN.

---

## 11. QA Engine — Procedural, Not Custom Code

V0 QA is performed through Hermes reasoning + vision.

Per candidate:

| Criterion | Result |
|---|---|
| Source fidelity | PASS/WARN/BLOCK |
| Geometry | PASS/WARN/BLOCK |
| Material/color | PASS/WARN/BLOCK |
| Shot compliance | PASS/WARN/BLOCK |
| Lighting/shadow realism | PASS/WARN/BLOCK |
| Scene integration | PASS/WARN/BLOCK |
| AI artifacts | PASS/WARN/BLOCK |
| Commercial usability | PASS/WARN/BLOCK |

Final rule:

```text
any BLOCK in source fidelity or geometry
→ REVISE

no BLOCK
→ Hermes may recommend APPROVE
→ human decides final approval
```

Do not implement a fake numeric “quality score” in V0.

---

## 12. Prompt Versioning

Filename:

```text
shot-01-angled-v1.md
shot-01-angled-v2.md
```

Each prompt contains:

```text
JOB
SHOT
SOURCE ANCHOR
MUST PRESERVE
SCENE
CAMERA
LIGHTING
NEGATIVE / DO NOT CHANGE
OUTPUT EXPECTATION
REVISION NOTES (v2+)
```

Prompt revision rule:

> Change the smallest necessary instruction set.

Do not rewrite the whole visual world because one geometry detail failed.

---

## 13. Manual Image-Generation Boundary

### V0 Architecture

```text
Hermes writes prompt
       ↓
operator opens ChatGPT
       ↓
operator uploads source
       ↓
operator generates image
       ↓
operator saves candidate
       ↓
Hermes resumes
```

### Explicitly Forbidden

Do not:

- scrape ChatGPT;
- automate UI clicks;
- reuse browser session cookies programmatically;
- simulate API through undocumented endpoint;
- add OpenAI Image API key without approval.

Reason:

- cost control;
- reliability;
- account safety;
- one-day scope.

---

## 14. Delivery Manifest

Example fields:

```yaml
job_id: DCO-YYYYMMDD-001
product_label: Sample Bed
generation_method: MANUAL_CHATGPT_IMAGES
incremental_image_api_spend_usd: 0
approved_assets:
  - shot_id: SHOT-01-ANGLED
    file: shot-01-angled.png
    prompt_version: 2
    qa: APPROVED
  - shot_id: SHOT-02-STRAIGHT
    file: shot-02-straight.png
    prompt_version: 1
    qa: APPROVED
  - shot_id: SHOT-03-MEDIUM-CLOSE
    file: shot-03-medium-close.png
    prompt_version: 1
    qa: APPROVED
known_limitations: []
```

---

## 15. Security & Privacy Boundary

### Secrets

Allowed location:

- Hermes auth store;
- OS/user credential store as managed by Hermes.

Forbidden:

- repo;
- Markdown;
- YAML job files;
- screenshots;
- sample folders.

### Client Assets

V0 demo must use:

- user-owned asset;
- self-generated fictional asset;
- licensed/publicly permitted asset.

Do not reuse an active marketplace client's private source attachment as off-platform marketing proof without permission.

### Model Upload

Before sending a real client asset to any hosted model:

- confirm operator is authorized;
- follow client confidentiality requirements;
- do not assume private asset permission from public job listing alone.

---

## 16. Repository .gitignore Policy

Recommended ignores:

```text
jobs/**
!jobs/.gitkeep
.hermes-local/
*.tmp
*.log
.env
.env.*
```

Do not ignore:

```text
docs/**
skills/**
samples/fictional-furniture/**
```

unless sample assets contain restricted content.

---

## 17. Testing Strategy

### Test 1 — Missing Source

Input:

```text
create furniture job without source
```

Expected:

```text
NEEDS_INPUT
no prompt pack
```

### Test 2 — Normal Planning

Input:

- valid source;
- basic product facts.

Expected:

- product brief;
- exactly 3 canonical shot IDs;
- 3 prompt files.

### Test 3 — Generation Pause

Expected:

- workflow stops at `AWAITING_GENERATION`;
- no attempt to call Image API.

### Test 4 — Visual Mismatch

Use candidate with obvious wrong color/structure where feasible.

Expected:

```text
BLOCK
REVISE
revision prompt created
```

### Test 5 — Approval Gate

Even if Hermes recommends APPROVE:

Expected:

```text
HUMAN_APPROVAL
```

before final status.

### Test 6 — Delivery

Expected:

- 3 approved files;
- manifest;
- QA summary;
- no missing shot.

### Test 7 — Cost

Expected:

```text
paid Image API calls = 0
```

---

## 18. Observability V0

No logging service.

Job artifacts are the audit trail.

Required metadata:

```text
job_id
timestamp
status
shot_id
candidate_id
prompt_version
qa_decision
revision_round
human_approval
```

Do not store hidden model chain-of-thought. Store only concise decision rationale relevant to QA.

---

## 19. Cost Control

V0 cost invariants:

```text
no Image API
no VPS
no database
no paid storage
no automatic provider fallback
```

Existing ChatGPT subscription is pre-existing infrastructure.

If Hermes attempts to require:

```text
OPENAI_API_KEY
OPENROUTER_API_KEY
other paid provider key
```

for a feature required by the MVP:

> stop and report the exact blocker.

Do not “solve” the blocker by spending money silently.

---

## 20. Future Integration Architecture

Only after real demand:

```text
                 ┌─ manual ChatGPT Images
                 │
Creative Agent ──┼─ image API
                 │
                 └─ local/rented model
```

Later:

```text
external product feed
       ↓
      n8n
       ↓
Denver Creative Agent
       ↓
generator
       ↓
QA
       ↓
DAM / ecommerce
```

Principle:

> `generator` and `external plumbing` remain replaceable adapters around the creative workflow.

---

## 21. Why n8n Is Deferred

n8n becomes useful when DCO has deterministic external events such as:

- new SKU from Shopify;
- Google Drive batch arrival;
- client approval webhook;
- automatic delivery;
- database update;
- recurring asset job.

V0 has none of these requirements.

Therefore n8n would increase setup/debug surface without improving the hypothesis test.

---

## 22. Why Custom Hermes Plugin Is Deferred

Hermes guidance distinguishes Skill vs Tool.

V0 logic is primarily:

- instructions;
- file manipulation;
- vision analysis;
- existing agent tools.

It does not require:

- custom credential flow;
- binary streaming tool;
- real-time service;
- special protocol implementation.

Therefore:

> use a Skill, not a custom Hermes plugin/tool.

---

## 23. Build Order — One Day

### Slice 0 — Provider Gate

- install Hermes;
- `hermes doctor`;
- login;
- text test;
- vision test.

**Stop here if blocked.**

### Slice 1 — Repo

Create:

- directories;
- docs;
- `.gitignore`;
- project skill skeleton;
- templates.

### Slice 2 — Intake + Planning

Implement skill procedure for:

- source validation;
- product brief;
- shot plan.

Test.

### Slice 3 — Prompt + Pause

Implement:

- prompt files;
- `AWAITING_GENERATION`.

Test with manual generation.

### Slice 4 — QA + Revision

Implement:

- QA criteria;
- candidate review;
- revision prompt.

Test at least one REVISE path.

### Slice 5 — Approval + Delivery

Implement:

- human confirmation;
- delivery folder;
- manifest;
- QA summary.

### Slice 6 — Freeze MVP

- update checkpoint;
- record actual Hermes version;
- record known limitations;
- do not add features.

---

## 24. Cursor / Codex Implementation Contract

Cursor/Codex may:

- create repository scaffold;
- author `SKILL.md`;
- author templates;
- author `.gitignore`;
- create optional `AGENTS.md`;
- run Hermes install/config commands with user approval where login interaction is required;
- run smoke tests;
- create a fictional/safe demo job;
- update `CURRENT_CHECKPOINT.md`.

Cursor/Codex must **not**:

- add paid API keys;
- install n8n;
- create cloud infra;
- create database;
- automate ChatGPT UI;
- introduce multi-agent architecture;
- use private PPH client assets as public demo;
- expand V0 without approval.

### Required Stop Conditions

Stop and ask Rommy if:

1. ChatGPT/Codex OAuth fails;
2. vision requires paid provider configuration;
3. Hermes command behavior differs materially from docs;
4. project skill discovery/trust fails after reasonable debugging;
5. generation requires API integration;
6. implementation is no longer likely to finish in one day.

---

## 25. Implementation Completion Report

When done, `docs/CURRENT_CHECKPOINT.md` must state:

```text
Hermes version:
OS:
Install method:
Main provider:
OAuth status:
Vision status:
Project skill loaded:
Demo job ID:
3 prompts generated:
QA pass:
REVISE path tested:
3 approved outputs:
Delivery manifest:
Paid Image API calls:
Known blockers:
Next recommended step:
```

Expected final line:

```text
MVP_READY_FOR_PITCH_PREPARATION
```

only if every acceptance criterion passes.

---

## 26. Initial Architecture Decisions

### DCO-ADR-001 — Hermes-Only V0

**Decision:** one local Hermes agent; no n8n/backend.

### DCO-ADR-002 — Project Skill

**Decision:** implement workflow as one project-local `SKILL.md`, not a custom Hermes plugin.

### DCO-ADR-003 — Human Generation Boundary

**Decision:** ChatGPT Images generation remains manual.

### DCO-ADR-004 — File-Based State

**Decision:** YAML/Markdown/folders are sufficient for V0; no DB.

### DCO-ADR-005 — Human Final Approval

**Decision:** Hermes recommends; operator approves.

### DCO-ADR-006 — Zero Incremental Image API Spend

**Decision:** no Image API calls during MVP.

---

## 27. Architecture Success Criteria

Architecture is successful if:

1. one operator can run the workflow locally;
2. no local GPU is required;
3. no paid image API is required;
4. one project skill governs the complete workflow;
5. source fidelity is explicitly checked;
6. one failed candidate can produce targeted revision;
7. final delivery is traceable;
8. Cursor/Codex can complete setup in one focused day;
9. system can be explained to a non-technical client in one diagram;
10. future n8n/API integration remains possible without rewriting the creative contract.

---

## 28. Client-Facing Architecture Diagram

Do not show clients terminal internals.

Use:

```text
PRODUCT REFERENCE
       ↓
STRUCTURED PRODUCT BRIEF
       ↓
SHOT PLANNING
       ↓
AI IMAGE GENERATION
       ↓
PRODUCT-FIDELITY QA
       ↓
REVISION IF NEEDED
       ↓
HUMAN-APPROVED ASSETS
```

Description:

> “An agent-assisted visual production workflow with human-controlled generation and approval.”

Do not call it fully autonomous.

---

## 29. Known Limitations

- manual generation step;
- output consistency still depends on image model behavior;
- Hermes vision QA is not a geometric measurement system;
- no PSD/layer preservation;
- no batch production;
- no color calibration;
- no client approval UI;
- no hard cost comparison against photography;
- no direct ecommerce integration.

These are acceptable for V0.

---

## 30. References

### Hermes

- Repository  
  https://github.com/NousResearch/hermes-agent
- Installation  
  https://github.com/NousResearch/hermes-agent/blob/main/website/docs/getting-started/installation.md
- Providers / ChatGPT OAuth  
  https://github.com/NousResearch/hermes-agent/blob/main/website/docs/integrations/providers.md
- Skills  
  https://github.com/NousResearch/hermes-agent/blob/main/website/docs/user-guide/features/skills.md
- Skill authoring  
  https://github.com/NousResearch/hermes-agent/blob/main/website/docs/developer-guide/creating-skills.md

### Market Context

- ITWR Work With Us  
  https://inthewhiteroom.com/work-with-us
- ITWR Photography & Video  
  https://inthewhiteroom.com/photography-video

---

## 31. Final Build Instruction

> Build the smallest complete loop. Do not build infrastructure for hypothetical scale.

Definition of done:

```text
Hermes works
+ project skill works
+ 1 safe demo product
+ 3 shot prompts
+ manual ChatGPT generation
+ vision QA
+ at least one revision path
+ 3 human-approved outputs
+ delivery manifest
+ $0 incremental Image API spend
```

Then stop and return to Rommy for pitch preparation.
