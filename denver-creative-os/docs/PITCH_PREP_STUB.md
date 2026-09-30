# PITCH_PREP_STUB

**Status:** Stub only — full client pitch deck is **deferred**.  
**Depends on:** `docs/CURRENT_CHECKPOINT.md` = `MVP_READY_FOR_PITCH_PREPARATION`  
**Demo proof:** `jobs/DCO-20260930-001/` (DELIVERED, Image API spend 0)  
**Written:** 2026-09-30T15:56:30+08:00 (Asia/Makassar)

## Explicit deferral

This file is **not** a pitch deck, proposal PDF, or client-facing slide set.  
Do **not** treat DCO-4 as deck work. Next real work after operator go: **proof pack**, then pitch copy.

## One-page outline (client pitch / PPH-style proposal)

### 1. Problem
Furniture / ecommerce brands need repeatable lifestyle shots from existing cutouts or product refs, without a full on-site studio for every SKU — and without silent product geometry drift.

### 2. Offer (V0-honest)
Remote AI visual production loop:

- **Hermes** orchestrates intake, 3-shot plan, versioned prompts, vision QA, revise, package  
- **Human** runs ChatGPT Images (V0) and final approval  
- **Rommy** cross-checks before anything reaches a client  
- Target: ≥3 commercial shots per product (enterprise studio bar)

### 3. Proof pack steps (do these next — not done in DCO-4)

1. Screenshot / short folder-walk of `jobs/DCO-20260930-001/` (source → delivery).  
2. Show three delivery PNGs + `DELIVERY_MANIFEST.yaml`.  
3. Call out SHOT-02 `geometry_drift` + operator override honestly (do not hide).  
4. One-page workflow diagram matching DOCS_README loop (Hermes / files / human / Images).  
5. Cost line: incremental Image API spend = US$0 on the demo.  
6. Scope line: email / WhatsApp / client portal = later; not in V0.

### 4. Pitch tracks (after proof pack)

| Track | Hypothesis (unproven ROI) |
|-------|---------------------------|
| A — Furniture / ecommerce (PPH-style) | Cutouts → lifestyle set with fidelity QA |
| B — Interiors / creative agency | Direction in; remote AI production + QA out |

### 5. What not to promise yet

- Automated Image API generation  
- Perfect geometry on every GPT Image attempt  
- Unattended / auto-approve delivery  
- n8n / webhook / portal integrations  
- Production SLA

### 6. Ask (placeholder)

Pilot: one authorized product, three human-approved shots, Rommy QA gate, fixed turnaround window — pricing TBD by Rommy.

---

**Stop.** Build the proof pack only when the operator opens that work. No bunk-bed job from this stub. No Image API. No DFI/secrets.
