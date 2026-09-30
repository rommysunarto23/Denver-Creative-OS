# Denver Creative OS — Architecture V0.2-R2-Lite
## Hermes-Native Creative Mesh + Evidence-Aware Fidelity + Transactional Image Execution

**Operator status:** ACCEPTED for ChatGPT final repo audit (Grok reconciled R2-lite)
**Codex:** HOLD
**Also known as:** FINAL_REVIEW candidate (canonical path is this file: `V02_R2_LITE.md`)
**Grok residual risks (implementation smoke, not redesign):** (1) `ctx.dispatch_tool` from tool handler must be smoked on this Hermes install; (2) project plugins need `HERMES_ENABLE_PROJECT_PLUGINS=true` + `plugins.enabled`; (3) single pitch gate requires Mode A+B+C+9/9 before any pitch.
**Repository:** `rommysunarto23/Denver-Creative-OS`
**Primary targets:** Alex / furniture e-commerce catalog + ITWR / interiors-agency overflow
**Operator:** Rommy — final creative/release authority
**Default reasoning/vision model:** `gpt-6.1-sol` @ `medium`
**Image backend:** Hermes built-in `openai-codex` image generation/edit
**Incremental Image API-key spend target:** `US$0`
**Date:** 2026-09-30

---

# 1. Freeze goal

The architecture exists to satisfy product outcomes, not to preserve a Designly-shaped skill graph.

The project is only ready to pitch when the complete workflow is proven end-to-end for both Alex- and ITWR-relevant workloads.

Required product outcomes:

1. **Alex / catalog**
   - cutout + references → repeatable commercial lifestyle imagery;
   - exact SKU fidelity where source evidence supports it;
   - no manual ChatGPT copy/paste loop;
   - unsupported novel views fail honestly to `NEEDS_EVIDENCE`;
   - Rommy remains final release authority.

2. **ITWR / agency overflow**
   - structured visual direction;
   - native generate/edit execution;
   - independent QA;
   - bounded revision;
   - protected-content drift control;
   - professional final package.

3. **R1 invariants retained**
   - Evidence Authority;
   - `product_truth` vs `generation_guardrails`;
   - `SHOT_FEASIBILITY_GATE`;
   - `PASS | FAIL | UNVERIFIABLE`;
   - `RELEASE_ELIGIBLE | RELEASE_BLOCKED | NEEDS_EVIDENCE`;
   - `SOURCE_PRESERVE` exact product raster where required;
   - `DERIVED_RENDER != ground truth`;
   - no client-release override;
   - Sol Medium semantic goldens = 9/9.

---

# 2. Architecture principles

## P1 — Automate everything that does not need human judgment

Machine-owned:

```text
intake processing
evidence organization
shot feasibility
creative planning
prompt compilation
image generation
image editing
candidate materialization
hashing
lineage
QA preparation
bounded revision routing
release-state validation
```

Human-owned:

```text
new evidence
creative exceptions
experiment acceptance
final client release
pitch claims
```

Normal happy path must not require:

```text
manual prompt paste
manual ChatGPT UI
manual image download
manual candidate file movement
manual resume after every generation
```

## P2 — Generated pixels never become evidence

`DERIVED_RENDER`, `GENERATED_CANDIDATE`, `MODEL_INFERENCE`, and `GENERATION_GUARDRAIL` are never authoritative product truth.

## P3 — Product fidelity outranks beauty

A commercially attractive image with wrong SKU geometry cannot be released as that product.

## P4 — Missing evidence is not failure

```text
FAIL
= authoritative evidence supports contradiction

UNVERIFIABLE
= authoritative evidence cannot prove the claim
```

## P5 — Revision is bounded and source-anchored

Every repair starts from the last approved checkpoint. Default same-fail-family limit: `2 attempts`.

## P6 — Use Hermes native capabilities instead of rebuilding them

```text
Hermes built-in image_generate / image edit
→ openai-codex
```

No custom image provider wrapper.

## P7 — Deterministic integrity belongs in deterministic tools

Candidate materialization, SHA-256, strict compositing, lineage, and release validation must be executable rather than prose-only.

---

# 3. Final R2-lite topology

