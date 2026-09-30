#!/usr/bin/env bash
# Assert DCO-0 PROVIDER_GATE.md contains both PASS markers.
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GATE="${SCRIPT_DIR}/../PROVIDER_GATE.md"
if [[ ! -f "$GATE" ]]; then
  echo "FAIL: missing $GATE" >&2
  exit 1
fi
missing=0
for marker in TEXT_PING_PASS VISION_SMOKE_PASS; do
  if ! grep -qF "$marker" "$GATE"; then
    echo "FAIL: missing marker $marker in $GATE" >&2
    missing=1
  else
    echo "OK: found $marker"
  fi
done
if [[ "$missing" -ne 0 ]]; then
  exit 1
fi
echo "PASS: provider gate markers present"