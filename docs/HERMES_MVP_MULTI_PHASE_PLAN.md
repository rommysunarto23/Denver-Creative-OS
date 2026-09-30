# Denver Creative OS Hermes MVP plan

Hermes runs a file-job creative loop for one furniture demo so Rommy can pitch remote AI visual production. The rule is V0 skill plus folders only. No Image API, no browser automation, no cron. PR ids in order are DCO-0, DCO-1, DCO-2, DCO-3, DCO-4.

## How to read this

One box is one unit of work. Every box names the evidence that checks it. A nested box is a sub-step of the box above it. Check a box only when its evidence exists, a file, a log line, a screenshot, a test run, or a SHA. The body is a how-to. The appendices explain and record.

The program runs `pstack/skills/poteto-mode/playbooks/autopilot-stack.md`. The operator lands the stack after each PR is merge-ready. DCO-3 is review-gated.

Tests alone are not sufficient verification. A PR is verified only when its unit, live, and perf boxes are all checked.

## Program checklist

### Arm the program

- [ ] State the protocol and this plan to the operator, then stop. Start execution only on the operator's explicit go.
- [ ] On the operator's go, arm a `/goal` with this exact text. "Run `E:\rommy\Denver Creative OS\docs\HERMES_MVP_MULTI_PHASE_PLAN.md`. PR order DCO-0 then DCO-1 then DCO-2 then DCO-3 then DCO-4. Tests alone are not sufficient verification. A PR is verified only when its unit, live, and perf boxes are all checked. Operator lands each merge-ready PR. Done when `docs/CURRENT_CHECKPOINT.md` records MVP_READY_FOR_PITCH_PREPARATION with a walkable 3-shot delivery folder."
- [ ] Read these from trunk at program start. Re-read them at every tick.
  - [ ] `git show origin/main:pstack/skills/poteto-mode/playbooks/autopilot-stack.md`
  - [ ] `git show origin/main:pstack/skills/swarm/SKILL.md`
  - [ ] `git show origin/main:pstack/skills/cli-for-agents/SKILL.md`
  - [ ] `git show origin/main:pstack/skills/poteto-mode/playbooks/opening-a-pr.md`
  - [ ] `git show origin/main:pstack/skills/principle-prove-it-works/SKILL.md`
- [ ] Arm the 30-minute audit tick. In a local session, a real terminal `/loop`. In a cloud root, a cloud-sleeper wake chain. Never leave the cadence to memory.
- [ ] Use this tick prompt, verbatim. "Re-read the execution playbook from trunk and the armed /goal. Audit the operation against both and fix drift in this tick. Probe every active lane and judge progress by side effects only. Stand down a stuck lane and dispatch its replacement now. Then post a short status message to the operator in chat only when the audit found a tracked change that no earlier status message reported, such as a PR opened, a code-ready head, a round launched or closed, a verdict, a merge, a stuck agent and the action taken, a blocker added or cleared, or a decision only the operator can make. Name every such change and nothing else. Do not repeat a table, the merged list, or an unchanged blocker. If the audit found none, end the turn with no reply text. Either way, log this tick's row in your decision trail. The row names the items reported, or none."
- [ ] On the operator's hold or stand-down, send every owner a zero-writes order at once.

### Spawn owners

- [ ] Spawn one owner per PR with the full lifecycle the execution playbook names.
- [ ] Follow this dependency graph. Start dependent work only after its parent merges, or base it on the parent branch when the execution playbook stacks.
  - [ ] DCO-0 is first. Branch from `main`.
  - [ ] DCO-1 after DCO-0.
  - [ ] DCO-2 after DCO-1.
  - [ ] DCO-3 after DCO-2.
  - [ ] DCO-4 after DCO-3.
- [ ] Hold the file boundaries. DCO-0 touches only Hermes smoke notes under `docs/`. DCO-1 touches only `denver-creative-os/` scaffold. DCO-2 touches only `skills/denver-creative-os/`. DCO-3 touches only `jobs/` and `samples/`. DCO-4 touches only checkpoint and pitch-prep stub docs.
- [ ] Hold the review gate. DCO-3 changes the operator-visible delivery loop. It waits for the operator's review in chat with screenshots and a video before merge.

### PR mechanics, for every PR

