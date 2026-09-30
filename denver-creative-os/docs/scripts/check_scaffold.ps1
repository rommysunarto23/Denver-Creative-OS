# Assert DCO-1 scaffold required paths exist (Windows-native).
$ErrorActionPreference = "Stop"
$RepoRoot = Resolve-Path (Join-Path $PSScriptRoot "..\..")
$ParentRoot = Resolve-Path (Join-Path $RepoRoot "..")
$fail = $false

function Assert-Path([string]$Rel, [string]$Kind = "any") {
  $full = Join-Path $RepoRoot $Rel
  $ok = Test-Path $full
  if ($ok -and $Kind -eq "dir") { $ok = (Get-Item $full).PSIsContainer }
  if ($ok -and $Kind -eq "file") { $ok = -not (Get-Item $full).PSIsContainer }
  if ($ok) {
    Write-Host "OK: $Rel"
  } else {
    Write-Host "FAIL: missing $Kind path $Rel (expected under $RepoRoot)"
    $script:fail = $true
  }
}

function Assert-ParentFile([string]$Name) {
  $full = Join-Path $ParentRoot $Name
  if (Test-Path $full -PathType Leaf) {
    Write-Host "OK: parent $Name"
  } else {
    Write-Host "FAIL: parent PRD missing $full"
    $script:fail = $true
  }
}

Write-Host "RepoRoot=$RepoRoot"
Write-Host "ParentRoot=$ParentRoot"

Assert-Path "README.md" "file"
Assert-Path ".gitignore" "file"
Assert-Path "docs" "dir"
Assert-Path "docs\PROVIDER_GATE.md" "file"
Assert-Path "docs\PRD_DENVER_CREATIVE_OS.md" "file"
Assert-Path "docs\DENVER_CREATIVE_OS_ARCHITECTURE_AND_REPO_BLUEPRINT.md" "file"
Assert-Path "docs\DENVER_CREATIVE_OS_DOCS_README.md" "file"
Assert-Path "docs\scripts\check_scaffold.ps1" "file"
Assert-Path "jobs" "dir"
Assert-Path "samples\fictional-furniture" "dir"
Assert-Path "skills\denver-creative-os" "dir"

Assert-ParentFile "PRD_DENVER_CREATIVE_OS.md"
Assert-ParentFile "DENVER_CREATIVE_OS_ARCHITECTURE_AND_REPO_BLUEPRINT.md"
Assert-ParentFile "DENVER_CREATIVE_OS_DOCS_README.md"

# README content gates (Immediate Goal + Image API deny)
$readme = Get-Content -Raw (Join-Path $RepoRoot "README.md")
foreach ($marker in @("Immediate Goal", "Image API", "n8n", "MCP", "cron", "browser")) {
  if ($readme -notmatch [regex]::Escape($marker)) {
    Write-Host "FAIL: README missing marker: $marker"
    $fail = $true
  } else {
    Write-Host "OK: README has $marker"
  }
}

# .gitignore must list .env and auth.json
$gi = Get-Content -Raw (Join-Path $RepoRoot ".gitignore")
foreach ($pat in @(".env", "auth.json", "Thumbs.db", ".DS_Store", ".hermes-local")) {
  if ($gi -notmatch [regex]::Escape($pat)) {
    Write-Host "FAIL: .gitignore missing pattern: $pat"
    $fail = $true
  } else {
    Write-Host "OK: .gitignore has $pat"
  }
}

# No n8n or MCP folders in scaffold
foreach ($bad in @("n8n", "MCP", "mcp")) {
  $hit = Get-ChildItem -Path $RepoRoot -Recurse -Force -Directory -ErrorAction SilentlyContinue |
    Where-Object { $_.Name -eq $bad }
  if ($hit) {
    Write-Host "FAIL: forbidden folder present: $($hit.FullName -join ', ')"
    $fail = $true
  } else {
    Write-Host "OK: no $bad folder"
  }
}

# Path prefix check
$prefix = "E:\rommy\Denver Creative OS"
if (-not ($RepoRoot.Path.StartsWith($prefix, [System.StringComparison]::OrdinalIgnoreCase))) {
  Write-Host "FAIL: RepoRoot not under $prefix (got $($RepoRoot.Path))"
  $fail = $true
} else {
  Write-Host "OK: path prefix $prefix"
}

# DCO-2/3/4 must not appear yet
foreach ($early in @(
  "skills\denver-creative-os\SKILL.md",
  "docs\CURRENT_CHECKPOINT.md"
)) {
  if (Test-Path (Join-Path $RepoRoot $early)) {
    Write-Host "FAIL: out-of-scope for DCO-1 present: $early"
    $fail = $true
  } else {
    Write-Host "OK: DCO-1 boundary clear ($early absent)"
  }
}

if ($fail) {
  Write-Host "FAIL: scaffold check"
  exit 1
}
Write-Host "PASS: scaffold required paths present"
exit 0
