# Codex session checklist — V0.2-R1

One-page tracker for a local Codex implementation session.  
**Paste-first:** root `CODEX_START_PROMPT.md` · **Authority:** `FINAL_CODEX_HANDOFF_DCO_V02_R1.md`

## Preflight reads

- [ ] `AGENTS.md`
- [ ] `routing.md`
- [ ] `CONTEXT.md`
- [ ] `ROADMAP.md`
- [ ] `CODEX_HANDOFF.md`
- [ ] `denver-creative-os/docs/architecture/FINAL_CODEX_HANDOFF_DCO_V02_R1.md` (§35 + §§1–11 + §36)
- [ ] `denver-creative-os/docs/architecture/V02_R1.md`
- [ ] `denver-creative-os/docs/architecture/SYNTHESIS.md` (if present)
- [ ] Skill tree `denver-creative-os/skills/denver-creative-os/`
- [ ] Demo pointer only (no QA rewrite): `jobs/DCO-20260930-001/`
- [ ] Confirmed local §35 PATCH map present (else STOP)

## Denies (must remain true)

- [ ] No Image API / paid image gen
- [ ] No ChatGPT Images browser automation
- [ ] No auto client-release
- [ ] No n8n/MCP/multi-agent orchestration in this phase
- [ ] No secrets paste; `E:\Hermes` out of repo
- [ ] Demo QA history untouched

## PATCH-0..15 (one at a time; verify before next)

| Done | Id | Scope (from §35) |
|:----:|:---|:-----------------|
| [ ] | PATCH-0 | Checkpoint → `MVP_REOPENED_FOR_FIDELITY_CONTRACT_V02_R1` |
| [ ] | PATCH-1 | §1 Governance/docs + V02_R1 / SYNTHESIS append as needed |
| [ ] | PATCH-2 | §3 Evidence Authority (+ related refs) |
| [ ] | PATCH-3 | §4 Product truth schema + §5 `SHOT_FEASIBILITY_GATE` |
| [ ] | PATCH-4 | §8 QA + release schema (evidence/verdict/release) |
| [ ] | PATCH-5 | §6 SOURCE_PRESERVE compositor + tests |
| [ ] | PATCH-6 | §7 NOVEL_VIEW + DERIVED_RENDER |
| [ ] | PATCH-7 | §2 Skill contract `SKILL.md` integration |
| [ ] | PATCH-8 | §9 Delivery + §10 State machine + §11 Fail-family |
| [ ] | PATCH-9 | Golden fixtures POS/NEG/AMB |
| [ ] | PATCH-10 | Validators |
| [ ] | PATCH-11 | 3×3 Sol Medium acceptance batch |
| [ ] | PATCH-12 | SOURCE_PRESERVE E2E proof |
| [ ] | PATCH-13 | NOVEL_VIEW → NEEDS_EVIDENCE proof |
| [ ] | PATCH-14 | Secret scan + regression |
| [ ] | PATCH-15 | Restore `MVP_READY_…` **only if** return gate all PASS |

After each patch: note what changed / what verified / next PATCH id. Stop after PATCH-0 unless operator said continue.

## Pitch-ready return gate (all required)

- [ ] V02_R1 canonical doc committed
- [ ] Skill V0.2-R1 implemented
- [ ] Evidence Authority + Product Truth vs Guardrails
- [ ] SHOT_FEASIBILITY_GATE
- [ ] SOURCE_PRESERVE + deterministic compositor + same-input hash PASS
- [ ] NOVEL_VIEW contract; DERIVED_RENDER cannot create truth
- [ ] evidence/verdict/release triad; no client-release override; EXPERIMENT_ONLY works
- [ ] POS 3/3 · NEG 3/3 · AMB 3/3 · aggregate 9/9 (Sol Medium)
- [ ] Sol High not used as rescue
- [ ] Image API calls = 0; browser automation absent; secret scan clean
- [ ] Historical V0 demo unchanged

## §36 final report

- [ ] Fill YAML in FINAL handoff §36 honestly
- [ ] If any gate FAIL → status remains `MVP_REOPENED_FOR_FIDELITY_CONTRACT_V02_R1`
- [ ] No partial success relabeled pitch-ready