```text
                         HERMES
                           │
                Denver Creative OS
                    Orchestrator
                           │
       ┌───────────────────┼───────────────────┐
       │                   │                   │
dco-product-fidelity  dco-shot-craft  dco-scene-integration
  FidelityContract      ShotCraftPlan    SceneIntegrationPlan
       │                   │                   │
       └───────────────────┼───────────────────┘
                           ↓
                 dco-prompt-compiler
          GenerationRequest / EditContract
                           ↓
                dco_execute_image_operation
                           ↓
          Hermes built-in image_generate/edit
                    via openai-codex
                           ↓
             normalized DCO candidate artifact
                           ↓
                    dco-visual-qa
                  VisualQAReport
                           │
                ┌──────────┴──────────┐
                │                     │
              PASS                   FAIL
                │                     │
          release contract       RevisionRequest
                                      │
                                EditContract gate
                                      │
                               bounded image edit
```

One Hermes agent only. Specialists are skills, not independent agents.

---

# 4. Specialist skill set — approved

## 4.1 `denver-creative-os` — orchestrator

Owns job state, production-mode routing, specialist invocation, retry budgets, stop conditions, artifact expectations, and release workflow.

## 4.2 `dco-product-fidelity`

Writes `FidelityContract`.

Owns Evidence Authority, product identity, critical attributes, silhouette, structure/counts, materials, finish/color, hardware/joinery, `product_truth`, inference, unknowns, and `generation_guardrails`.

## 4.3 `dco-shot-craft`

Writes `ShotCraftPlan`.

Merged from shot direction + photography direction. Owns shot purpose, viewpoint, framing, crop, view support, source compatibility, lens intent, perspective, depth of field, lighting logic, color temperature, and product clarity.

## 4.4 `dco-scene-integration`

Writes `SceneIntegrationPlan`.

Merged from composition + manipulation. Owns focal hierarchy, reserved product region, negative space, props, scene balance, perspective alignment, placement scale, contact/cast shadows, ambient occlusion, light wrap, grounding, and reflection logic.

## 4.5 `dco-prompt-compiler`

Writes `GenerationRequest` and `EditContract`.

This skill is intentionally thin. It converts locked upstream contracts into provider-ready instructions and may not invent new creative direction.

### Mandatory EditContract gate

Before every image edit:

```text
approved source checkpoint
→ one atomic mutation
→ protected content
→ boundary blending allowance
→ acceptance checks
→ READY / CLARIFY / VETO
```

Raw QA feedback may not go directly to the image editor.

## 4.6 `dco-visual-qa`

Writes `VisualQAReport` and `RevisionRequest`.

Independent downstream reviewer. Reviews both:
- product/release fidelity;
- presentation/integration quality.

---

# 5. Skill topology

Primary:

```text
project-local trusted skills
```

Fallback:

```yaml
skills:
  external_dirs:
    - <container-visible-path>/denver-creative-os/skills
```

E2E starts with a discovery smoke:

```text
Hermes boot
→ project skill discovery?
   YES → continue
   NO  → external_dirs fallback
→ continue same E2E
```

---

# 6. Production-mode priority

## Mode A — `SOURCE_PRESERVE_STRICT`

Primary production path. Default for Alex-style catalog work.

## Mode B — `SOURCE_GUIDED_EDIT`

Secondary / revision capability. Important for ITWR finishing and bounded corrections. Requires `EditContract`.

## Mode C — `NOVEL_VIEW_GENERATIVE`

Evidence-gated, highest-risk path. Unsupported critical geometry routes to `NEEDS_EVIDENCE`.

---

# 7. MODE A — strict preserve flow

```text
SOURCE PRODUCT
→ FidelityContract
→ SHOT_FEASIBILITY_GATE
→ ShotCraftPlan
→ SceneIntegrationPlan
→ GenerationRequest for PRODUCT-FREE SCENE PLATE
→ dco_execute_image_operation
→ native Hermes image generation
→ reported_* / actual-size validation
→ DCO scene artifact
→ deterministic SOURCE_PRESERVE composite
→ seam/integration QA
→ product/release QA
→ release gate
```

The image generator owns the environment, not the product raster.

---

# 8. Composite preflight gate

Before deterministic composite, record:

```text
requested aspect ratio
requested size
reported quality
reported size
actual pixel width/height
reserved product region
safe crop compatibility
```

If returned plate geometry is not compatible:

```text
SAFE_CROP
or
REGENERATE_SCENE
```

---

# 9. Composite QA gate

A successful compositor execution is not commercial PASS.

