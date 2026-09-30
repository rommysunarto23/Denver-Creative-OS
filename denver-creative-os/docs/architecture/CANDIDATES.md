# CANDIDATES.md - Phase B Sketch (structurally distinct)

**Phase:** B Sketch  
**Written:** 2026-09-30 ~17:05 Asia/Makassar (UTC+8)  
**Constraint:** Design only. Pseudocode / types / surfaces. **No implementation.** Image API = later-phase flag only. No DFI/secrets.

**Screen (anti-shallow):** Each candidate must change **who owns identity binding** or **what artifact is authoritative before lifestyle**, not merely reorder the same Hermes prompt->QA loop into more YAML steps.

---

## Shared product target (all candidates)

```text
Operator cutout -> >=3 enterprise studio lifestyle shots
  (SHOT-01 angled / SHOT-02 straight / SHOT-03 medium-close)
Hermes orchestrates · Rommy final authority · ChatGPT Images remains human V0 generator
Upload/email/WA/portal = later
```

**Proven refusal (do not re-assert as V0.1 success path):**  
"Better Hermes reasoning/prompts alone -> geometry PASS" - falsified by SHOT-02 x4 + Sol same-pixel BLOCK.

---

## Candidate A - Refine current file+skill Hermes loop

### Shape (whole)

Keep **prompt-as-authority -> human Images -> vision QA** ownership. Improve the *policy* of that loop: fail-family detection, QA calibration, state machine for override/saturation, prompt strategy playbooks - **without** introducing a locked identity raster before lifestyle.

**Ownership:** Hermes (skill) still owns "what to ask the generator"; Images still owns pixels; Rommy owns approve. Identity remains **textual + attached source photo**, not a separate locked asset stage.

### Module map

```text
┌─────────────────────────────────────────────────────────┐
│  SkillLoopV01 (same folders, richer policy)             │
│  ├── IntakeBrief          (unchanged contract)          │
│  ├── ShotPlan             (+ hard-elevation risk tag)   │
│  ├── PromptStrategy       (playbooks by fail_family)    │
│  ├── GenerationPause      (manual Images; unchanged)    │
│  ├── VisionQA             (Sol Medium; High escalate) │
│  ├── FailFamilyTracker    (NEW: cluster BLOCKs)         │
│  ├── OverrideLedger       (NEW: drift-honest package)   │
│  └── Package              (manifest + drift flags)      │
└─────────────────────────────────────────────────────────┘
```

### Types / signatures (pseudocode)

```text
type FailFamily = "wide_shallow_body_thick_legs" | "leg_count" | "finish_unify" | "scene_clutter" | "unknown"

type QaVerdict = {
  shot_id: ShotId
  candidate_id: string
  criteria: { source_fidelity | geometry | ... : PASS | WARN | BLOCK }
  decision: REVISE | APPROVE_RECOMMEND
  fail_family: FailFamily | null
}

type PromptStrategy = {
  strategy_id: "numeric_ratio_lock" | "soften_thickness_language" | "studio_void" | "camera_match_request"
  applies_when: FailFamily[]
  max_cycles_before_operator: int  // default 2; hard-elevation may be 1 after same family
}

fn plan_shots(brief: ProductBrief) -> ShotPlan
fn author_prompt(shot: Shot, brief: ProductBrief, prior: QaVerdict?) -> PromptArtifact
fn classify_fail_family(qa: QaVerdict, prior: QaVerdict[]) -> FailFamily
fn next_action(qa: QaVerdict, family_streak: int) ->
    REVISE_PROMPT | ASK_OPERATOR | RECOMMEND_OVERRIDE_PATH | STOP
fn package(job: Job, approvals: HumanDecision[]) -> DeliveryManifest
  // must surface geometry_drift / hermes_decision != human_decision
```

### Public surface (operator-facing)

