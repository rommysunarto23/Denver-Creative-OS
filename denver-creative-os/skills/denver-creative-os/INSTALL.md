# Installing denver-creative-os into Hermes (optional)

Prefer project-local skill loading so this repo owns versioning and the pitch stays reproducible.

## Recommended: project trust

1. Open a shell with Hermes available (`docker exec -it hermes hermes` or host CLI).
2. From or against repo root `E:\rommy\Denver Creative OS\denver-creative-os\`, run the current trust/discover command (confirm with `hermes skills --help` for your installed version). Typical form: `hermes skills trust`.
3. Invoke by skill name: `denver-creative-os`.

## Optional: copy into E:\Hermes\skills\

Use only if project discovery is unavailable. **Do not wipe or replace existing bundled skills.**

```powershell
$src = "E:\rommy\Denver Creative OS\denver-creative-os\skills\denver-creative-os"
$dst = "E:\Hermes\skills\creative\denver-creative-os"

if (-not (Test-Path $src\SKILL.md)) { throw "Source skill missing: $src" }
# Safety: refuse if destination parent is missing (bundled tree should already exist)
if (-not (Test-Path "E:\Hermes\skills")) { throw "E:\Hermes\skills not found — aborting; will not create a blind skills root" }

New-Item -ItemType Directory -Force -Path (Split-Path $dst) | Out-Null
Copy-Item -Path $src -Destination $dst -Recurse -Force
Write-Host "Installed copy at $dst"
Write-Host "Bundled siblings under E:\Hermes\skills were not deleted."
```

Notes:

- Target folder name must match frontmatter `name: denver-creative-os`.
- Placing under `creative\` matches Hermes category layout; a flat `E:\Hermes\skills\denver-creative-os\` is also acceptable if your Hermes version expects flat skill dirs — check live help.
- Never `Remove-Item E:\Hermes\skills\*` or overwrite unrelated skill folders.
- Keep Hermes `SOUL.md` generic; all DCO procedure stays in this skill.
- After copy, re-check with `.\docs\scripts\check_skill_templates.ps1` from the repo (validates repo copy, not the Hermes install path).
