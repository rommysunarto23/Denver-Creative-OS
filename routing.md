# routing.md — where to read / what to touch

**Purpose:** Router for Codex, Cursor, Hermes operators, and humans.  
**Canonical name:** `routing.md` (https://routing.md citation → this file).  
**Pointer:** `ROUTER.md` → this file.  
**Updated:** 2026-09-30 ~20:10 Asia/Makassar (UTC+8)

---

## ID ringkas

1. Mulai di sini → `AGENTS.md` → `CONTEXT.md` → `ROADMAP.md`.  
2. Fidelity / runtime architecture → **`denver-creative-os/docs/architecture/V02_R2_LITE.md` (CANONICAL; FREEZE APPROVED)**.  
3. `V02_R1.md` / R1 handoff / Ideal V0.2 body = **HISTORICAL / SUPERSEDED** only.  
4. Skill prosedur → `skills/denver-creative-os/SKILL.md` (implement only after FINAL R2-lite handoff).  
5. Bukti demo / pelajaran override → `jobs/DCO-20260930-001/`.  
6. Ragu spend / API / release → **STOP, tanya Rommy**.  
7. **Codex HOLD** until FINAL R2-lite coding handoff exists.

---

## Read first (cold start)

```text
1. routing.md          (this file)
2. AGENTS.md           (do / don't / DoD / verify)
3. CONTEXT.md          (what is true right now)
4. ROADMAP.md          (what is next vs later)
5. denver-creative-os/docs/architecture/V02_R2_LITE.md   # CANONICAL — V0.2-R2-Lite FREEZE APPROVED
```

**Historical only (do not treat as active authority):**

```text
- denver-creative-os/docs/architecture/V02_R1.md                    # SUPERSEDED
- denver-creative-os/docs/architecture/FINAL_CODEX_HANDOFF_DCO_V02_R1.md  # SUPERSEDED / do-not-execute
- denver-creative-os/docs/architecture/SYNTHESIS.md                 # Ideal V0.2 audit history
- denver-creative-os/docs/architecture/COMPARE_GROK_CHATGPT.md
- denver-creative-os/docs/architecture/GROUNDING.md
```

Then deepen by task type (decision tree below).

---

## Decision tree

```text
What is the task about?
|
|- Agent contract / how to behave
|    -> AGENTS.md (+ AGENT.md pointer)
|
|- Current runtime / model / Hermes paths / checkpoint
|    -> CONTEXT.md
|    -> denver-creative-os/docs/CURRENT_CHECKPOINT.md
|    -> denver-creative-os/docs/MODEL_ARCHITECTURE_V0.md   # HISTORICAL V0 ops; gen path superseded
|    -> denver-creative-os/docs/PROVIDER_GATE.md
|
|- Product / PRD / blueprint (why V0 exists)
|    -> DENVER_CREATIVE_OS_DOCS_README.md (root or denver-creative-os/docs/)
|    -> PRD_DENVER_CREATIVE_OS.md
|    -> DENVER_CREATIVE_OS_ARCHITECTURE_AND_REPO_BLUEPRINT.md
|
|- Fidelity / runtime architecture (ACTIVE)
|    -> docs/architecture/V02_R2_LITE.md     # CANONICAL #1 — FREEZE APPROVED; do not redesign
|    STOP: Codex HOLD — do not implement skill/plugin/code without FINAL R2-lite coding handoff
|
|- Historical fidelity trail (R1 / Ideal V0.2 — SUPERSEDED)
|    -> docs/architecture/V02_R1.md          # HISTORICAL only
|    -> docs/architecture/FINAL_CODEX_HANDOFF_DCO_V02_R1.md  # do-not-execute
|    -> docs/architecture/SYNTHESIS.md
|    -> docs/architecture/COMPARE_GROK_CHATGPT.md
|    -> docs/architecture/GROUNDING.md
|    -> docs/architecture/CHATGPT_AUDIT_NOTES.md / CHATGPT_V02_R1_NOTES.md
|    -> docs/architecture/CANDIDATES.md
|
|- Skill procedure / templates / rules / fixtures
|    -> denver-creative-os/skills/denver-creative-os/SKILL.md
|    -> references/PRODUCT_FIDELITY_RULES.md
|    -> references/VISUAL_QA_RULES.md
|    -> templates/* , fixtures/*
|    -> docs/scripts/check_skill_templates.* / check_scaffold.*
|
|- Demo job evidence / geometry override lesson
|    -> jobs/DCO-20260930-001/OPERATOR_NEXT.md
|    -> jobs/DCO-20260930-001/delivery/JOB_SUMMARY.md
|    -> jobs/DCO-20260930-001/delivery/DELIVERY_MANIFEST.yaml
|    -> jobs/DCO-20260930-001/qa/* (SHOT-02 BLOCK history)
|    -> jobs/DCO-20260930-001/retest-sol/COMPARISON.md
|    Lesson: BLOCK + override → DELIVERED is a contract hole; R2-lite closes it
|
|- Roadmap / sequencing
|    -> ROADMAP.md
|
\- Hermes install / out-of-repo runtime
     -> E:\Hermes (OUT OF REPO — do not commit)
     -> skills/denver-creative-os/INSTALL.md
     -> Ask Rommy before changing E:\Hermes\config.yaml
```

### skill vs docs vs jobs

| Need | Prefer |
|------|--------|
| Change **how Hermes behaves** on next job | `skills/denver-creative-os/**` (explicit patch task after FINAL R2-lite handoff) |
| Change **design intent / architecture truth** | `V02_R2_LITE.md` is FREEZE — do not redesign; other architecture docs are historical |
| Change **one job's artifacts** | `jobs/DCO-…/` only; never rewrite `source/` immutably |
| Prove contract | fixtures POS/NEG/AMB (+ scripts); not silent YAML edits in delivered demo |

---

## When to stop and ask Rommy

Stop and ask (do not guess) if the task would:

1. **Enable Image API** or any paid image generation path (API-key spend beyond R2-lite US$0 target).  
2. **Browser-automate** ChatGPT Images / reuse cookies / undocumented endpoints.  
3. **Auto-approve** or mark client `RELEASE_ELIGIBLE` / `DELIVERED` while critical FAIL or unresolved UNVERIFIABLE.  
4. **Spend money** (API keys required for MVP capability).  
5. **Edit `E:\Hermes` secrets/config** or couple DFI.  
6. **Implement R2-lite skill/plugin/code** without FINAL R2-lite coding handoff / explicit implementation instruction.  
7. **Execute R1 PATCH map** (`FINAL_CODEX_HANDOFF_DCO_V02_R1.md`) — SUPERSEDED.  
8. **Start a new client/pitch job** (e.g. bunk-bed / PPH real assets) without operator go.  
9. **Claim pitch-ready** while Mode A/B/C + POS/NEG/AMB 9/9 are missing.  
10. **Conflict** with deny list in `AGENTS.md` / skill invariants.  
11. Touch **secrets** (`.env`, `auth.json`, tokens) or put them in chat/git.  
12. **Redesign** frozen `V02_R2_LITE.md` body.

Default when unsure: **read more docs → propose a short plan → wait**. Prefer reversible doc edits over irreversible runtime or release claims.

---

## Quick deny list (router)

No paid Images API key as required dep · no browser auto · no auto client-release · no n8n/MCP/webhooks/DB/VPS in V0/R2 core · no "Sol upgrade = geometry PASS" · no R1 PATCH execute · no Codex implement until FINAL R2-lite handoff · no redesign of `V02_R2_LITE.md`.