```yaml
composite_integration:
  edge_fringe: PASS|FAIL
  scale_perspective: PASS|FAIL
  contact_shadow: PASS|FAIL
  cast_shadow_direction: PASS|FAIL
  light_temperature_match: PASS|FAIL
  grounding: PASS|FAIL
  occlusion: PASS|FAIL
  physical_believability: PASS|FAIL
```

Critical integration failure blocks release.

---

# 10. MODE B — guided edit flow

```text
approved checkpoint
→ VisualQA FAIL / bounded edit request
→ dco-prompt-compiler sanitizer gate
→ EditContract
→ dco_execute_image_operation
→ Hermes native image edit
→ normalized candidate
→ VisualQA:
   target accuracy
   protected-content stability
   collateral drift
→ PASS or bounded retry
```

Retries always start from the approved checkpoint.

---

# 11. MODE C — novel-view flow

```text
requested novel viewpoint
→ SHOT_FEASIBILITY_GATE
→ authoritative evidence sufficient?
```

If yes, generation may proceed. If no:

```text
NEEDS_EVIDENCE
```

Experiment-only generation may still occur but remains non-authoritative.

---

# 12. DERIVED_RENDER semantics

```text
DERIVED_RENDER
= generation stabilizer
!= product truth
```

It may support conditioning, planning, or edit stabilization, but may never establish unseen geometry, create dimensions, convert unknown→known, or turn `UNVERIFIABLE` into `PASS` by itself.

---

# 13. DCO runtime plugin

One small deterministic Hermes plugin:

```text
dco-runtime
```

No custom image provider. Exactly 4 deterministic tools.

---

# 14. Tool 1 — `dco_execute_image_operation`

Replaces the earlier standalone `dco_materialize_candidate`.

Responsibilities:

```text
receive normalized GENERATE / EDIT request
→ call built-in Hermes image tool using ctx.dispatch_tool()
→ receive result
→ validate tool status
→ resolve returned URL or local path
→ materialize into DCO job workspace
→ capture requested metadata
→ capture reported metadata
→ inspect actual pixel dimensions
→ compute SHA-256
→ assign candidate ID
→ return normalized CandidateArtifact
```

This tool does not implement image generation. It delegates to Hermes built-in `image_generate` / edit via `openai-codex`.

This avoids an extra Sol model turn for deterministic housekeeping.

Example output:

```yaml
candidate_id: CAND-004
operation: EDIT
provider: openai-codex
imagegen_request_id: ""

requested:
  size: ""
  quality: ""

reported:
  size: ""
  quality: ""

actual:
  width_px: 0
  height_px: 0

artifact:
  path: ""
  sha256: ""

source_checkpoint_refs: []
reference_evidence_refs: []

status: READY
```

---

# 15. Tool 2 — `dco_source_preserve_composite`

Deterministic compositor.

Allowed:
- uniform scale;
- translation;
- alpha composite;
- deterministic contact/cast shadow.

Denied:
- non-uniform warp;
- generative product redraw;
- texture synthesis;
- AI inpainting of product;
- identity redesign.

Same inputs must produce the same output hash.

---

# 16. Tool 3 — `dco_record_lineage`

Writes immutable lineage edges.

Generation example:

```text
SRC-001
→ FIDELITY-001
→ SHOTCRAFT-001
→ SCENEPLAN-001
→ GENREQ-001
→ IMGREQ-001
→ CAND-001
→ QA-001
```

Edit example:

```text
APPROVED-CHECKPOINT-001
→ EDIT-CONTRACT-002
→ IMGREQ-003
→ CAND-003
→ QA-003
```

---

# 17. Tool 4 — `dco_validate_release`

Rejects illegal release transitions deterministically.

Forbidden:

```text
FAIL + RELEASE_APPROVED
UNVERIFIABLE + RELEASE_APPROVED
NEEDS_EVIDENCE + CLIENT_RELEASE
EXPERIMENT_ACCEPTED + CLIENT_RELEASE
```

Only:

```text
RELEASE_ELIGIBLE
+ human RELEASE_APPROVED
→ CLIENT_RELEASE
```

---

# 18. `post_tool_call` policy

Use `post_tool_call` for telemetry only.

Track:

```text
tool latency
generation/edit counts
success/failure counts
error taxonomy
aggregate image-tool duration
```

Do not mutate fidelity-critical state in hooks.

