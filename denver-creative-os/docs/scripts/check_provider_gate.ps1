# Assert DCO-0 PROVIDER_GATE.md contains both PASS markers (Windows-native).
$ErrorActionPreference = "Stop"
$Gate = Join-Path $PSScriptRoot "..\PROVIDER_GATE.md"
if (-not (Test-Path $Gate)) { Write-Error "FAIL: missing $Gate"; exit 1 }
$text = Get-Content -Raw $Gate
$missing = $false
foreach ($marker in @("TEXT_PING_PASS","VISION_SMOKE_PASS")) {
  if ($text -notmatch [regex]::Escape($marker)) {
    Write-Host "FAIL: missing marker $marker in $Gate"
    $missing = $true
  } else {
    Write-Host "OK: found $marker"
  }
}
if ($missing) { exit 1 }
Write-Host "PASS: provider gate markers present"
