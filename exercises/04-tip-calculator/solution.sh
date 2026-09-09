#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 2 ]]; then
  echo "Usage: $0 <bill> <tip_percent> [people]" >&2
  exit 1
fi

bill="$1"
tip_percent="$2"
people="${3:-1}"

awk -v bill="$bill" -v pct="$tip_percent" -v people="$people" 'BEGIN {
  tip = bill * (pct / 100)
  total = bill + tip
  per_person = total / people
  printf "Tip: %.2f\n", tip
  printf "Total: %.2f\n", total
  printf "Per person: %.2f\n", per_person
}'
