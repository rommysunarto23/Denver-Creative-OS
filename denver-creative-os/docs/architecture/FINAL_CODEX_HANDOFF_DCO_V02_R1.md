# FINAL CODEX HANDOFF — Denver Creative OS V0.2-R1

Repo: https://github.com/rommysunarto23/Denver-Creative-OS  
Baseline: `main` latest.  
Operator approval: **Ideal V0.2-R1 — Evidence Authority + Raster Preservation**.

## Read first

1. `routing.md`
2. `AGENTS.md`
3. `CONTEXT.md`
4. `ROADMAP.md`
5. `denver-creative-os/docs/architecture/SYNTHESIS.md`
6. `denver-creative-os/docs/architecture/COMPARE_GROK_CHATGPT.md`
7. `denver-creative-os/docs/architecture/GROUNDING.md`
8. `denver-creative-os/docs/architecture/CHATGPT_AUDIT_NOTES.md`
9. `denver-creative-os/docs/architecture/CANDIDATES.md`
10. `denver-creative-os/skills/denver-creative-os/SKILL.md`
11. `denver-creative-os/jobs/DCO-20260930-001/retest-sol/COMPARISON.md`

Treat this handoff as the final implementation authority for V0.2-R1.

## Non-negotiable laws

- Generated pixels are **not evidence**.
- `DERIVED_RENDER` may stabilize generation but may **not** establish new product truth, unseen geometry, or dimensions.
- `SOURCE_PRESERVE` must preserve the original product raster/silhouette/geometry.
- `NOVEL_VIEW_GENERATIVE` may only become client-release eligible when authoritative evidence is sufficient for the target view.
- `FAIL` cannot be overridden into client release.
- `UNVERIFIABLE` cannot be overridden into client release.
- `EXPERIMENT_ACCEPTED` is allowed only as `EXPERIMENT_ONLY`.
- Acceptance model = `gpt-6.1-sol`, reasoning `medium`.
- Sol High is diagnostic only; it cannot rescue a failed acceptance gate.
- Image API spend stays `0`.
- No ChatGPT browser automation.
- No auto client-release.
- No n8n/MCP/webhooks/DB/VPS/local FLUX/multi-agent split in V0.2-R1.

---

# Patch plan

## 1. Governance/docs

Patch:
- `AGENTS.md`
- `routing.md`
- `CONTEXT.md`
- `ROADMAP.md`
- `denver-creative-os/docs/CURRENT_CHECKPOINT.md`

Create:
- `denver-creative-os/docs/architecture/V02_R1.md`

`V02_R1.md` must define:
1. Evidence Authority
2. Product Truth vs Generation Guardrails
3. SHOT_FEASIBILITY_GATE
4. SOURCE_PRESERVE
5. Deterministic Composite Boundary
6. NOVEL_VIEW_GENERATIVE
7. DERIVED_RENDER semantics
8. Evidence-aware QA
9. Multi-dimensional release contract
10. Human authority / no client-release override
11. Experiment-only semantics
12. POS/NEG/AMB golden fixtures
13. 9/9 Sol Medium acceptance
14. State machine
15. V0 migration
16. pitch-ready return gate
17. deny list

Append to `SYNTHESIS.md`:
- operator-approved successor = V0.2-R1
- canonical contract = `V02_R1.md`
- `DERIVED_RENDER` = stabilizer, never truth
- `SOURCE_PRESERVE` = deterministic reuse of source product raster

Immediately change checkpoint status to:

`MVP_REOPENED_FOR_FIDELITY_CONTRACT_V02_R1`

Do not restore pitch-ready status until all exit gates pass.

---

## 2. Skill contract

Patch:
`denver-creative-os/skills/denver-creative-os/SKILL.md`

Bump:
`version: 0.2.0`

Procedure:

`INTAKE → EVIDENCE → FEASIBILITY → PLAN → PROMPT → PAUSE → COMPOSE/DERIVED_RENDER → QA → REVISE/NEEDS_EVIDENCE → HUMAN_DISPOSITION → PACKAGE`

Canonical shots may remain:
- SHOT-01-ANGLED
- SHOT-02-STRAIGHT
- SHOT-03-MEDIUM-CLOSE

But each shot must independently carry:
- `view_support`
- `feasibility`
- `production_mode`

Delete any path equivalent to:

`FAIL/UNVERIFIABLE + human APPROVE → client DELIVERED`

Only:

