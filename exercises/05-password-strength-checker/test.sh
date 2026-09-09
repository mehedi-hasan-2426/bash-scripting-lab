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
    echo "FAIL: $desc (expected '$expected', got '$actual')" >&2
    fail=$((fail + 1))
  fi
}

check "short lowercase-only password is weak" "Weak" "$(./solution.sh hunter2)"
check "mixed case, digits and symbol is strong" "Strong" "$(./solution.sh 'C0rrect-Horse')"
check "long password with a digit is moderate" "Moderate" "$(./solution.sh abcdefgh1)"

echo "---"
echo "$pass passed, $fail failed"
[[ $fail -eq 0 ]]
