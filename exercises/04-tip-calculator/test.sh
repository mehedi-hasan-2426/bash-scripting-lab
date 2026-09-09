#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"

pass=0
fail=0

actual=$(./solution.sh 84.50 18 3)
expected=$'Tip: 15.21\nTotal: 99.71\nPer person: 33.24'

if [[ "$actual" == "$expected" ]]; then
  echo "PASS: splits a bill three ways"
  pass=$((pass + 1))
else
  echo "FAIL: splits a bill three ways" >&2
  echo "  expected: $expected" >&2
  echo "  actual:   $actual" >&2
  fail=$((fail + 1))
fi

actual_single=$(./solution.sh 50 10)
expected_single=$'Tip: 5.00\nTotal: 55.00\nPer person: 55.00'

if [[ "$actual_single" == "$expected_single" ]]; then
  echo "PASS: defaults to one person"
  pass=$((pass + 1))
else
  echo "FAIL: defaults to one person" >&2
  echo "  expected: $expected_single" >&2
  echo "  actual:   $actual_single" >&2
  fail=$((fail + 1))
fi

echo "---"
echo "$pass passed, $fail failed"
[[ $fail -eq 0 ]]