Reason: hook failures are fail-open/logged-and-continued, which is appropriate for telemetry but not artifact integrity or release state.

---

# 19. Why not explicit second materialize tool

Rejected:

```text
LLM
→ image_generate
→ result
→ LLM
→ dco_materialize_candidate
```

Reason: extra Sol inference, token usage, and latency for deterministic housekeeping.

Transactional `dco_execute_image_operation` avoids that round-trip.

---

# 20. Prompt compiler constraint

Allowed:

```text
approved contracts
→ provider-ready payload
```

Forbidden:
- rewrite creative direction;
- change FidelityContract;
- invent camera strategy;
- invent scene strategy;
- soften release constraints.

---

# 21. Automated generation state

Normal happy path:

```text
PROMPT_READY
→ IMAGE_OPERATION_REQUESTED
→ DCO_EXECUTE_IMAGE_OPERATION
→ IMAGE_TOOL_EXECUTING
→ IMAGE_RESULT_RECEIVED
→ CANDIDATE_MATERIALIZED
→ QA_REVIEW
```

No normal `AWAITING_HUMAN_GENERATION`.

---

# 22. Human intervention states

Only:

```text
NEEDS_EVIDENCE
NEEDS_ASSET_PREP
GENERATION_TOOL_ERROR
STRATEGY_EXHAUSTED
HUMAN_RELEASE_REVIEW
```

Manual image generation is exception-only.

---

# 23. QA contract

Evidence observability:

```text
DIRECT
PARTIAL
NOT_OBSERVABLE
```

Evidence sufficiency:

```text
SUFFICIENT
LIMITED
INSUFFICIENT
```

Product fidelity:

```text
PASS
FAIL
UNVERIFIABLE
```

Presentation/integration:

```text
PASS
FAIL
```

Release:

```text
RELEASE_ELIGIBLE
RELEASE_BLOCKED
NEEDS_EVIDENCE
```

---

# 24. Release aggregation

`RELEASE_BLOCKED` on proven critical contradiction or critical integration failure.

`NEEDS_EVIDENCE` when a critical claim cannot be verified.

`RELEASE_ELIGIBLE` only when:

```text
all critical product attributes PASS
AND evidence sufficient
AND shot compliance PASS
AND presentation/integration PASS
AND no critical artifacts
```

---

# 25. Human authority

Allowed:

```text
RELEASE_ELIGIBLE + RELEASE_APPROVED → CLIENT_RELEASE
```

Allowed:

```text
FAIL / UNVERIFIABLE + EXPERIMENT_ACCEPTED → EXPERIMENT_ONLY
```

Forbidden:

```text
FAIL / UNVERIFIABLE + human override → CLIENT_RELEASE
```

---

# 26. Billing terminology

```yaml
billing_mode: CHATGPT_CODEX_OAUTH
incremental_image_api_spend_usd: 0
subscription_allowance_consumed: UNKNOWN
```

Never claim free/unlimited usage.

---

# 27. Backend metadata rule

Requested model/quality/size are not treated as guaranteed output properties.

Always record:

```text
requested_*
reported_*
actual pixel dimensions
```

Downstream composition uses observed values.

---

# 28. E2E A — Alex strict preserve

```text
fictional authorized product PNG with alpha
→ Hermes intake
→ FidelityContract
→ SHOT_FEASIBILITY_GATE
→ ShotCraftPlan
→ SceneIntegrationPlan
→ GenerationRequest
→ dco_execute_image_operation
→ product-free scene plate
→ reported_* gate
→ deterministic source composite
→ composite seam/integration QA
→ product/release QA
→ RELEASE_ELIGIBLE
→ Rommy RELEASE_APPROVED
→ CLIENT_RELEASE
```

Required:
- no manual prompt paste;
- no manual ChatGPT UI;
- no manual image download;
- source product bytes unchanged;
- scene generated via openai-codex;
- lineage complete;
- composite deterministic;
- integration QA PASS.

---

# 29. E2E B — ITWR bounded repair

```text
approved checkpoint
→ repairable visual issue
→ VisualQA FAIL
→ EditContract sanitizer gate
→ edit payload
→ dco_execute_image_operation
→ native Hermes image edit
→ candidate materialized
→ target-accuracy QA
→ protected-content/collateral-drift QA
→ PASS
```

Required:
- no manual ChatGPT UI;
- edit starts from approved checkpoint;
- one atomic mutation;
- protected content materially stable;
- revision lineage complete.

