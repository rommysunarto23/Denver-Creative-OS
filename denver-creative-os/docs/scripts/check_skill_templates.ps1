# Assert DCO-2 skill templates, references, frontmatter, denies, and fixture required keys.
$ErrorActionPreference = "Stop"
$RepoRoot = Resolve-Path (Join-Path $PSScriptRoot "..\..")
$SkillRoot = Join-Path $RepoRoot "skills\denver-creative-os"
$fail = $false

function Ok([string]$Msg) { Write-Host "OK: $Msg" }
function Fail([string]$Msg) { Write-Host "FAIL: $Msg"; $script:fail = $true }

function Assert-File([string]$Rel) {
  $full = Join-Path $RepoRoot $Rel
  if (Test-Path $full -PathType Leaf) { Ok $Rel } else { Fail "missing file $Rel" }
}

function Assert-KeysInText([string]$Label, [string]$Text, [string[]]$Keys) {
  foreach ($k in $Keys) {
    if ($Text -notmatch [regex]::Escape($k)) {
      Fail "$Label missing required key/marker: $k"
    } else {
      Ok "$Label has $k"
    }
  }
}

Write-Host "RepoRoot=$RepoRoot"
Write-Host "SkillRoot=$SkillRoot"

# --- Required paths ---
Assert-File "skills\denver-creative-os\SKILL.md"
Assert-File "skills\denver-creative-os\INSTALL.md"
Assert-File "skills\denver-creative-os\templates\PRODUCT_BRIEF.yaml"
Assert-File "skills\denver-creative-os\templates\SHOT_PLAN.yaml"
Assert-File "skills\denver-creative-os\templates\QA_REPORT.yaml"
Assert-File "skills\denver-creative-os\templates\DELIVERY_MANIFEST.yaml"
Assert-File "skills\denver-creative-os\references\PRODUCT_FIDELITY_RULES.md"
Assert-File "skills\denver-creative-os\references\VISUAL_QA_RULES.md"
Assert-File "skills\denver-creative-os\fixtures\product-brief.yaml"
Assert-File "skills\denver-creative-os\fixtures\shot-plan.yaml"
Assert-File "skills\denver-creative-os\fixtures\qa-report.yaml"
Assert-File "skills\denver-creative-os\fixtures\delivery-manifest.yaml"
Assert-File "docs\scripts\check_skill_templates.ps1"

# --- SKILL.md frontmatter + procedure + denies ---
$skill = Get-Content -Raw (Join-Path $SkillRoot "SKILL.md")

if ($skill -match '(?m)^name:\s*denver-creative-os\s*$') {
  Ok "SKILL.md frontmatter name=denver-creative-os"
} else {
  Fail "SKILL.md frontmatter name must be denver-creative-os"
}

Assert-KeysInText "SKILL.md commands" $skill @(
  "INTAKE", "PLAN", "PROMPT", "PAUSE", "QA", "REVISE", "APPROVE", "PACKAGE"
)

Assert-KeysInText "SKILL.md shot ids" $skill @(
  "SHOT-01-ANGLED", "SHOT-02-STRAIGHT", "SHOT-03-MEDIUM-CLOSE"
)

Assert-KeysInText "SKILL.md states" $skill @(
  "AWAITING_GENERATION", "BRIEF_APPROVED", "PACKAGED"
)

# Deny list: Image API, browser automation, auto-approve
foreach ($deny in @(
  @{ Name = "Image API deny"; Pattern = "Image API" },
  @{ Name = "browser automation deny"; Pattern = "browser automation" },
  @{ Name = "auto-approve forbid"; Pattern = "auto-approve" }
)) {
  if ($skill -match [regex]::Escape($deny.Pattern)) {
    Ok $deny.Name
  } else {
    Fail "SKILL.md missing $($deny.Name) (expected text containing '$($deny.Pattern)')"
  }
}

# REVISE gate language
if ($skill -match "REVISE requires" -or $skill -match "Prior QA") {
  Ok "REVISE requires prior QA fail gate"
} else {
  Fail "SKILL.md must state REVISE requires prior QA fail"
}

