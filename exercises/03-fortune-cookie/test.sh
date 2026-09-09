#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"

pass=0
fail=0

first=$(./solution.sh --seed 42)
second=$(./solution.sh --seed 42)

if [[ "$first" == "$second" ]] && [[ -n "$first" ]]; then
  echo "PASS: same seed picks the same quote"
  pass=$((pass + 1))
else
  echo "FAIL: same seed picks the same quote" >&2
  fail=$((fail + 1))
fi

if grep -qxF "$first" quotes.txt; then
  echo "PASS: output is one of the known quotes"
  pass=$((pass + 1))
else
  echo "FAIL: output is one of the known quotes" >&2
  fail=$((fail + 1))
fi

echo "---"
echo "$pass passed, $fail failed"
[[ $fail -eq 0 ]]