- [ ] Resolve the forge once. Default to `gh`; if `command -v origin` succeeds and Origin can resolve the repository, use `origin pr` for every PR operation. Record any fallback to `gh`. Never require `gt`.
- [ ] Open the PR ready, never draft, with `origin pr create --status open --base <base-branch>` or `gh pr create --base <base-branch>` according to the resolved forge. A stack child targets its parent branch.
- [ ] Run the repo's lint and typecheck once before the PR-facing push. Push with hooks on.
- [ ] Run `/deslop` before each commit and `/no-comments` before review.
- [ ] Triage every Bugbot and security-reviewer comment per `../references/bugbot-triage.md`.
- [ ] Rebase onto current trunk before the code-ready report and babysit. Keep that merge base in fix rounds. Rebase again only at merge prep, on a `git merge-tree` conflict with trunk, or on a CI failure that comes from a change on trunk.

### Verdict and merge, for every PR

- [ ] At the code-ready head SHA and at each later push that changes the patch, run the swarm per `pstack/skills/swarm/SKILL.md`. One gates lane. The ten live lanes from the PR's **Verify, live** block. The perf lane from its **Verify, perf** block. Two or more audit lanes, each with its own focus, that read the diff and the receipts and distrust the PR body. The root audits the receipts in the merge-ready report before the verdict.
- [ ] Clean only when every lane is `PASS`. Findings go back to the owner, including a defect that a lane filed as a note. A new head gets a fresh swarm and a fresh verdict, except for results that stay valid under the patch-id rule in `playbooks/shipping.md`.
- [ ] The root appends each clean PR to the base-branch stack. The operator lands the stack bottom-up. Patch-id rules from `playbooks/shipping.md` apply.

### Boot recipe, for every live lane

Each live lane runs on its own cloud VM at the PR head. Drive through `control-cli` from `cursor-team-kit` against Hermes CLI and the job folder tree.

- [ ] `git fetch origin <head-branch> && git checkout <head SHA>`.
- [ ] Confirm Docker `hermes` is Up and `E:\Hermes` is mounted. Wait for `http://127.0.0.1:8642` health if the API server is enabled.
- [ ] Deliver input only through Hermes CLI and file writes named in the lane. Read-only diagnostics are `docker logs --tail 50 hermes` and folder listings.
- [ ] Save every screenshot to `/tmp/swarm-<pr-id>/worker-<n>/<slug>.png` and return the paths with the report.

## Prove Hermes provider gate (DCO-0)

**Depends on.** None.

**Files.**

- [ ] Create `denver-creative-os/docs/PROVIDER_GATE.md`.
- [ ] Edit nothing under `E:\Hermes\.env`.

**Build.**

- [ ] Record one text completion and one vision smoke via Hermes with `openai-codex`, paths and timestamps only in `PROVIDER_GATE.md`.

**You see.**

- [ ] `PROVIDER_GATE.md` contains PASS lines for text and vision with timestamps.

**Verify, unit.** Tests alone are not sufficient verification. A PR is verified only when its unit, live, and perf boxes are all checked.

- [ ] A shell script under `denver-creative-os/docs/scripts/check_provider_gate.sh` asserts both PASS markers exist. Run that script.

**Verify, live.** Tests alone are not sufficient verification. A PR is verified only when its unit, live, and perf boxes are all checked. Ten lanes on `grok-4.7-xhigh-fast` at the PR head, per the boot recipe.

- [ ] Lane 1. Regression lane against trunk. Trunk lacks the feature. Gate that Hermes answers a one-line ping after DCO-0. Save `dco0-ping.png`. Pass when the reply is non-empty.
- [ ] Lane 2. `docker ps` shows `hermes` Up. Save `dco0-docker.png`. Pass when status contains Up.
- [ ] Lane 3. `E:\Hermes\config.yaml` shows provider `openai-codex`. Save `dco0-config.png`. Pass when the string is present.
- [ ] Lane 4. Vision smoke on a public sample image path named in the gate doc. Save `dco0-vision.png`. Pass when QA text returns.
- [ ] Lane 5. No paid Image API call is configured in the gate doc. Save `dco0-no-image-api.png`. Pass when the deny line is present.
- [ ] Lane 6. Gateway state file shows running. Save `dco0-gateway.png`. Pass when state is running.
- [ ] Lane 7. Disk for job data remains on E. Save `dco0-disk.png`. Pass when `E:\Hermes` listing succeeds.
- [ ] Lane 8. Memory limit still 2g on container inspect. Save `dco0-mem.png`. Pass when Memory is 2147483648.
- [ ] Lane 9. Operator can cancel without writing secrets to chat. Save `dco0-secrets.png`. Pass when gate doc has no token values.
- [ ] Lane 10. Re-run text ping after container restart. Save `dco0-restart.png`. Pass when ping still works.

