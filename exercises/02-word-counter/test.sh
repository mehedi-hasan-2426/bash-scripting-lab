#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"

pass=0
fail=0
tmp=$(mktemp)
trap 'rm -f "$tmp"' EXIT

printf 'hello world\nsecond line\n' > "$tmp"
actual=$(./solution.sh "$tmp")
expected=$'Lines: 2\nWords: 4\nChars: 24'

if [[ "$actual" == "$expected" ]]; then
  echo "PASS: counts a two-line file"
  pass=$((pass + 1))
else
  echo "FAIL: counts a two-line file" >&2
  echo "  expected: $expected" >&2
  echo "  actual:   $actual" >&2
  fail=$((fail + 1))
fi

if ./solution.sh /no/such/file >/dev/null 2>&1; then
  echo "FAIL: missing file should exit non-zero" >&2
  fail=$((fail + 1))
else
  echo "PASS: missing file exits non-zero"
  pass=$((pass + 1))
fi

echo "---"
echo "$pass passed, $fail failed"
[[ $fail -eq 0 ]]