- Same job folder contract + skill commands (INTAKE…PACKAGE).  
- New operator-visible artifacts: `qa/fail-family.yaml`, clearer `OPERATOR_NEXT` with A/B/C after streak>=2 same family.  
- Prompt playbook docs under skill `references/` (not a new runtime).  
- ChatGPT Images still human; **no Image API**.

### How it hits product outcome

- Faster honest stop / override when generator cannot comply - less wasted v6+.  
- Slightly better prompts for *scene* compliance (already seen: v5 plain studio landed).  
- **Does not claim** geometry PASS rate improvement; EV is process honesty + pitch hygiene.

### What it refuses

- Claiming Sol upgrade "fixed" SHOT-02.  
- Auto-approve attractive drift.  
- Image API / browser automation.  
- Infinite revise on same fail_family without operator fork.  
- Fake numeric quality scores.

### Structural risk

Still attacks the **falsified premise** if sold as fidelity fix. Valid as **governance refinement**, weak as **fidelity architecture**.

---

## Candidate B - Identity-first pipeline (different ownership)

### Shape (whole)

Insert an **Identity Lock** stage **before** lifestyle generation. Authoritative artifact shifts from "prompt + source attachment hope" to a **locked identity raster / proportion gate** that lifestyle shots must reference via **edit / img2img-style** human workflow (still ChatGPT Images UI capabilities the operator already has - not API).

**Ownership change:** A new module owns **proportion-certified identity**; lifestyle prompts consume that lock; QA compares candidates to **lock + source**, not source alone with unmatched camera.

```text
cutout
  -> IdentityLock (orthographic / turntable / proportion card)   <- NEW owner
  -> ProportionGate (PASS required before lifestyle)            <- NEW gate
  -> LifestyleEditPack (edit from lock; angled/straight/close)  <- generation mode change
  -> Hermes QA vs lock+source
  -> Rommy approve -> package
```

This is **not** Candidate A with extra folders: the **primary generation contract** becomes edit-from-lock, not text-to-lifestyle from angled cutout.

### Module map

```text
┌──────────────────────────────────────────────────────────────┐
│  IdentityFirstV01                                            │
│  ├── CutoutNormalize     (immutable source + optional crop)  │
│  ├── IdentityLockBuilder (human Images: produce lock sheet)  │
│  ├── ProportionGate      (Hermes vision: ratios / counts)    │
│  ├── LifestyleEditPlanner(shots as edits of lock, not TXT2I) │
│  ├── GenerationPause     (manual; attach LOCK not only cutout)│
│  ├── VisionQA            (criteria bind to lock_id)          │
│  ├── ReviseLockOrEdit    (branch: fix lock vs fix lifestyle) │
│  └── Package             (lineage: source -> lock -> shot)     │
└──────────────────────────────────────────────────────────────┘
```

### Types / signatures (pseudocode)

```text
type IdentityLock = {
  lock_id: string
  source_path: Path
  lock_path: Path                 // e.g. source/identity-lock-vN.png
  views: ["front", "three_quarter", "detail_join"]  // may be collage sheet
  proportion_card: {
    body_height_over_total: Interval
    body_width_over_height: Interval
    leg_count: 4
    leg_thickness_class: "stick" | "post" | ...
    two_tone: bool
  }
  gate: PASS | BLOCK
}

type LifestyleEditBrief = {
  shot_id: ShotId
  base_lock_id: string
  edit_intent: "relight_studio" | "angle_change" | "medium_close_crop"
  must_preserve_from_lock: string[]   // not free redesign
}

fn build_identity_lock(source: Path, operator_notes: Notes) -> PromptArtifact
  // PAUSE: human generates lock sheet in Images (still manual)
fn gate_proportions(lock: IdentityLock, source: Path) -> GateResult
  // BLOCK -> revise lock; do NOT open lifestyle shots
fn plan_lifestyle_edits(lock: IdentityLock, plan: ShotPlan) -> LifestyleEditBrief[]
fn author_edit_prompt(brief: LifestyleEditBrief) -> PromptArtifact
fn qa_against_lock(candidate: Path, lock: IdentityLock, source: Path) -> QaVerdict
fn revise(target: LOCK | LIFESTYLE, qa: QaVerdict) -> PromptArtifact
```