`RELEASE_ELIGIBLE + RELEASE_APPROVED → CLIENT_RELEASE`

Blocked/ambiguous outputs may only become:

`EXPERIMENT_ACCEPTED → EXPERIMENT_ONLY`

---

## 3. Evidence Authority

Create:
`references/EVIDENCE_AUTHORITY_RULES.md`

Authoritative:
- ORIGINAL_SOURCE
- OPERATOR_CONFIRMED_SPEC
- CLIENT_CONFIRMED_SPEC
- MEASURED_DIMENSIONS
- MULTI_VIEW_SOURCE
- CAD_3D_REFERENCE

Derived/non-authoritative:
- DERIVED_RENDER
- GENERATED_LOCK
- GENERATED_CANDIDATE
- MODEL_INFERENCE
- GENERATION_GUARDRAIL

Rule: derived artifacts may guide generation and preserve lineage, but may not establish missing facts.

Create:
`templates/EVIDENCE_PACK.yaml`

Minimum derived artifact form:

```yaml
derived_artifacts:
  - artifact_id: LOCK-001
    type: DERIVED_RENDER
    authority: DERIVED_NON_AUTHORITATIVE
    source_evidence_refs: [SRC-001]
    can_establish_new_geometry: false
```

---

## 4. Product truth schema

Patch:
`templates/PRODUCT_BRIEF.yaml`
and
`references/PRODUCT_FIDELITY_RULES.md`

Use:

```yaml
schema_version: "0.2-R1"

product_truth:
  observed: []
  confirmed: []
  inferred: []
  unknown: []

generation_guardrails: []
```

Critical product attributes must carry:
- `attribute_id`
- `criticality`
- `value`
- `truth_status`
- `evidence_refs`

Guardrails must include:
`establishes_truth: false`

---

## 5. SHOT_FEASIBILITY_GATE

Patch:
`templates/SHOT_PLAN.yaml`

Required per shot:

```yaml
view_support:
  class: SUPPORTED_VIEW | PARTIAL_VIEW | NOVEL_VIEW
  evidence_refs: []

feasibility:
  production_mode: SOURCE_PRESERVE | NOVEL_VIEW_GENERATIVE
  evidence_sufficiency: SUFFICIENT | INSUFFICIENT
  client_release_possible: true | false
  unresolved_critical_attributes: []
```

Rules:
- supported view + exact source raster retained → `SOURCE_PRESERVE`
- partial view → evaluate critical attributes independently
- novel view → check authoritative evidence before generation
- unsupported critical geometry → `NEEDS_EVIDENCE`

Operator choices:
- PROVIDE_MORE_EVIDENCE
- CHANGE_SHOT_TO_SUPPORTED_VIEW
- RUN_EXPERIMENT_ONLY
- STOP

Do not enter blind prompt-revision loops for missing evidence.

---

## 6. SOURCE_PRESERVE

Create:
`references/SOURCE_PRESERVE_RULES.md`

Contract:
- ChatGPT Images may create background/environment/props/scene plate.
- Product geometry, silhouette, texture identity and product raster remain owned by original source.
- Do not rely on ChatGPT Images to redraw the product.

Create:
`denver-creative-os/tools/composite_source_preserve.py`

Use a minimal deterministic implementation, preferably Python + Pillow.

Allowed:
- uniform scale
- translation
- alpha composite
- optional deterministic contact shadow from alpha mask

Forbidden:
- non-uniform warp
- generative product inpainting
- AI relighting/redrawing of product
- texture regeneration
- object redesign

If no usable alpha or explicit operator mask:
`NEEDS_ASSET_PREP`

Create:
`templates/COMPOSITE_MANIFEST.yaml`

Record source/background/mask/output SHA-256 plus transform and:

```yaml
product_pixel_authority: ORIGINAL_SOURCE
generative_product_redraw: false
```

Tests:
- same inputs + same transform → same output SHA-256
- non-uniform scaling denied
- missing alpha/mask → NEEDS_ASSET_PREP
- source/background bytes remain unchanged

---

## 7. NOVEL_VIEW + DERIVED_RENDER

Create:
`references/NOVEL_VIEW_RULES.md`

If authoritative evidence does not support all critical target-view geometry:
`NEEDS_EVIDENCE`

Experiment-only generation is allowed.

Create:
`templates/DERIVED_RENDER.yaml`

Required:

