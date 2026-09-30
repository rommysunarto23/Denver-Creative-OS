# Codex start prompt — Denver Creative OS V0.2-R1

**Paste this entire file into a fresh Codex session.**  
**Repo root (local only):** `E:\rommy\Denver Creative OS\`  
**Authority for implementation:** `denver-creative-os/docs/architecture/FINAL_CODEX_HANDOFF_DCO_V02_R1.md`  
**Operator:** Rommy. Docs stay English; Denver may translate chat to Indonesian.

---

## A. Operating constraints

1. **Local only.** Work under `E:\rommy\Denver Creative OS\`. NO web browse. NO GitHub browse. NO secrets paste into chat or commits.
2. **poteto-mode:** one PATCH at a time; verify before the next.
3. **Code under package:** skill/job/template/fixture work lives under `denver-creative-os/`. Root docs (`AGENTS.md`, `routing.md`, `CONTEXT.md`, `ROADMAP.md`, `CODEX_HANDOFF.md`, this file) are orchestration pointers.
4. **Do not rewrite** historical demo QA bytes in `denver-creative-os/jobs/DCO-20260930-001/`. Migration note only if the contract requires a pointer; leave delivered artifacts intact.
5. **V0.2-R1 allow/deny (image gen + release):**
   - **ALLOW:** Hermes `image_generate` with provider **OpenAI (Codex auth)** OAuth for V0 candidate generation/edit (subscription OAuth; no separate paid Images API key required for that path).
   - **DENY:** Paid OpenAI Images API key path as a *required* V0 dependency (optional later); browser automation of chat.openai.com / chatgpt.com Images UI; auto client-release / auto-approve without human gate.
   - Allowing Hermes `image_generate` does **not** relax SOURCE_PRESERVE, SHOT_FEASIBILITY_GATE, evidence-aware QA, DERIVED_RENDER non-authority, or human release.
   - n8n / MCP / webhooks / DB / VPS / multi-agent orchestration splits remain out of this phase
6. Hermes data at `E:\Hermes` is **out of repo** — never paste secrets, `auth.json`, tokens, or keys.

---

## B. Read order (mandatory before coding)

Exact relative paths from repo root, in order:

1. `AGENTS.md`
2. `routing.md`
3. `CONTEXT.md`
4. `ROADMAP.md`
5. `CODEX_HANDOFF.md`
6. `denver-creative-os/docs/architecture/FINAL_CODEX_HANDOFF_DCO_V02_R1.md`  
   (**authority** — especially **§35 PATCH map**, patch plan **§§1–11**, and **§36** report YAML)
7. `denver-creative-os/docs/architecture/V02_R1.md`
8. `denver-creative-os/docs/architecture/SYNTHESIS.md` (if present — Ideal V0.2 base; superseded by R1)
9. Skill tree under `denver-creative-os/skills/denver-creative-os/`
10. Demo job pointer only (do **not** mutate QA history): `denver-creative-os/jobs/DCO-20260930-001/`

Optional one-page tracker: `denver-creative-os/docs/architecture/CODEX_SESSION_CHECKLIST.md`

---

## C. Proven facts — do not re-open as questions

- **DCO-0..4 done.** Demo job `DCO-20260930-001` is **DELIVERED** with SHOT-02 geometry fail ×4; Cand-04 accepted with `geometry_drift`.
- **Prompt/model swap (luna → Sol) does NOT fix SHOT-02 geometry on the same pixels.** Sol was stricter, not a geometry rescue.
- Premise **“smarter Hermes → geometry PASS” is falsified.**
- Ideal **V0.2-R1 ACCEPTED** by Rommy: **Evidence Authority + Raster Preservation**; Rommy approved the **6 deltas**.
- Primary path **`SOURCE_PRESERVE`**. **`NOVEL_VIEW`** is higher risk → **`NEEDS_EVIDENCE`** when evidence is insufficient (that refusal is success).
- Default Hermes model **`gpt-6.1-sol` / reasoning medium**. High only for hard QA escalation; High **cannot rescue acceptance**.
- **V0 gen path (amended):** Hermes `image_generate` + OpenAI Codex OAuth (not manual ChatGPT Images paste). Human cross-check / release gate + SOURCE_PRESERVE / Evidence Authority unchanged. Geometry can still fail; automation ≠ fidelity fix.
- GPT Image 2.5 is **not** on Codex auth (API key or FAL if ever needed). `hermes setup --portal` ≠ Codex OAuth image provider. Select via `hermes tools` → Image Generation → OpenAI (Codex auth); one text + one edit smoke before skill reliance.
- Hermes data at `E:\Hermes` is OUT of repo — never paste secrets.

---

## D. PATCH sequencing

Use FINAL handoff **§35** mapping **PATCH-0..15** (maps onto patch plan §§1–11 + fixtures/validators/E2E/return gate).

**Docs amend (2026-09-30):** V0 image gen path is now Hermes Codex OAuth `image_generate` (see FINAL handoff subsection). This does **not** authorize skill/compositor implementation yet.

1. **PATCH-0** may already be done locally (uncommitted checkpoint reopen). **Do not redo PATCH-0.**
2. **Hold PATCH-1** until the operator explicitly says **GO**. After re-reading `CODEX_START_PROMPT.md` + FINAL handoff, wait.
3. When GO: continue **one-at-a-time** through **PATCH-15**.
4. **Pitch-ready** only after return gate **all PASS** + **§36** YAML report filled honestly.
5. After each patch: short status — what changed / what verified / next PATCH id.
6. If any required gate fails, checkpoint stays reopened; **no partial success may be relabeled pitch-ready**.

---

## E. First actions for this session

1. Re-read this file + FINAL handoff (including **V0 image generation path (Hermes Codex OAuth)**). Confirm **§35** exists. If missing, **stop and report**.
2. **Do not redo PATCH-0** if checkpoint reopen already exists locally.
3. **Do not start PATCH-1** until operator says **GO**.
4. **Stop and report** current status (PATCH-0 state + waiting for GO).

---

## F. Success criteria for this start prompt

After paste + reads, Codex can begin **without** asking Denver for missing context on:

- root path  
- read order  
- denies  
- proven failures  
- accepted architecture  
- PATCH map  
- first patch (PATCH-0)

---

## Quick allow/deny reminder

**ALLOW:** Hermes `image_generate` + OpenAI Codex OAuth for V0 candidates.  
**DENY:** paid OpenAI Images API key as required V0 dep; ChatGPT Images UI browser automation; auto client-release; n8n/MCP/multi-agent orchestration; "Sol upgrade = geometry PASS"; secrets in chat/git; rewrite of demo QA history.  
**KEEP:** human release gate + SOURCE_PRESERVE + Evidence Authority + DERIVED_RENDER non-authority.
