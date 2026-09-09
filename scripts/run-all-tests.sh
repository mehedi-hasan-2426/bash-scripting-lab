#!/usr/bin/env bash
# Runs every exercise's test.sh and reports a combined pass/fail summary.
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
exercises_dir="${root}/exercises"

overall_status=0

for test_script in "$exercises_dir"/*/test.sh; do
  [[ -e "$test_script" ]] || continue
  exercise="$(basename "$(dirname "$test_script")")"
  echo "== ${exercise} =="
  if ! bash "$test_script"; then
    overall_status=1
  fi
  echo
done

exit "$overall_status"
