#!/usr/bin/env bash
# check_checkpoint.sh — DCO-4 unit assert
set -euo pipefail
# scripts/ -> docs/ -> repo root
REPO="$(cd "$(dirname "$0")/../.." && pwd)"
CP="$REPO/docs/CURRENT_CHECKPOINT.md"
STUB="$REPO/docs/PITCH_PREP_STUB.md"
JOB="$REPO/jobs/DCO-20260930-001"
fail=0
pass() { echo "PASS: $1"; }
failm() { echo "FAIL: $1"; fail=$((fail+1)); }
[[ -f "$CP" ]] && pass "CURRENT_CHECKPOINT.md exists" || failm "CURRENT_CHECKPOINT.md exists"
[[ -f "$STUB" ]] && pass "PITCH_PREP_STUB.md exists" || failm "PITCH_PREP_STUB.md exists"
grep -q "MVP_READY_FOR_PITCH_PREPARATION" "$CP" && pass "magic string present" || failm "magic string present"
grep -q "DCO-20260930-001" "$CP" && pass "demo job id linked" || failm "demo job id linked"
grep -qi "defer" "$STUB" && pass "pitch stub defers deck" || failm "pitch stub defers deck"
for p in delivery/shot-01-angled.png delivery/shot-02-straight.png delivery/shot-03-medium-close.png delivery/DELIVERY_MANIFEST.yaml; do
  [[ -f "$JOB/$p" ]] && pass "delivery path $p" || failm "delivery path $p"
done
if [[ "$fail" -gt 0 ]]; then echo "RESULT: FAIL ($fail)"; exit 1; fi
echo "RESULT: PASS"
