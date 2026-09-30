# Visual QA Rules (V0)

V0 QA is procedural: Hermes reasoning + vision. No custom scoring service. No fake numeric quality score.

## Per-Candidate Criteria

Write one `qa/<candidate-id>.yaml` per candidate. Each criterion is exactly `PASS`, `WARN`, or `BLOCK`.

| Key | Meaning |
|-----|---------|
| `source_fidelity` | Product matches source identity (fail-closed) |
| `geometry` | Proportions, structure, counts, joins (fail-closed) |
| `material_color` | Material/finish/color family |
| `shot_compliance` | Matches planned shot id framing/purpose |
| `lighting_shadow` | Lighting/shadow realism |
| `scene_integration` | Product sits believably in scene |
| `ai_artifacts` | Melts, warped edges, text gibberish, etc. |
| `commercial_usability` | Fit for catalog/listing use |

## Decision Rule

```text
any BLOCK in source_fidelity or geometry
→ decision = REVISE

no BLOCK
→ Hermes may set decision = APPROVE (recommendation only)
→ human_decision remains empty until the operator acts
```

## Human Gate

- `human_decision: APPROVED` is **human-only**.
- Never auto-approve because the image looks attractive.
- REJECTED or withheld approval blocks PACKAGE for that shot.

## Revision Gate

REVISE requires a prior QA report with `decision: REVISE` (or fidelity/geometry BLOCK). Targeted `revision_instruction` must name failed criteria only.

## Required QA Report Keys

Validated by `docs/scripts/check_skill_templates.ps1`:

- `candidate_id`, `shot_id`, `prompt_version`
- `criteria.source_fidelity`, `criteria.geometry` (fail-closed fidelity fields)
- `blocking_violations`, `decision`, `revision_instruction`, `human_decision`