**Verify, perf.** Tests alone are not sufficient verification. A PR is verified only when its unit, live, and perf boxes are all checked.

- [ ] Metric. Wall time for one Hermes text ping at trunk (N/A) and at head, plus absolute budget for the ping.
- [ ] Probe. Time one `docker exec hermes hermes chat -q "ping"` style call at head. Interleave two runs.
- [ ] Baseline. Record trunk as feature-absent. Record head ping p50.
- [ ] Rule. Head ping p50 must stay under 60 seconds on this laptop. Fail if either probe exceeds 60 seconds.

**Review gate.** None. DCO-0 is not review-gated.

**Merge.**

- [ ] Root's clean verdict at the exact head SHA.
- [ ] Bugbot triage done.
- [ ] Rebased onto current trunk after the verdict, patch-id unchanged.
- [ ] Root appends to the stack. Operator lands bottom-up.

## Scaffold the denver-creative-os repo (DCO-1)

**Depends on.** DCO-0.

**Files.**

- [ ] Create `denver-creative-os/README.md`.
- [ ] Create `denver-creative-os/.gitignore`.
- [ ] Create `denver-creative-os/docs/` pointers to the three source PRD files.
- [ ] Create empty `jobs/`, `samples/fictional-furniture/`, `skills/denver-creative-os/` stubs.

**Build.**