```yaml
type: DERIVED_RENDER
authority: DERIVED_NON_AUTHORITATIVE
can_establish_new_geometry: false
can_establish_new_dimensions: false
can_resolve_unobservable_attribute: false
```

Gate:
- PASS_FOR_GENERATION
- REJECT_DERIVED_RENDER
- NEEDS_EVIDENCE

`PASS_FOR_GENERATION` only means usable as a generation anchor. It does not certify fidelity or create new truth.

---

## 8. QA + release schema

Patch:
`templates/QA_REPORT.yaml`
and
`references/VISUAL_QA_RULES.md`

Three layers:

Evidence:
- DIRECT
- PARTIAL
- NOT_OBSERVABLE
- SUFFICIENT
- LIMITED
- INSUFFICIENT

Fidelity verdict:
- PASS
- FAIL
- UNVERIFIABLE

Release:
- RELEASE_ELIGIBLE
- RELEASE_BLOCKED
- NEEDS_EVIDENCE

Minimum QA fields:

```yaml
presentation_quality:
  result: PASS

shot_compliance:
  result: PASS

critical_artifacts:
  result: PASS

product_fidelity:
  result: PASS | FAIL | UNVERIFIABLE

evidence_sufficiency:
  result: SUFFICIENT | INSUFFICIENT

release:
  eligibility: RELEASE_ELIGIBLE | RELEASE_BLOCKED | NEEDS_EVIDENCE

next_action:
  HUMAN_RELEASE_REVIEW | REVISE | NEEDS_EVIDENCE | EXPERIMENT_REVIEW | STOP

human_disposition:
  RELEASE_APPROVED | EXPERIMENT_ACCEPTED | REJECTED | ""

package_class:
  CLIENT_RELEASE | EXPERIMENT_ONLY | ""
```

Aggregation:

- any CRITICAL FAIL → `RELEASE_BLOCKED`
- otherwise any CRITICAL UNVERIFIABLE or insufficient evidence → `NEEDS_EVIDENCE`
- only all critical PASS + sufficient evidence + presentation PASS + shot compliance PASS + no critical artifacts → `RELEASE_ELIGIBLE`

`UNVERIFIABLE` is not WARN and is not FAIL.

`UNVERIFIABLE` must route to evidence acquisition, not ordinary revise spam.

---

## 9. Delivery contract

Patch:
`templates/DELIVERY_MANIFEST.yaml`

Client release requires:

```yaml
package_class: CLIENT_RELEASE
client_release: true
human_disposition: RELEASE_APPROVED
```

Every asset must have:
- `product_fidelity: PASS`
- `evidence_sufficiency: SUFFICIENT`
- `release_eligibility: RELEASE_ELIGIBLE`

Experiment:

```yaml
package_class: EXPERIMENT_ONLY
client_release: false
human_disposition: EXPERIMENT_ACCEPTED
```

Validator must reject any client release containing BLOCKED/NEEDS_EVIDENCE/FAIL/UNVERIFIABLE.

---

## 10. State machine

Implement these key states:

```text
CREATED
INTAKE
EVIDENCE_READY
BRIEF_APPROVED
SHOT_FEASIBILITY_GATE
NEEDS_EVIDENCE
SHOT_PLAN_READY
PROMPT_PACK_READY

BACKGROUND_AWAITING_GENERATION
BACKGROUND_READY
COMPOSITE_READY

DERIVED_RENDER_AWAITING_GENERATION
DERIVED_RENDER_READY
DERIVED_RENDER_GATE
LIFESTYLE_AWAITING_GENERATION
CANDIDATE_READY

QA_REVIEW
RELEASE_BLOCKED
RELEASE_ELIGIBLE
HUMAN_RELEASE_REVIEW
EXPERIMENT_REVIEW
EXPERIMENT_PACKAGED
CLIENT_PACKAGED
CLIENT_RELEASED

NEEDS_ASSET_PREP
REJECTED
ABORTED
```

Prohibit:
- RELEASE_BLOCKED → CLIENT_PACKAGED
- NEEDS_EVIDENCE → CLIENT_PACKAGED
- EXPERIMENT_ACCEPTED → CLIENT_PACKAGED

---

## 11. Fail-family overlay

Keep fail-family tracking only for actual `FAIL`.

`UNVERIFIABLE` must route directly to `NEEDS_EVIDENCE`.

Default repeated same-family revision cap = 2.

