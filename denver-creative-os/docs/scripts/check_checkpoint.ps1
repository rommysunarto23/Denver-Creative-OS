# check_checkpoint.ps1 — DCO-4 unit assert
$ErrorActionPreference = "Stop"
# scripts/ -> docs/ -> repo root
$repo = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent
$cp = Join-Path $repo "docs\CURRENT_CHECKPOINT.md"
$stub = Join-Path $repo "docs\PITCH_PREP_STUB.md"
$job = Join-Path $repo "jobs\DCO-20260930-001"
$fail = 0

function Assert-True([bool]$cond, [string]$msg) {
  if (-not $cond) { Write-Host "FAIL: $msg"; $script:fail++ } else { Write-Host "PASS: $msg" }
}

Assert-True (Test-Path -LiteralPath $cp) "CURRENT_CHECKPOINT.md exists"
Assert-True (Test-Path -LiteralPath $stub) "PITCH_PREP_STUB.md exists"
$cpText = Get-Content -LiteralPath $cp -Raw
Assert-True ($cpText -match "MVP_READY_FOR_PITCH_PREPARATION") "magic string present"
Assert-True ($cpText -match "DCO-20260930-001") "demo job id linked"
$stubText = Get-Content -LiteralPath $stub -Raw
Assert-True ($stubText -match "(?i)defer") "pitch stub defers deck"

foreach ($p in @(
  "delivery\shot-01-angled.png",
  "delivery\shot-02-straight.png",
  "delivery\shot-03-medium-close.png",
  "delivery\DELIVERY_MANIFEST.yaml"
)) {
  Assert-True (Test-Path -LiteralPath (Join-Path $job $p)) "delivery path $p"
}

if ($fail -gt 0) { Write-Host "RESULT: FAIL ($fail)"; exit 1 }
Write-Host "RESULT: PASS"
exit 0
