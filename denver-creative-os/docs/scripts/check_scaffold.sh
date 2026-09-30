#!/usr/bin/env bash
# Assert DCO-1 scaffold required paths exist.
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
PARENT_ROOT="$(cd "${REPO_ROOT}/.." && pwd)"
fail=0

ok() { echo "OK: $*"; }
bad() { echo "FAIL: $*" >&2; fail=1; }

assert_file() {
  local rel="$1"
  if [[ -f "${REPO_ROOT}/${rel}" ]]; then ok "$rel"; else bad "missing file $rel"; fi
}
assert_dir() {
  local rel="$1"
  if [[ -d "${REPO_ROOT}/${rel}" ]]; then ok "$rel"; else bad "missing dir $rel"; fi
}
assert_parent() {
  local name="$1"
  if [[ -f "${PARENT_ROOT}/${name}" ]]; then ok "parent $name"; else bad "parent PRD missing $name"; fi
}

echo "REPO_ROOT=${REPO_ROOT}"
echo "PARENT_ROOT=${PARENT_ROOT}"

assert_file "README.md"
assert_file ".gitignore"
assert_dir "docs"
assert_file "docs/PROVIDER_GATE.md"
assert_file "docs/PRD_DENVER_CREATIVE_OS.md"
assert_file "docs/DENVER_CREATIVE_OS_ARCHITECTURE_AND_REPO_BLUEPRINT.md"
assert_file "docs/DENVER_CREATIVE_OS_DOCS_README.md"
assert_file "docs/scripts/check_scaffold.ps1"
assert_dir "jobs"
assert_dir "samples/fictional-furniture"
assert_dir "skills/denver-creative-os"

assert_parent "PRD_DENVER_CREATIVE_OS.md"
assert_parent "DENVER_CREATIVE_OS_ARCHITECTURE_AND_REPO_BLUEPRINT.md"
assert_parent "DENVER_CREATIVE_OS_DOCS_README.md"

readme="$(cat "${REPO_ROOT}/README.md")"
for marker in "Immediate Goal" "Image API" "n8n" "MCP" "cron" "browser"; do
  if grep -qF "$marker" <<<"$readme"; then ok "README has $marker"; else bad "README missing marker: $marker"; fi
done

gi="$(cat "${REPO_ROOT}/.gitignore")"
for pat in ".env" "auth.json" "Thumbs.db" ".DS_Store" ".hermes-local"; do
  if grep -qF "$pat" <<<"$gi"; then ok ".gitignore has $pat"; else bad ".gitignore missing pattern: $pat"; fi
done

for badname in n8n MCP mcp; do
  if find "${REPO_ROOT}" -type d -name "$badname" 2>/dev/null | grep -q .; then
    bad "forbidden folder present: $badname"
  else
    ok "no $badname folder"
  fi
done

case "${REPO_ROOT}" in
  /e/rommy/Denver\ Creative\ OS/*|E:/rommy/Denver\ Creative\ OS/*|E:\\rommy\\Denver\ Creative\ OS\\*)
    ok "path under Denver Creative OS"
    ;;
  *)
    # Also accept Windows path via cygpath-less bash if REPO_ROOT still contains the prefix
    if [[ "${REPO_ROOT}" == *"Denver Creative OS"* ]]; then
      ok "path under Denver Creative OS"
    else
      bad "RepoRoot not under Denver Creative OS (got ${REPO_ROOT})"
    fi
    ;;
esac

for early in "skills/denver-creative-os/SKILL.md" "docs/CURRENT_CHECKPOINT.md"; do
  if [[ -e "${REPO_ROOT}/${early}" ]]; then bad "out-of-scope for DCO-1 present: $early"; else ok "DCO-1 boundary clear ($early absent)"; fi
done

if [[ "$fail" -ne 0 ]]; then
  echo "FAIL: scaffold check" >&2
  exit 1
fi
echo "PASS: scaffold required paths present"
