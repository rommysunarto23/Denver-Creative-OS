# ROADMAP.md - Denver Creative OS

**Updated:** 2026-09-30 ~20:10 Asia/Makassar (UTC+8)
**Authority:** Rommy. Agents propose; they do not silently advance phases.

---

## ID ringkas

| Fase | Status |
|------|--------|
| **V0** | **Done** - orchestrate + demo DELIVERED (honest geometry gap; historical manual Images) |
| **V0.2-R1** | **SUPERSEDED / HISTORICAL** - do not implement R1 PATCH map |
| **V0.2-R2-Lite** | **FREEZE APPROVED** (`V02_R2_LITE.md`) — **Codex HOLD** until FINAL R2-lite coding handoff after ChatGPT authority audit |
| **Next implement** | R2-lite implementation → E2E (A/B/C + 9/9) → `DCO_PROJECT_READY_FOR_PITCH` |
| **V0.1** | Identity lock **proof** (NOVEL_VIEW path) - after/with contract layer |
| **Later** | Portal / email-WA / Image API key (only if operator opts in) |

---

## V0 - Done (orchestration MVP) — historical baseline

**Goal:** Prove workflow value in one day without Image API key spend.

Delivered:

- Hermes + Codex OAuth text/vision gate.
- Project skill `denver-creative-os` (INTAKE→…→PACKAGE).
- Demo job `DCO-20260930-001` → 3 packaged shots, incremental Image API-key spend US$0.
- Human ChatGPT Images checkpoint respected (**historical gen path**; superseded by R2-lite native openai-codex).
- Model lock: `gpt-6.1-sol` / medium.

Known non-goals completed-as-denied: no n8n/MCP/DB/VPS/browser auto/auto-approve.

**Honest remainder from V0:** SHOT-02 geometry_drift + release-contract contradiction (see `GROUNDING.md`, `CHATGPT_AUDIT_NOTES.md`).

---

## V0.2-R2-Lite - Current phase (FREEZE APPROVED; Codex HOLD)

**Canonical architecture:** `denver-creative-os/docs/architecture/V02_R2_LITE.md` — **FREEZE APPROVED**. Do not redesign.

**Status:** Architecture accepted; **docs authority cleanup** in progress → **ChatGPT authority audit** of cleanup SHA → then **FINAL R2-lite Codex coding handoff** → then Codex implement.

**Codex HOLD:** Do **not** implement skill/plugin/code until that FINAL R2-lite handoff exists. Do **not** execute R1 PATCH-1..15.

### Phase sequence (current)

```text
1. Docs authority clean (this commit)
2. ChatGPT authority audit of cleanup SHA
3. FINAL R2-lite Codex coding handoff (not yet — HOLD)
4. R2-lite implementation (skills/plugins/fixtures per handoff)
5. E2E Modes A / B / C + POS/NEG/AMB × 3 (9/9) on Sol Medium
6. Only then: DCO_PROJECT_READY_FOR_PITCH (checkpoint magic update)
```

### Contract / product gates (required before pitch)

- Evidence-aware triad + human-only client release (R2-lite laws).
- Hermes native `openai-codex` image generation/edit; billing `CHATGPT_CODEX_OAUTH`; incremental Image API-key spend **US$0**; subscription **UNKNOWN**.
- Mode A/B/C E2E proven; fixtures **9/9**.
- Override / experiment accept cannot become client `RELEASE_ELIGIBLE` / `DELIVERED` on FAIL or unresolved UNVERIFIABLE.
- Still: no paid Images API key as required dep, no browser auto, no auto client-release.

### Historical R1 note

Ideal V0.2 (`SYNTHESIS.md`) and V0.2-R1 (`V02_R1.md`, `FINAL_CODEX_HANDOFF_DCO_V02_R1.md`) remain as **audit history**. They are **not** the active implementation path.

---

## V0.1 - Identity lock proof (generation EV)

**Status:** Design concepts carried into R2-lite for NOVEL_VIEW / insufficient-evidence paths; **proof trial not run**.

Intent (historical SYNTHESIS / COMPARE; now under R2-lite authority):

1. One **SOURCE_PRESERVE** composite trial on the oak cutout (or successor sample).  
2. One **NOVEL_VIEW** path with honest `NEEDS_EVIDENCE` when evidence is insufficient.  
3. Lineage in manifest.  
4. Only then harden skill mode branches if trials warrant.

Do **not** treat Sol High / prompt-only as primary geometry fix (falsified).

---

## Later - portal / Image API key / distribution

Only after R2-lite E2E honesty and (as needed) V0.1 lock proof:

| Item | Note |
|------|------|
| Client portal / upload UX | Not V0; pitch hypothesis only |
| Email / WhatsApp delivery | Operator-later; not Hermes auto |
| **Image API key** | **Later-phase flag** if Codex OAuth path still fails closed and operator opts in |
| Multi-agent / n8n / MCP | Still deferred until single-agent proven insufficient |
| Real PPH / agency pilots | Needs owned/licensed assets + Rommy go |

---

## Explicit non-roadmap (still denied in near term)

- Browser automation of ChatGPT Images.  
- Auto client-release / auto-approve.  
- "Model swap alone fixes SHOT-02."  
- DFI secrets in git.  
- Production-ready / pitch-ready claims before Mode A/B/C + 9/9.  
- Executing SUPERSEDED R1 PATCH map.  
- Redesigning frozen `V02_R2_LITE.md`.

---

## Suggested next actions (human-gated)

1. **This commit:** reconcile docs authority chain to R2-lite (pointers/banners only).  
2. ChatGPT **authority audit** of the cleanup SHA.  
3. Produce **FINAL R2-lite Codex coding handoff** (file-by-file) — **not yet**.  
4. Codex **implement** R2-lite per that handoff (explicit GO only).  
5. Run Mode A/B/C E2E + fixture verification (9/9); update checkpoint only if pitch gate met → `DCO_PROJECT_READY_FOR_PITCH`.  
6. Pitch proof pack (`PITCH_PREP_STUB.md`) only with honest experiment vs client-release language.

---

## See also

- `AGENTS.md` - DoD for the R2-lite patch (HOLD until handoff)
- `routing.md` - where to read  
- `CONTEXT.md` - current facts  
- `denver-creative-os/docs/architecture/V02_R2_LITE.md` - **CANONICAL**
