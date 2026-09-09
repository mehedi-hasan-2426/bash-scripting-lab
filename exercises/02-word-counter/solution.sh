#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <file>" >&2
  exit 1
fi

file="$1"

if [[ ! -f "$file" ]]; then
  echo "file not found: $file" >&2
  exit 1
fi

lines=$(wc -l < "$file" | tr -d ' ')
words=$(wc -w < "$file" | tr -d ' ')
chars=$(wc -m < "$file" | tr -d ' ')

echo "Lines: $lines"
echo "Words: $words"
echo "Chars: $chars"
