#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"

pass=0
fail=0

check() {
  local desc="$1" expected="$2" actual="$3"
  if [[ "$actual" == "$expected" ]]; then
    echo "PASS: $desc"
    pass=$((pass + 1))
  else
    echo "FAIL: $desc" >&2
    echo "  expected: $expected" >&2
    echo "  actual:   $actual" >&2
    fail=$((fail + 1))
  fi
}

check "plain greeting" "Hello, Ada!" "$(./solution.sh Ada)"
check "with occasion" "Happy birthday, Ada!" "$(./solution.sh Ada birthday)"

if ./solution.sh >/dev/null 2>&1; then
  echo "FAIL: missing name should exit non-zero" >&2
  fail=$((fail + 1))
else
  echo "PASS: missing name exits non-zero"
  pass=$((pass + 1))
fi

echo "---"
echo "$pass passed, $fail failed"
[[ $fail -eq 0 ]]
