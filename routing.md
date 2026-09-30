# routing.md — where to read / what to touch

**Purpose:** Router for Codex, Cursor, Hermes operators, and humans.  
**Canonical name:** `routing.md` (https://routing.md citation → this file).  
**Pointer:** `ROUTER.md` → this file.  
**Updated:** 2026-09-30 ~17:36 Asia/Makassar (UTC+8)

---

## ID ringkas

1. Mulai di sini → `AGENTS.md` → `CONTEXT.md`.  
2. Fidelity / Ideal V0.2-R1 -> `denver-creative-os/docs/architecture/V02_R1.md` (base: `SYNTHESIS.md`).
3. Skill prosedur → `skills/denver-creative-os/SKILL.md`.  
4. Bukti demo / pelajaran override → `jobs/DCO-20260930-001/`.  
5. Ragu spend / API / release → **STOP, tanya Rommy**.

---

## Read first (cold start)

```text
1. routing.md          (this file)
2. AGENTS.md           (do / don't / DoD / verify)
3. CONTEXT.md          (what is true right now)
4. ROADMAP.md          (what is next vs later)
5. denver-creative-os/docs/architecture/V02_R1.md          # Ideal V0.2-R1 (pending approve)
6. denver-creative-os/docs/architecture/SYNTHESIS.md        # Ideal V0.2 dual-layer base
7. denver-creative-os/docs/architecture/COMPARE_GROK_CHATGPT.md
8. denver-creative-os/docs/architecture/GROUNDING.md
```

Then deepen by task type (decision tree below).

---

## Decision tree

```text
What is the task about?
│
├─ Agent contract / how to behave
│    → AGENTS.md (+ AGENT.md pointer)
│
├─ Current runtime / model / Hermes paths / checkpoint
│    → CONTEXT.md
│    → denver-creative-os/docs/CURRENT_CHECKPOINT.md
│    → denver-creative-os/docs/MODEL_ARCHITECTURE_V0.md
│    → denver-creative-os/docs/PROVIDER_GATE.md
│
├─ Product / PRD / blueprint (why V0 exists)
│    → DENVER_CREATIVE_OS_DOCS_README.md (root or denver-creative-os/docs/)
│    → PRD_DENVER_CREATIVE_OS.md
│    → DENVER_CREATIVE_OS_ARCHITECTURE_AND_REPO_BLUEPRINT.md
│
├─ Fidelity architecture / Ideal V0.2-R1 / release honesty
    -> docs/architecture/V02_R1.md              # Ideal V0.2-R1 (authoritative pending approve)
    -> docs/architecture/SYNTHESIS.md          # Ideal V0.2 dual-layer base
│    → docs/architecture/COMPARE_GROK_CHATGPT.md
│    → docs/architecture/GROUNDING.md
    -> docs/architecture/CHATGPT_AUDIT_NOTES.md / CHATGPT_V02_R1_NOTES.md
│    → docs/architecture/CANDIDATES.md
    STOP: do not implement V0.2-R1 skill until Rommy approve + ChatGPT handoff + explicit Codex task
│
├─ Skill procedure / templates / rules / fixtures
│    → denver-creative-os/skills/denver-creative-os/SKILL.md
│    → references/PRODUCT_FIDELITY_RULES.md
│    → references/VISUAL_QA_RULES.md
│    → templates/* , fixtures/*
│    → docs/scripts/check_skill_templates.* / check_scaffold.*
│
├─ Demo job evidence / geometry override lesson
│    → jobs/DCO-20260930-001/OPERATOR_NEXT.md
│    → jobs/DCO-20260930-001/delivery/JOB_SUMMARY.md
│    → jobs/DCO-20260930-001/delivery/DELIVERY_MANIFEST.yaml
│    → jobs/DCO-20260930-001/qa/* (SHOT-02 BLOCK history)
│    → jobs/DCO-20260930-001/retest-sol/COMPARISON.md
│    Lesson: BLOCK + override → DELIVERED is a contract hole; Ideal V0.2-R1 closes it
│
├─ Roadmap / sequencing
│    → ROADMAP.md
│
└─ Hermes install / out-of-repo runtime
     → E:\Hermes (OUT OF REPO — do not commit)
     → skills/denver-creative-os/INSTALL.md
     → Ask Rommy before changing E:\Hermes\config.yaml
```

### skill vs docs vs jobs

| Need | Prefer |
|------|--------|
| Change **how Hermes behaves** on next job | `skills/denver-creative-os/**` (explicit patch task) |
| Change **design intent / architecture truth** | `denver-creative-os/docs/architecture/**` (+ root AGENTS/CONTEXT/ROADMAP) |
| Change **one job’s artifacts** | `jobs/DCO-…/` only; never rewrite `source/` immutably |
| Prove contract | fixtures POS/NEG/AMB (+ scripts); not silent YAML edits in delivered demo |

---

## When to stop and ask Rommy

Stop and ask (do not guess) if the task would:

1. **Enable Image API** or any paid image generation path.  
2. **Browser-automate** ChatGPT Images / reuse cookies / undocumented endpoints.  
3. **Auto-approve** or mark client `RELEASE_ELIGIBLE` / `DELIVERED` while critical FAIL or unresolved UNVERIFIABLE.  
4. **Spend money** (API keys required for MVP capability).  
5. **Edit `E:\Hermes` secrets/config** or couple DFI.  
6. **Implement Ideal V0.2-R1 skill** without Rommy approve + ChatGPT handoff / explicit implement instruction.
7. **Start a new client/pitch job** (e.g. bunk-bed / PPH real assets) without operator go.  
8. **Claim pitch-ready** while POS/NEG/AMB contract fixtures are missing.  
9. **Conflict** with deny list in `AGENTS.md` / skill invariants.  
10. Touch **secrets** (`.env`, `auth.json`, tokens) or put them in chat/git.

Default when unsure: **read more docs → propose a short plan → wait**. Prefer reversible doc edits over irreversible runtime or release claims.

---

## Quick deny list (router)

No Image API · no browser auto · no auto client-release · no n8n/MCP/webhooks/DB/VPS in V0 core · no “Sol upgrade = geometry PASS”.
