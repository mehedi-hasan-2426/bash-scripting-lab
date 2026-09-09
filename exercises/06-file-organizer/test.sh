#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"

pass=0
fail=0
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

touch "$tmp/report.pdf" "$tmp/photo.jpg" "$tmp/notes"

dry_run=$(./solution.sh "$tmp")

if [[ -f "$tmp/report.pdf" ]] && echo "$dry_run" | grep -qF "report.pdf -> pdf/report.pdf"; then
  echo "PASS: dry run reports moves without touching files"
  pass=$((pass + 1))
else
  echo "FAIL: dry run reports moves without touching files" >&2
  fail=$((fail + 1))
fi

./solution.sh "$tmp" --apply >/dev/null

if [[ -f "$tmp/pdf/report.pdf" ]] && [[ -f "$tmp/jpg/photo.jpg" ]] && [[ -f "$tmp/no-extension/notes" ]]; then
  echo "PASS: --apply actually organises the files"
  pass=$((pass + 1))
else
  echo "FAIL: --apply actually organises the files" >&2
  fail=$((fail + 1))
fi

if ./solution.sh /no/such/dir >/dev/null 2>&1; then
  echo "FAIL: missing directory should exit non-zero" >&2
  fail=$((fail + 1))
else
  echo "PASS: missing directory exits non-zero"
  pass=$((pass + 1))
fi

echo "---"
echo "$pass passed, $fail failed"
[[ $fail -eq 0 ]]