# Human-only APPROVE
if ($skill -match "Human-only" -or $skill -match "human-only") {
  Ok "APPROVE human-only language"
} else {
  Fail "SKILL.md must state APPROVE is human-only"
}

# --- Template required keys ---
$briefTpl = Get-Content -Raw (Join-Path $SkillRoot "templates\PRODUCT_BRIEF.yaml")
Assert-KeysInText "PRODUCT_BRIEF.yaml" $briefTpl @(
  "job_id", "product_class", "known_facts", "must_preserve", "flexible_styling",
  "unknowns", "target_audience", "desired_visual_world", "source_path"
)

$planTpl = Get-Content -Raw (Join-Path $SkillRoot "templates\SHOT_PLAN.yaml")
Assert-KeysInText "SHOT_PLAN.yaml" $planTpl @(
  "job_id", "shots", "shot_id", "SHOT-01-ANGLED", "SHOT-02-STRAIGHT", "SHOT-03-MEDIUM-CLOSE",
  "camera_framing", "purpose", "must_show", "constraints"
)

$qaTpl = Get-Content -Raw (Join-Path $SkillRoot "templates\QA_REPORT.yaml")
Assert-KeysInText "QA_REPORT.yaml" $qaTpl @(
  "candidate_id", "shot_id", "prompt_version", "source_fidelity", "geometry",
  "blocking_violations", "decision", "revision_instruction", "human_decision",
  "material_color", "shot_compliance"
)

$manTpl = Get-Content -Raw (Join-Path $SkillRoot "templates\DELIVERY_MANIFEST.yaml")
Assert-KeysInText "DELIVERY_MANIFEST.yaml" $manTpl @(
  "job_id", "product_label", "delivery_timestamp", "generation_method",
  "incremental_image_api_spend_usd", "approved_assets", "shot_id", "file",
  "prompt_version", "qa", "known_limitations",
  "SHOT-01-ANGLED", "SHOT-02-STRAIGHT", "SHOT-03-MEDIUM-CLOSE",
  "MANUAL_CHATGPT_IMAGES"
)

# --- Fixture YAML set (unit verify) ---
$briefFix = Get-Content -Raw (Join-Path $SkillRoot "fixtures\product-brief.yaml")
Assert-KeysInText "fixture product-brief" $briefFix @(
  "job_id", "product_class", "known_facts", "must_preserve", "flexible_styling",
  "unknowns", "target_audience", "desired_visual_world"
)

$planFix = Get-Content -Raw (Join-Path $SkillRoot "fixtures\shot-plan.yaml")
Assert-KeysInText "fixture shot-plan" $planFix @(
  "SHOT-01-ANGLED", "SHOT-02-STRAIGHT", "SHOT-03-MEDIUM-CLOSE", "camera_framing", "purpose"
)

$qaFix = Get-Content -Raw (Join-Path $SkillRoot "fixtures\qa-report.yaml")
Assert-KeysInText "fixture qa-report" $qaFix @(
  "source_fidelity", "geometry", "blocking_violations", "decision", "human_decision"
)

$manFix = Get-Content -Raw (Join-Path $SkillRoot "fixtures\delivery-manifest.yaml")
Assert-KeysInText "fixture delivery-manifest" $manFix @(
  "approved_assets", "incremental_image_api_spend_usd", "SHOT-01-ANGLED",
  "SHOT-02-STRAIGHT", "SHOT-03-MEDIUM-CLOSE", "qa: APPROVED"
)

# --- References exist with fidelity language ---
$fid = Get-Content -Raw (Join-Path $SkillRoot "references\PRODUCT_FIDELITY_RULES.md")
Assert-KeysInText "PRODUCT_FIDELITY_RULES.md" $fid @("must_preserve", "BLOCK", "REVISE")

$vqa = Get-Content -Raw (Join-Path $SkillRoot "references\VISUAL_QA_RULES.md")
Assert-KeysInText "VISUAL_QA_RULES.md" $vqa @("source_fidelity", "geometry", "human_decision", "PASS", "WARN", "BLOCK")

if ($fail) {
  Write-Host "FAIL: skill template check"
  exit 1
}
Write-Host "PASS: skill templates, fixtures, and SKILL.md contract OK"
exit 0
