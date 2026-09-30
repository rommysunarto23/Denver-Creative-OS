# Product Fidelity Rules (V0)

Product fidelity before beauty. The skill must distinguish hard vs soft constraints when writing briefs, prompts, and QA.

## Hard Constraints (must_preserve)

Mismatch → `severity = BLOCK` → `decision = REVISE`. Candidate cannot be APPROVED.

Examples:

- frame / silhouette
- visible structure
- ladder position (if present)
- rail count
- legs / feet
- material family
- base color / finish family
- important joins / hardware
- product proportions

## Soft Constraints (flexible_styling)

Deviations may be `WARN` (not automatic BLOCK).

Examples:

- decor / accessories
- wall treatment
- neutral styling props
- non-product textiles
- greenery / plants
- ambient detail / lamp props

## Brief Contract Fields

`brief/product-brief.yaml` must capture:

| Field | Rule |
|-------|------|
| `known_facts` | Operator-confirmed only |
| `inferences` | Labeled; never treated as hard facts |
| `must_preserve` | Hard constraints list |
| `flexible_styling` | Soft constraints list |
| `unknowns` | Drive `NEEDS_INPUT` until resolved or explicitly waived |

## Prompt Binding

Every prompt MUST:

- restate relevant `must_preserve` items under MUST PRESERVE;
- forbid redesign / product invention under NEGATIVE / DO NOT CHANGE;
- anchor to the source path under SOURCE ANCHOR.

## QA Binding

Source fidelity and geometry are **fail-closed**:

```text
any BLOCK in source_fidelity or geometry
→ decision = REVISE
→ human cannot APPROVE that candidate without a new passing candidate
```

Do not trade a prettier lifestyle scene for a wrong product.