After cap:
- CHANGE_GENERATION_STRATEGY
- CHANGE_SHOT
- PROVIDE_EVIDENCE
- EXPERIMENT_ONLY
- STOP

No infinite v6/v7 prompt loop.

---

# Golden fixtures and acceptance

Create:

```text
skills/denver-creative-os/fixtures/v02-r1/
├─ positive/
├─ negative/
└─ ambiguous/
```

Each contains:
- source.png
- candidate.png
- evidence-pack.yaml
- shot-plan.yaml
- expected.yaml

## POSITIVE

Use a deterministic SOURCE_PRESERVE composite so the product raster is objectively source-identical.

Expected:

```yaml
product_fidelity: PASS
evidence_sufficiency: SUFFICIENT
release_eligibility: RELEASE_ELIGIBLE
next_action: HUMAN_RELEASE_REVIEW
```

Do not use old Luna-approved SHOT-01 as the positive oracle.

## NEGATIVE

Use a controlled obvious critical mutation, e.g.:
- non-uniform geometry stretch
- wrong leg count
- obvious material family replacement

Expected:

```yaml
product_fidelity: FAIL
release_eligibility: RELEASE_BLOCKED
next_action: REVISE
```

Assert:
- EXPERIMENT_ACCEPTED is allowed only as EXPERIMENT_ONLY
- RELEASE_APPROVED must be rejected

## AMBIGUOUS

Use insufficient authoritative evidence, e.g. angled source vs exact front-view verification.

Expected:

```yaml
product_fidelity: UNVERIFIABLE
evidence_sufficiency: INSUFFICIENT
release_eligibility: NEEDS_EVIDENCE
next_action: NEEDS_EVIDENCE
```

Assert:
- not PASS
- not FAIL merely because evidence is absent
- not ordinary REVISE
- not client releasable

---

# 3 × 3 Sol Medium gate

Run each fixture three independent times:

- POSITIVE ×3
- NEGATIVE ×3
- AMBIGUOUS ×3

Model:
`gpt-6.1-sol`

Reasoning:
`medium`

Store under:

```text
denver-creative-os/verification/v02-r1/
├─ positive/run-01.yaml ... run-03.yaml
├─ negative/run-01.yaml ... run-03.yaml
├─ ambiguous/run-01.yaml ... run-03.yaml
└─ SUMMARY.yaml
```

Each receipt must record observed vs expected and:
`semantic_match: true|false`

Acceptance:
**9/9 semantic_match = true**

Not acceptable:
- 8/9 + human override
- Medium fail but High passes
- selectively rerunning only one failed sample until it passes

If contract changes after a failed batch, invalidate previous batch and rerun all 9.

Sol High remains diagnostic only.

---

# Validators

Patch:
`docs/scripts/check_skill_templates.ps1`

Add required markers:
- schema_version
- product_truth
- generation_guardrails
- view_support
- production_mode
- evidence_sufficiency
- UNVERIFIABLE
- RELEASE_ELIGIBLE
- RELEASE_BLOCKED
- NEEDS_EVIDENCE
- DERIVED_RENDER
- can_establish_new_geometry: false
- SOURCE_PRESERVE
- EXPERIMENT_ONLY
- CLIENT_RELEASE

Create:
- `docs/scripts/check_v02_r1_contract.ps1`
- `docs/scripts/check_v02_r1_contract.sh`
- `docs/scripts/check_v02_r1_golden.ps1`
- `docs/scripts/check_v02_r1_golden.sh`

Static validator must assert:
- canonical V02_R1 doc exists
- skill version >= 0.2.0
- new schemas exist
- all 3 golden fixtures exist
- expected POS/NEG/AMB release states are correct
- DERIVED_RENDER cannot establish geometry
- SOURCE_PRESERVE manifest exists
- delivery schema supports package class
- Image API/browser automation/auto-client-release remain denied

Golden validator must assert:
- 9 receipts
- all model `gpt-6.1-sol`
- all reasoning `medium`
- POS 3/3
- NEG 3/3
- AMB 3/3
- all semantic_match true

Success output:
`PASS: V0.2-R1 GOLDEN 9/9`

Any mismatch = non-zero exit.

---

# Historical demo

Do not rewrite historical V0 evidence in:
`jobs/DCO-20260930-001/`

Add only:
`V02_R1_MIGRATION_NOTE.md`

State that under V0.2-R1 the old SHOT-02 override would not qualify as `CLIENT_RELEASE`.

---

