# Denver Creative OS — Documentation Baseline

**Date:** 30 September 2026  
**Status:** V0 approved for one-day MVP implementation  
**Purpose:** Build a small, demonstrable, human-in-the-loop creative production workflow before pitching furniture/ecommerce and interiors-agency targets.

## Files

1. `PRD_DENVER_CREATIVE_OS.md` — product problem, target users, workflow, scope, acceptance gates, cost constraints, risks, and falsification criteria.
2. `DENVER_CREATIVE_OS_ARCHITECTURE_AND_REPO_BLUEPRINT.md` — Hermes setup direction, repository layout, project skill contract, file-based state, QA rules, one-day build order, and Cursor/Codex implementation contract.
3. `DENVER_CREATIVE_OS_DOCS_README.md` — this short baseline and execution order.

## Immediate Goal

Build only this loop:

```text
Product reference
      ↓
Hermes product intake
      ↓
Fidelity contract
      ↓
3-shot plan
      ↓
Versioned prompt pack
      ↓
Manual ChatGPT Images generation
      ↓
Hermes vision QA
      ↓
Revision if needed
      ↓
Human approval
      ↓
3-image delivery package
```

The MVP must be demonstrable in one focused day.

## Explicit V0 Boundaries

No n8n.  
No MCP.  
No webhooks.  
No database.  
No VPS.  
No Image API.  
No browser automation.  
No local FLUX requirement.  
No multi-agent architecture.  
No fully autonomous approval.  
No production-ready claim.

## Cost Boundary

The target is:

```text
incremental Image API spend = US$0
```

Use:

```text
Hermes Agent
+ ChatGPT/Codex OAuth if the actual account passes setup
+ manual ChatGPT Images
+ local files
+ human approval
```

If Hermes setup requires a paid API key for a **required** MVP capability, stop and ask Rommy. Do not silently add spend.

## Architecture Direction

```text
HERMES = reasoning + workflow procedure + vision QA
FILES  = job state + prompt history + QA history
HUMAN  = generation + final approval
CHATGPT IMAGES = image generator
```

One project-local Hermes skill controls V0.

Do not split into specialist agents until the single-agent workflow is proven insufficient.

## Target Business Hypotheses

### Furniture / ecommerce brand

Potential value:

```text
existing product assets
→ repeatable lifestyle shots
→ product-fidelity QA
→ catalog-ready delivery
```

### Interiors / creative agency

Potential value:

```text
agency creative direction
→ remote AI production support
→ controlled variants
→ QA
→ human-approved delivery
```

These are hypotheses for pitch/pilot, not proven ROI claims.

## Demo Asset Rule

Use only:

- self-generated fictional furniture;
- user-owned product reference;
- properly licensed/authorized source.

Do **not** repurpose an active marketplace client's private attachment as off-platform marketing collateral without permission.

## Implementation Order for Cursor / Codex / Grok

```text
1. Read all three Denver Creative OS documents.
2. Do not redesign scope.
3. Install/verify Hermes.
4. Run `hermes doctor`.
5. Configure OpenAI Codex / ChatGPT OAuth through current Hermes flow.
6. Prove a normal text turn.
7. Prove image/vision inspection.
8. Create repository scaffold.
9. Create one project skill: `denver-creative-os`.
10. Trust/load the project skill.
11. Implement file templates.
12. Run one safe furniture demo end-to-end.
13. Test REVISE path.
14. Human-approve 3 outputs.
15. Create delivery manifest.
16. Write `docs/CURRENT_CHECKPOINT.md`.
17. Stop.
```

## MVP Definition of Done

```text
[ ] Hermes installed
[ ] ChatGPT/Codex OAuth works
[ ] vision works
[ ] project skill loads
[ ] product brief generated
[ ] 3 shot plans generated
[ ] 3 prompt files generated
[ ] manual generation checkpoint respected
[ ] QA report produced
[ ] REVISE path tested
[ ] human final approval enforced
[ ] 3 final images packaged
[ ] delivery manifest generated
[ ] paid Image API calls = 0
```

Only then mark:

```text
MVP_READY_FOR_PITCH_PREPARATION
```

## What Happens Next

After Rommy confirms the MVP is complete:

```text
MVP evidence
   ↓
prepare client-facing proof pack
   ↓
pitch track A: furniture/ecommerce
   ↓
pitch track B: interiors creative agency
   ↓
measure responses
   ↓
only then decide whether API/n8n/cloud automation is justified
```

## Governing Principle

> **Build evidence before infrastructure.**

The MVP exists to prove that Rommy can operate a repeatable product-to-lifestyle visual workflow with structured QA — not to demonstrate the largest possible architecture.

## Technical References

- Hermes repository: https://github.com/NousResearch/hermes-agent
- Hermes installation: https://github.com/NousResearch/hermes-agent/blob/main/website/docs/getting-started/installation.md
- Hermes providers: https://github.com/NousResearch/hermes-agent/blob/main/website/docs/integrations/providers.md
- Hermes skills: https://github.com/NousResearch/hermes-agent/blob/main/website/docs/user-guide/features/skills.md
- Hermes skill authoring: https://github.com/NousResearch/hermes-agent/blob/main/website/docs/developer-guide/creating-skills.md