- [ ] Match Architecture blueprint § repo layout under `E:\rommy\Denver Creative OS\denver-creative-os\` without moving the three existing PRD files out of the parent folder.

**You see.**

- [ ] `tree` or `Get-ChildItem -Recurse` shows the stub folders and README.

**Verify, unit.** Tests alone are not sufficient verification. A PR is verified only when its unit, live, and perf boxes are all checked.

- [ ] Script `docs/scripts/check_scaffold.sh` asserts required paths exist. Run it.

**Verify, live.** Tests alone are not sufficient verification. A PR is verified only when its unit, live, and perf boxes are all checked. Ten lanes on `grok-4.7-xhigh-fast` at the PR head, per the boot recipe.

- [ ] Lane 1. Regression lane against trunk. Trunk lacks scaffold. Gate that README opens and names Immediate Goal. Save `dco1-readme.png`. Pass when Immediate Goal text is present.
- [ ] Lane 2. `skills/denver-creative-os/` exists. Save `dco1-skills-dir.png`. Pass when directory exists.
- [ ] Lane 3. `jobs/` exists. Save `dco1-jobs.png`. Pass when directory exists.
- [ ] Lane 4. `samples/fictional-furniture/` exists. Save `dco1-samples.png`. Pass when directory exists.
- [ ] Lane 5. Parent PRD files still at `E:\rommy\Denver Creative OS\*.md`. Save `dco1-prd.png`. Pass when three docs remain.
- [ ] Lane 6. `.gitignore` ignores Hermes secrets and OS junk. Save `dco1-gitignore.png`. Pass when `.env` pattern is listed.
- [ ] Lane 7. No n8n or MCP folders added. Save `dco1-no-n8n.png`. Pass when those names are absent.
- [ ] Lane 8. README deny list matches V0. Save `dco1-deny.png`. Pass when Image API deny is named.
- [ ] Lane 9. Path stays on E drive. Save `dco1-e.png`. Pass when path prefix is `E:\rommy\Denver Creative OS`.
- [ ] Lane 10. Git init optional only if operator asked. Save `dco1-git.png`. Pass when either git exists with clean status or the plan notes skip with reason.

**Verify, perf.** Tests alone are not sufficient verification. A PR is verified only when its unit, live, and perf boxes are all checked.

- [ ] Metric. Time to list the scaffold tree at head. Trunk lacks feature so use absolute budget only.
- [ ] Probe. `Get-ChildItem -Recurse` timed twice at head.
- [ ] Baseline. Trunk feature-absent.
- [ ] Rule. Listing under 5 seconds. Fail if either probe exceeds 5 seconds.

**Review gate.** None. DCO-1 is not review-gated.

**Merge.**

- [ ] Root's clean verdict at the exact head SHA.
- [ ] Bugbot triage done.
- [ ] Rebased onto current trunk after the verdict, patch-id unchanged.
- [ ] Root appends to the stack. Operator lands bottom-up.

## Ship the denver-creative-os skill (DCO-2)

**Depends on.** DCO-1.

**Files.**

- [ ] Create `skills/denver-creative-os/SKILL.md`.
- [ ] Create templates `PRODUCT_BRIEF.yaml`, `SHOT_PLAN.yaml`, `QA_REPORT.yaml`, `DELIVERY_MANIFEST.yaml`.
- [ ] Create references `PRODUCT_FIDELITY_RULES.md` and `VISUAL_QA_RULES.md`.

**Build.**

- [ ] Encode commands INTAKE, PLAN, PROMPT, PAUSE, QA, REVISE, APPROVE, PACKAGE as explicit skill steps with job folder contracts from the Architecture blueprint.

**You see.**

- [ ] Hermes can load the skill name `denver-creative-os` from the project path or an install copy under `E:\Hermes\skills\` if the install step is documented.

**Verify, unit.** Tests alone are not sufficient verification. A PR is verified only when its unit, live, and perf boxes are all checked.

- [ ] A fixture YAML set validates required keys for brief, plan, qa, and manifest. Run the validator script.

**Verify, live.** Tests alone are not sufficient verification. A PR is verified only when its unit, live, and perf boxes are all checked. Ten lanes on `grok-4.7-xhigh-fast` at the PR head, per the boot recipe.

- [ ] Lane 1. Regression lane against trunk. Trunk lacks skill. Gate that SKILL.md frontmatter name is `denver-creative-os`. Save `dco2-frontmatter.png`. Pass when name matches.
- [ ] Lane 2. INTAKE step writes `brief/product-brief.yaml` shape. Save `dco2-intake.png`. Pass when required keys exist on a dry-run fixture.
- [ ] Lane 3. PLAN emits SHOT-01, SHOT-02, SHOT-03 ids. Save `dco2-plan.png`. Pass when three ids exist.
- [ ] Lane 4. PROMPT writes three versioned prompt files. Save `dco2-prompt.png`. Pass when three files exist.
- [ ] Lane 5. PAUSE sets job state `AWAITING_GENERATION`. Save `dco2-pause.png`. Pass when state string matches.
- [ ] Lane 6. QA template includes fail-closed fidelity fields. Save `dco2-qa.png`. Pass when fidelity keys exist.
- [ ] Lane 7. REVISE requires prior QA fail. Save `dco2-revise.png`. Pass when skill text states the gate.
- [ ] Lane 8. APPROVE is human-only. Save `dco2-approve.png`. Pass when skill forbids auto-approve.
- [ ] Lane 9. PACKAGE writes delivery manifest. Save `dco2-package.png`. Pass when manifest template exists.
- [ ] Lane 10. Skill deny list blocks Image API and browser automation. Save `dco2-deny.png`. Pass when both denies appear.

**Verify, perf.** Tests alone are not sufficient verification. A PR is verified only when its unit, live, and perf boxes are all checked.

- [ ] Metric. Time to dry-run INTAKE+PLAN on the fixture at head.
- [ ] Probe. Run the dry-run script twice at head.
- [ ] Baseline. Trunk feature-absent.
- [ ] Rule. Each dry-run under 120 seconds. Fail if either exceeds 120 seconds.

**Review gate.** None. DCO-2 is not review-gated.

**Merge.**

- [ ] Root's clean verdict at the exact head SHA.
- [ ] Bugbot triage done.
- [ ] Rebased onto current trunk after the verdict, patch-id unchanged.
- [ ] Root appends to the stack. Operator lands bottom-up.

## Run one demo job end to end (DCO-3)

**Depends on.** DCO-2.

**Files.**

- [ ] Create `samples/fictional-furniture/` authorized demo asset.
- [ ] Create `jobs/DCO-YYYYMMDD-001/` full tree through delivery.
- [ ] Edit job.yaml lifecycle fields only inside that job folder.

**Build.**

- [ ] Drive one job through INTAKE to PACKAGE with human ChatGPT Images between PAUSE and QA, including at least one REVISE cycle.

**You see.**

- [ ] `delivery/` holds three finals plus `DELIVERY_MANIFEST.yaml`. Job state is `PACKAGED`.

**Verify, unit.** Tests alone are not sufficient verification. A PR is verified only when its unit, live, and perf boxes are all checked.

- [ ] Manifest schema test asserts three shot ids and file paths resolve. Run the test script.

**Verify, live.** Tests alone are not sufficient verification. A PR is verified only when its unit, live, and perf boxes are all checked. Ten lanes on `grok-4.7-xhigh-fast` at the PR head, per the boot recipe.

- [ ] Lane 1. Regression lane against trunk. Trunk lacks job. Gate that job folder exists with `job.yaml`. Save `dco3-job.png`. Pass when file exists.
- [ ] Lane 2. Brief approved before prompts. Save `dco3-brief.png`. Pass when state passed `BRIEF_APPROVED`.
- [ ] Lane 3. Three prompt files exist before pause. Save `dco3-prompts.png`. Pass when count is 3.
- [ ] Lane 4. Pause leaves `AWAITING_GENERATION` for human Images. Save `dco3-pause.png`. Pass when state matches.
- [ ] Lane 5. Candidates folder receives human drops. Save `dco3-cand.png`. Pass when each shot has a candidate.
- [ ] Lane 6. QA report exists per shot. Save `dco3-qa.png`. Pass when three QA files exist.
- [ ] Lane 7. At least one REVISE produced a newer prompt version. Save `dco3-revise.png`. Pass when a `v2` prompt exists.
- [ ] Lane 8. Human approval recorded. Save `dco3-approve.png`. Pass when approval note exists.
- [ ] Lane 9. Delivery package has three finals. Save `dco3-delivery.png`. Pass when three image files exist.
- [ ] Lane 10. Walk source to delivery without leaving the job folder. Save `dco3-walk.png`. Pass when checklist in job README is complete.

**Verify, perf.** Tests alone are not sufficient verification. A PR is verified only when its unit, live, and perf boxes are all checked.

- [ ] Metric. Operator wall time from INTAKE start to PACKAGED, excluding human Image wait, measured from job timestamps.
- [ ] Probe. Read timestamps in job.yaml and QA files at head. Trunk feature-absent.
- [ ] Baseline. Trunk feature-absent.
- [ ] Rule. Hermes-owned segments under 30 minutes total on this laptop. Fail if Hermes-owned time exceeds 30 minutes.

**Review gate.** The operator reviews before merge.

- [ ] Copy lane 9 and lane 10 screenshots into `docs/media/DCO-3-review-delivery.png` and `docs/media/DCO-3-review-walk.png`.
- [ ] Record a 30 to 60 second video of the folder walk on a lane VM. Save it as `docs/media/DCO-3-review.mp4`.
- [ ] Post the screenshots and the video in chat. Stop at merge-ready. Wait for the operator's click.

**Merge.**

- [ ] Root's clean verdict at the exact head SHA.
- [ ] Bugbot triage done.
- [ ] Rebased onto current trunk after the verdict, patch-id unchanged.
- [ ] Root appends to the stack. Operator lands bottom-up after review click.

## Freeze MVP checkpoint for pitch prep (DCO-4)

**Depends on.** DCO-3.

**Files.**

- [ ] Create `docs/CURRENT_CHECKPOINT.md`.
- [ ] Create `docs/PITCH_PREP_STUB.md` pointing to proof-pack steps only.

**Build.**

- [ ] Write checkpoint status `MVP_READY_FOR_PITCH_PREPARATION` with links to the demo job delivery paths. Do not build client decks in this PR.

**You see.**

- [ ] Checkpoint file states MVP_READY_FOR_PITCH_PREPARATION and names the demo job id.

**Verify, unit.** Tests alone are not sufficient verification. A PR is verified only when its unit, live, and perf boxes are all checked.

- [ ] Script asserts the checkpoint magic string and that delivery paths exist. Run it.

**Verify, live.** Tests alone are not sufficient verification. A PR is verified only when its unit, live, and perf boxes are all checked. Ten lanes on `grok-4.7-xhigh-fast` at the PR head, per the boot recipe.

- [ ] Lane 1. Regression lane against trunk. Trunk lacks checkpoint. Gate magic string present. Save `dco4-magic.png`. Pass when string matches.
- [ ] Lane 2. Demo job id is linked. Save `dco4-jobid.png`. Pass when id resolves.
- [ ] Lane 3. DoD items from DOCS_README are listed checked or N/A with reason. Save `dco4-dod.png`. Pass when all rows exist.
- [ ] Lane 4. Pitch stub defers deck work. Save `dco4-stub.png`. Pass when deferral is explicit.
- [ ] Lane 5. No cron job was added under `E:\Hermes\cron`. Save `dco4-nocron.png`. Pass when no DCO cron def exists.
- [ ] Lane 6. No webhook or n8n wiring. Save `dco4-nowebhook.png`. Pass when absent.
- [ ] Lane 7. Hermes SOUL.md left generic. Save `dco4-soul.png`. Pass when DCO rules live in skill not SOUL.
- [ ] Lane 8. Proof pack is next, not done. Save `dco4-next.png`. Pass when next step names proof pack.
- [ ] Lane 9. Secrets still not in git. Save `dco4-secrets.png`. Pass when `.gitignore` still covers `.env`.
- [ ] Lane 10. Operator can start pitch prep from checkpoint alone. Save `dco4-handoff.png`. Pass when handoff section lists inputs.

**Verify, perf.** Tests alone are not sufficient verification. A PR is verified only when its unit, live, and perf boxes are all checked.

- [ ] Metric. Time to open checkpoint and resolve one delivery path.
- [ ] Probe. Timed path resolve twice at head.
- [ ] Baseline. Trunk feature-absent.
- [ ] Rule. Each resolve under 2 seconds. Fail if either exceeds 2 seconds.

**Review gate.** None. DCO-4 is not review-gated.

**Merge.**

- [ ] Root's clean verdict at the exact head SHA.
- [ ] Bugbot triage done.
- [ ] Rebased onto current trunk after the verdict, patch-id unchanged.
- [ ] Root appends to the stack. Operator lands bottom-up.

## Close the program

- [ ] Every box above is checked with its evidence.
- [ ] Reply to the operator with the report the execution playbook names.

## Appendix A. Prototype evidence

No prototype branch was run this session. Open questions left unproven. Exact Hermes skill install path into `E:\Hermes\skills` versus project-local load. Whether `hermes chat` versus gateway API is the operator's daily surface. Default for both is project skill plus `docker exec -it hermes hermes` CLI until a prototype proves otherwise.

## Appendix B. Alternatives rejected

Cron or gateway automation for V0. Rejected because all three DCO docs put that out of scope. Full client pitch deck inside this program. Rejected because README places pitch after MVP_READY. Local LLM. Rejected because operator chose OpenAI OAuth and the laptop RAM budget is tight. Moving transactional DFI n8n into this workflow. Rejected because DCO is a separate Creative OS root.

## Appendix C. Risks

Windows bind mount plus SQLite already set to delete journal on Hermes. Watch DCO-0 restarts. Hermes `model.default` string may not match the Codex catalog. Watch DCO-0 vision smoke. Human Image wait can stall DCO-3. Owner must document pause instructions clearly. Accidental secret commit. DCO-1 gitignore and DCO-4 lane 9 watch this.

## Appendix D. Links and reading list

Read `E:\rommy\Denver Creative OS\DENVER_CREATIVE_OS_DOCS_README.md`, `PRD_DENVER_CREATIVE_OS.md`, and `DENVER_CREATIVE_OS_ARCHITECTURE_AND_REPO_BLUEPRINT.md` before every PR. Run `pstack/skills/how/SKILL.md` before DCO-2 if skill load behavior is unclear. Run `pstack/skills/interrogate/SKILL.md` on DCO-3 before review. Keep a local decision trail per `pstack/skills/show-me-your-work/SKILL.md` during execution.
