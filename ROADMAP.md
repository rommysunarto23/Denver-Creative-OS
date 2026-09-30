# ROADMAP.md — Denver Creative OS

**Updated:** 2026-09-30 ~17:36 Asia/Makassar (UTC+8)
**Authority:** Rommy. Agents propose; they do not silently advance phases.

---

## ID ringkas

| Fase | Status |
|------|--------|
| **V0** | **Done** — orchestrate + demo DELIVERED (honest geometry gap) |
| **V0.2 / V0.2-R1** | Ideal **V0.2-R1** in `V02_R1.md` pending Rommy approve; implement after approve + ChatGPT handoff + Codex |
| **V0.1** | Identity lock **proof** (NOVEL_VIEW path) — after/with contract layer |
| **Later** | Portal / email-WA / Image API (only if manual paths fail) |

---

## V0 — Done (orchestration MVP)

**Goal:** Prove workflow value in one day without Image API.

Delivered:

- Hermes + Codex OAuth text/vision gate.
- Project skill `denver-creative-os` (INTAKE→…→PACKAGE).
- Demo job `DCO-20260930-001` → 3 packaged shots, spend US$0.
- Human ChatGPT Images checkpoint respected.
- Model lock: `gpt-6.1-sol` / medium.

Known non-goals completed-as-denied: no n8n/MCP/DB/VPS/browser auto/auto-approve.

**Honest remainder from V0:** SHOT-02 geometry_drift + release-contract contradiction (see `GROUNDING.md`, `CHATGPT_AUDIT_NOTES.md`).

---

## V0.2 / V0.2-R1 - Fidelity contract reopen (next implement)

**Status:** Ideal V0.2 dual-layer designed in `SYNTHESIS.md`; **Ideal V0.2-R1** (6 deltas) in `V02_R1.md` **recommended** over V0.2 as-is.
**Pending:** Rommy **approve V0.2-R1** + ChatGPT **Codex coding handoff** + **Codex implement** (skill/templates/fixtures/composite helper).
**This docs commit does not implement the skill patch.** Codex must wait.

### Contract layer (required)

- Evidence-aware triad: `evidence` → `verdict` (PASS/FAIL/UNVERIFIABLE) → `release` (ELIGIBLE/BLOCKED/NEEDS_EVIDENCE).
- `view_support`: SUPPORTED / PARTIAL / NOVEL_VIEW.
- Split `product_truth` vs `generation_guardrails`.
- Split `presentation_quality` vs `product_fidelity` / release.
- **No client-release override**; `EXPERIMENT_ACCEPTED` ≠ client-releasable.
- Close demo contradiction: BLOCK + human approve must not become client `DELIVERED`/`RELEASE_ELIGIBLE`.

### R1 hardenings (required before implement)

- Generation lock = `DERIVED_RENDER` / stabilizer — **not** ground truth; cannot alone promote UNVERIFIABLE->PASS.
- SOURCE_PRESERVE = **deterministic cutout raster composite** (product pixels owned by source; scene by generative).
- `SHOT_FEASIBILITY_GATE` before generate; NOVEL_VIEW+INSUFFICIENT -> NEEDS_EVIDENCE.
- Multidimensional release (`shot_compliance`, `evidence_sufficiency`, ...).
- Fixtures **9/9** (POS/NEG/AMB x 3 Sol Medium); hard checkpoint return gate (see `V02_R1.md` Delta 6).

### Generation layer (paired, not instead-of)

- Primary production mode: **`SOURCE_PRESERVE`**.
- Secondary: **`NOVEL_VIEW_GENERATIVE`** with optional **generation lock / ``DERIVED_RENDER``** (see V0.1 / V0.2-R1 Delta 1).

### Exit criteria

- POS / NEG / AMB x3 (9/9) fixtures pass on Sol Medium; SOURCE_PRESERVE E2E; override impossible; NOVEL_VIEW insufficient -> NEEDS_EVIDENCE.
- Checkpoint text updated honestly only after R1 return gate (9/9 + SOURCE_PRESERVE E2E + override impossible + NEEDS_EVIDENCE path + Image API $0).
- Still: no Image API, no browser auto, no auto client-release.

---

## V0.1 — Identity lock proof (generation EV)

**Status:** Design adopted as Ideal V0.2-R1 addon for NOVEL_VIEW with lock=`DERIVED_RENDER` (not ground truth); **proof trial not run**.

Intent (from SYNTHESIS / COMPARE):

1. One **SOURCE_PRESERVE** composite trial on the oak cutout (or successor sample).  
2. One **NOVEL_VIEW** lock → proportion gate → lifestyle **edit/relight** trial (SHOT-02-class).  
3. Lineage `source → lock_id → shot` in manifest.  
4. Only then harden skill IdentityFirst / mode branches if trials warrant.

Do **not** force lock on every SOURCE_PRESERVE shot.  
Do **not** treat Sol High / prompt-only as primary geometry fix (falsified).

---

## Later — portal / Image API / distribution

Only after V0.2 contract honesty and (as needed) V0.1 lock proof:

| Item | Note |
|------|------|
| Client portal / upload UX | Not V0; pitch hypothesis only |
| Email / WhatsApp delivery | Operator-later; not Hermes auto |
| **Image API** | **Later-phase flag** if manual SOURCE_PRESERVE / lock-edit still fail closed |
| Multi-agent / n8n / MCP | Still deferred until single-agent proven insufficient |
| Real PPH / agency pilots | Needs owned/licensed assets + Rommy go |

---

## Explicit non-roadmap (still denied in near term)

- Browser automation of ChatGPT Images.  
- Auto client-release / auto-approve.  
- “Model swap alone fixes SHOT-02.”  
- DFI secrets in git.  
- Production-ready claims before POS/NEG/AMB.

---

## Suggested next actions (human-gated)

1. Rommy **approve Ideal V0.2-R1** (`V02_R1.md`).
2. ChatGPT produces **Codex coding handoff** (file-by-file).
3. Codex **implement** V0.2-R1 skill + templates + POS/NEG/AMB x3 fixtures + SOURCE_PRESERVE composite helper (explicit task only).
4. Run fixture verification; update checkpoint only if R1 return gate met.
5. Optional: V0.1 lock/edit proof jobs (still manual Images; lock = stabilizer not ground truth).
6. Pitch proof pack (`PITCH_PREP_STUB.md`) only with honest experiment vs client-release language.

---

## See also

- `AGENTS.md` - DoD for the V0.2-R1 patch
- `routing.md` — where to read  
- `CONTEXT.md` — current facts  
- `denver-creative-os/docs/architecture/V02_R1.md` - Ideal V0.2-R1; `SYNTHESIS.md` - V0.2 base