---

# 30. E2E C — unsupported novel view

```text
single angled source
→ exact straight/front request
→ SHOT_FEASIBILITY_GATE
→ critical unseen geometry unsupported
→ NEEDS_EVIDENCE
```

This is a successful system outcome.

---

# 31. Semantic golden acceptance

Run:

```text
POSITIVE ×3
NEGATIVE ×3
AMBIGUOUS ×3
```

with:

```text
gpt-6.1-sol
reasoning: medium
```

Expected:

```text
POS 3/3 → PASS → RELEASE_ELIGIBLE
NEG 3/3 → FAIL → RELEASE_BLOCKED
AMB 3/3 → UNVERIFIABLE → NEEDS_EVIDENCE
```

Aggregate required:

```text
9/9
```

Sol High cannot rescue a failed batch.

---

# 32. Single final project gate

There is no separate early Alex-ready or ITWR-ready status.

Only:

```text
DCO_PROJECT_READY_FOR_PITCH
```

The project must be complete before any proposal is sent.

---

# 33. `DCO_PROJECT_READY_FOR_PITCH` requirements

## Skill/runtime

```text
[ ] 5 specialist skills implemented
[ ] orchestrator implemented
[ ] project-local skill discovery PASS
    OR external_dirs fallback PASS
[ ] dco-runtime plugin implemented
[ ] exactly 4 deterministic tools
```

## Native automation

```text
[ ] native text-to-image E2E PASS
[ ] native image-edit E2E PASS
[ ] happy path manual generation interventions = 0
[ ] candidate auto-materialization PASS
[ ] requested/reported/actual metadata captured
```

## Mode A

```text
[ ] SOURCE_PRESERVE_STRICT E2E PASS
[ ] original product raster preserved
[ ] deterministic composite PASS
[ ] reported_* geometry gate PASS
[ ] composite seam/integration QA PASS
```

## Mode B

```text
[ ] bounded EditContract E2E PASS
[ ] retry from approved checkpoint
[ ] protected-content QA PASS
[ ] collateral-drift QA PASS
```

## Mode C

```text
[ ] unsupported novel view → NEEDS_EVIDENCE
[ ] DERIVED_RENDER cannot create truth
[ ] experiment-only path cannot become CLIENT_RELEASE
```

## Semantic QA

```text
[ ] POS 3/3
[ ] NEG 3/3
[ ] AMB 3/3
[ ] total 9/9 on Sol Medium
```

## Release

```text
[ ] FAIL cannot client-release
[ ] UNVERIFIABLE cannot client-release
[ ] EXPERIMENT_ACCEPTED only EXPERIMENT_ONLY
[ ] RELEASE_APPROVED only after RELEASE_ELIGIBLE
```

## Cost / safety

```text
[ ] incremental Image API-key spend = US$0
[ ] browser automation absent
[ ] no silent paid-provider fallback
[ ] secret scan clean
```

Only after every item passes:

```text
DCO_PROJECT_READY_FOR_PITCH
→ build proof pack
→ submit Alex pitch
→ submit ITWR pitch
```

---

# 34. Architecture status

Previous R1 Codex handoff:

```text
HOLD
```

Current checkpoint:

```text
MVP_REOPENED_FOR_HERMES_NATIVE_CREATIVE_MESH_V02_R2_LITE
```

Codex remains HOLD until:

```text
Grok final review
→ Rommy approval
→ ChatGPT final repo audit
→ freeze
→ Codex implementation handoff
```

---

# 35. Final freeze candidate

```text
Hermes single orchestrator
+
5 specialist skills
+
built-in openai-codex image backend
+
1 dco-runtime plugin
  exactly 4 deterministic tools:
    dco_execute_image_operation
    dco_source_preserve_composite
    dco_record_lineage
    dco_validate_release
+
post_tool_call telemetry only
+
Mode A primary
+
Mode B secondary/revision
+
Mode C evidence-gated
+
R1 evidence-aware release contract
+
Rommy final release authority
```

---

# 36. Final one-line architecture

> **Denver Creative OS V0.2-R2-Lite is a single-Hermes-agent product-visual production system that combines five focused creative/fidelity skills with native Codex-OAuth image generation/editing, a four-tool deterministic integrity plugin, strict source preservation where required, bounded automated repairs, evidence-aware QA, and human-only final client release.**
