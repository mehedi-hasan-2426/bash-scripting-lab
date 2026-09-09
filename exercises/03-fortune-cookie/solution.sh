#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"

quotes_file="quotes.txt"

if [[ ! -s "$quotes_file" ]]; then
  echo "no quotes found in $quotes_file" >&2
  exit 1
fi

mapfile -t quotes <"$quotes_file"
count=${#quotes[@]}

if [[ "${1:-}" == "--seed" ]]; then
  seed="${2:-0}"
  RANDOM="$seed"
fi

index=$((RANDOM % count))
echo "${quotes[$index]}"