### Public surface

- New job paths: `source/identity-lock-vN.png`, `brief/proportion-card.yaml`, `plan/edit-plan.yaml`.  
- OPERATOR_NEXT distinguishes **LOCK_AWAITING_GENERATION** vs **LIFESTYLE_AWAITING_GENERATION**.  
- Delivery manifest gains `identity_lock_id` lineage.  
- ChatGPT Images remains human; workflow asks for **edit/variation from lock** when UI supports it; if UI cannot bind, candidate **refuses** to pretend TXT2I is equivalent (operator decision / later generator).

### How it hits product outcome

- Directly attacks proven failure mode: lifestyle TXT2I invents proportions.  
- Straight shot becomes "camera/relight of locked front" rather than "describe front from angled photo."  
- Still >=3 studio shots; Hermes still orchestrates; Rommy still final.  
- Expected cost: more human generation steps (lock + 3), fewer useless geometry revises.

### What it refuses

- Opening lifestyle prompts before `ProportionGate = PASS`.  
- Approving lifestyle that diverges from lock on hard constraints.  
- "Prompt-only" fix path as primary for hard elevations.  
- Image API automation (flagged later).  
- Treating evaluator model swap as identity fix.  
- Auto-approve.

### Structural risk / honesty

- Depends on ChatGPT Images **edit/identity adherence** quality (unknown until operator paste / trial).  
- Extra PAUSE friction - accepted if it buys fidelity.  
- If Images cannot edit-lock reliably, Candidate B fails closed -> escalate to later provider (API/FLUX/etc.), not back to premise A.

---

## Candidate C - Thin option: camera-matched evidence before fail-closed (not primary)

### Shape

Keep Candidate A loop, but for hard elevations require a **camera-matched source reprojection / second reference photo** (operator-supplied or Hermes-guided crop sheet) before geometry can PASS. Ownership of "evidence" changes slightly; ownership of generation does not.

```text
fn require_matched_evidence(shot: Shot) -> EvidencePack
  // e.g. front-crop from turntable, or operator phone front photo
fn qa(...): if evidence missing and shot.risk == hard_elevation -> NEEDS_INPUT (not BLOCK-on-guess)
```

### Why thin / not primary

- Helps Sol High's "viewpoint limits certainty" issue.  
- Does **not** by itself stop generator drift if still TXT2I lifestyle.  
- Useful as **addon** to B (lock includes front view) or as temporary A mitigation.  
- Alone = shallow if sold as full V0.1 architecture.

### Refuses

- Claiming matched evidence alone flips Cand-04-class failures without new generation.  
- Inventing dimensions from unmatched angled ratios.

---

## Exhaust screen (why not other shapes)

| Rejected shallow shape | Why rejected |
|------------------------|--------------|
| More YAML criteria / numeric scores | Temporal/procedural thickening; no ownership change |
| Multi-agent "Prompt Agent + QA Agent" | Blueprint deferred multi-agent; splits words not pixels |
| Sol High default everywhere | Proven same-pixel BLOCK; cost/latency; not identity owner |
| Auto Image API in V0.1 core | Violates V0 deny; may be **later phase** after B proves lock need |
| Beauty-first approve with post-hoc notes | Contradicts product fidelity principle |

---

## Side-by-side (ownership)

| | A Refine loop | B Identity-first | C Evidence (thin) |
|-|---------------|------------------|-------------------|
| Identity authority | Source + prompt text | **Lock raster + proportion card** | Source + matched view |
| Generation contract | TXT2I lifestyle | **Edit/relight from lock** | TXT2I (+ better refs) |
| Hits geometry fail root? | Weak (governance) | **Strong (by design)** | Partial (measurement) |
| Extra human steps | Low | Medium (lock stage) | Low-medium |
| Image API | No | No (later flag) | No |
