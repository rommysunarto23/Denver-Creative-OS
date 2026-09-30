# JOB_SUMMARY - DCO-20260930-001

**Status:** PACKAGE_DONE / DELIVERED  
**When:** 2026-09-30T15:48:41+08:00 (Asia/Makassar)  
**Product:** Fictional Oak Side Table (demo only)  
**Generation:** MANUAL_CHATGPT_IMAGES  
**Image API spend:** 0  

## SHOT-02 choice

**Cand-04** (candidates/SHOT-02-STRAIGHT/Cand-04.png, prompt v5).

Cand-04 is the straight-shot winner because the scene/studio landed: plain floor, no rug, no sofa. That matches the current shot plan. Cand-03 was the other commercial candidate and was not closer: both are commercial_usability: WARN, and Cand-03 still has a prominent rug.

`geometry_drift: true`. Hermes still says REVISE (source fidelity BLOCK + geometry BLOCK). The operator overrode that.

## Override note

Fail-closed geometry failed 4 times (cand-01, cand-02, Cand-03, Cand-04). GPT Image is the primary cause. Same fail family throughout: wide/shallow body and thick legs. No v6 was written. This package does not claim the geometry passed.

## Approved

| Shot | Approved file | Delivery file | Prompt | Human |
|------|---------------|---------------|--------|-------|
| SHOT-01-ANGLED | `approved/SHOT-01-ANGLED.png` | `delivery/shot-01-angled.png` | v1 | APPROVED |
| SHOT-02-STRAIGHT | `approved/SHOT-02-STRAIGHT.png` | `delivery/shot-02-straight.png` | v5 Cand-04 | APPROVED (override) |
| SHOT-03-MEDIUM-CLOSE | `approved/SHOT-03-MEDIUM-CLOSE.png` | `delivery/shot-03-medium-close.png` | v1 | APPROVED |

## Not in this job

No Image API. No DCO-4. No DFI or secrets.