# Pitch-ready return gate

Only restore:

`MVP_READY_FOR_PITCH_PREPARATION`

when ALL are true:

- V02_R1 canonical doc committed
- skill V0.2 implemented
- Evidence Authority implemented
- Product Truth vs Guardrails implemented
- SHOT_FEASIBILITY_GATE implemented
- SOURCE_PRESERVE implemented
- deterministic compositor works
- same-input output determinism PASS
- NOVEL_VIEW contract implemented
- DERIVED_RENDER cannot create truth
- evidence/verdict/release triad implemented
- no client-release override
- EXPERIMENT_ONLY works
- POS 3/3
- NEG 3/3
- AMB 3/3
- aggregate 9/9
- Sol High not used as rescue
- Image API calls = 0
- browser automation absent
- secret scan clean
- historical V0 demo unchanged

Then checkpoint must explicitly record:

```text
V0.2-R1 fidelity contract acceptance: 9/9
SOURCE_PRESERVE deterministic path: PASS
NOVEL_VIEW insufficient-evidence routing: PASS
Incremental Image API spend: US$0
```

---

# Minimum E2E proof

## SOURCE_PRESERVE

```text
fictional cutout with alpha
→ intake
→ evidence pack
→ SHOT_FEASIBILITY_GATE
→ SOURCE_PRESERVE
→ human generates empty background plate
→ deterministic compositor inserts exact source raster
→ composite manifest/hashes
→ Hermes Sol Medium QA
→ RELEASE_ELIGIBLE
→ Rommy RELEASE_APPROVED
→ CLIENT_RELEASE
```

No image model may redraw the product in this proof.

## NOVEL_VIEW

Required success is correct refusal/routing, not forced geometry generation:

```text
single angled authoritative source
→ requested straight/front
→ NOVEL_VIEW
→ critical geometry unsupported
→ evidence_sufficiency INSUFFICIENT
→ NEEDS_EVIDENCE
```

Optional experiment:
DERIVED_RENDER may stabilize generation but remains non-authoritative and EXPERIMENT_ONLY.

---

# Definition of Done before Alex / ITWR pitch

The MVP must demonstrate:

**KNOW**  
Distinguishes authoritative evidence from inference/generated artifacts.

**PRESERVE**  
Creates source-supported lifestyle imagery while retaining original product raster/geometry deterministically.

**REFUSE / ESCALATE**  
Routes unsupported novel views to NEEDS_EVIDENCE instead of hallucinating confidence or infinite prompt revision.

Pitch-safe claims after DoD:
- structured product-reference intake
- evidence-aware shot feasibility
- source-preserving lifestyle composition
- product-fidelity QA
- ambiguity handling
- revision/fail-family tracking
- human-controlled release
- traceable lineage
- zero incremental Image API spend in MVP

Do not claim:
- fully autonomous production
- guaranteed novel-view reconstruction
- 100% image-generation fidelity
- production-scale throughput
- measured client savings
- replacement for photography

---

# Required final Codex report

Return:

```yaml
baseline_commit:
final_commit:

checkpoint:
  before: MVP_REOPENED_FOR_FIDELITY_CONTRACT_V02_R1
  after: ""

files_created: []
files_modified: []

source_preserve:
  deterministic_compositor: PASS|FAIL
  source_immutable: PASS|FAIL
  same_input_same_hash: PASS|FAIL
  client_release_demo: PASS|FAIL

novel_view:
  derived_render_non_authority: PASS|FAIL
  insufficient_evidence_routes_needs_evidence: PASS|FAIL

release_contract:
  fail_cannot_client_release: PASS|FAIL
  unverifiable_cannot_client_release: PASS|FAIL
  experiment_only_path: PASS|FAIL

golden:
  positive: "0/3"
  negative: "0/3"
  ambiguous: "0/3"
  aggregate: "0/9"
  model: gpt-6.1-sol
  reasoning: medium

cost:
  image_api_calls: 0

denies:
  browser_automation: absent
  auto_client_release: absent
  image_api: absent

secrets_scan: PASS|FAIL

final_status:
  MVP_READY_FOR_PITCH_PREPARATION | MVP_REOPENED_FOR_FIDELITY_CONTRACT_V02_R1

blockers: []
```

If any required gate fails, final status must remain:

`MVP_REOPENED_FOR_FIDELITY_CONTRACT_V02_R1`

**No partial success may be relabeled pitch-ready.**
