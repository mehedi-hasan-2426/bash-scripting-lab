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

actual_zero=$(./solution.sh 0 0 1)
expected_zero=$'Tip: 0.00\nTotal: 0.00\nPer person: 0.00'

if [[ "$actual_zero" == "$expected_zero" ]]; then
  echo "PASS: accepts a zero bill and tip"
  pass=$((pass + 1))
else
  echo "FAIL: accepts a zero bill and tip" >&2
  fail=$((fail + 1))
fi

actual_decimal=$(./solution.sh 40.00 12.5 02)
expected_decimal=$'Tip: 5.00\nTotal: 45.00\nPer person: 22.50'

if [[ "$actual_decimal" == "$expected_decimal" ]]; then
  echo "PASS: accepts decimal percentages and leading-zero people"
  pass=$((pass + 1))
else
  echo "FAIL: accepts decimal percentages and leading-zero people" >&2
  fail=$((fail + 1))
fi

assert_invalid() {
  local description="$1"
  shift
  local actual error status=0
  actual=$(./solution.sh "$@" 2>/dev/null) || status=$?
  error=$(./solution.sh "$@" 2>&1 >/dev/null) || true

  if [[ $status -eq 1 && -z "$actual" && -n "$error" ]]; then
    echo "PASS: $description"
    pass=$((pass + 1))
  else
    echo "FAIL: $description (expected exit 1, stderr, and no stdout)" >&2
    fail=$((fail + 1))
  fi
}

assert_invalid "rejects missing arguments"
assert_invalid "rejects a missing percentage" 50
assert_invalid "rejects extra arguments" 50 10 2 extra
assert_invalid "rejects an empty bill" "" 10
assert_invalid "rejects a nonnumeric bill" invalid 10
assert_invalid "rejects a negative bill" -50 10
assert_invalid "rejects a partially numeric bill" 50oops 10
assert_invalid "rejects an empty percentage" 50 ""
assert_invalid "rejects a nonnumeric percentage" 50 invalid
assert_invalid "rejects a negative percentage" 50 -10
assert_invalid "rejects non-finite amounts" NaN 10
assert_invalid "rejects exponential notation" 1e2 10
assert_invalid "rejects whitespace in amounts" " 50" 10
assert_invalid "rejects zero people" 50 10 0
assert_invalid "rejects leading-zero zero people" 50 10 00
assert_invalid "rejects negative people" 50 10 -2
assert_invalid "rejects fractional people" 50 10 0.5
assert_invalid "rejects nonnumeric people" 50 10 invalid
assert_invalid "rejects explicitly empty people" 50 10 ""

echo "---"
echo "$pass passed, $fail failed"
[[ $fail -eq 0 ]]
