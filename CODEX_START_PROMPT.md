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
5. **V0.2-R1 denies (hard):**
   - Image API automation / paid image generation
   - Browser automation of ChatGPT Images
   - Auto client-release / auto-approve
   - n8n / MCP / webhooks / DB / VPS / multi-agent orchestration splits in this phase
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
- ChatGPT Images remains **manual V0** (human UI).
- Hermes data at `E:\Hermes` is OUT of repo — never paste secrets.

---

## D. PATCH sequencing

Use FINAL handoff **§35** mapping **PATCH-0..15** (maps onto patch plan §§1–11 + fixtures/validators/E2E/return gate).

1. Start **PATCH-0** (checkpoint reopen → `MVP_REOPENED_FOR_FIDELITY_CONTRACT_V02_R1`).
2. Then **PATCH-1**, then continue **one-at-a-time** through **PATCH-15**.
3. **Pitch-ready** only after return gate **all PASS** + **§36** YAML report filled honestly.
4. After each patch: short status — what changed / what verified / next PATCH id.
5. If any required gate fails, checkpoint stays reopened; **no partial success may be relabeled pitch-ready**.

---

## E. First actions for this session

1. Confirm **§35** exists in local `FINAL_CODEX_HANDOFF_DCO_V02_R1.md`. If missing, **stop and report**.
2. Execute **PATCH-0 only**.
3. **Stop and report**; wait for operator before PATCH-1 unless the operator explicitly said continue.

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

## Quick deny reminder

No Image API · no browser auto · no auto client-release · no n8n/MCP/multi-agent orchestration · no “Sol upgrade = geometry PASS” · no secrets in chat/git · no rewrite of demo QA history.