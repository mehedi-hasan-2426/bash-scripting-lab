#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 2 || $# -gt 3 ]]; then
  echo "Usage: $0 <bill> <tip_percent> [people]" >&2
  exit 1
fi

bill="$1"
tip_percent="$2"
people="${3-1}"

if [[ ! "$bill" =~ ^[0-9]+([.][0-9]+)?$ || ! "$tip_percent" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
  echo "bill and tip percentage must be non-negative decimal numbers" >&2
  exit 1
fi

if [[ ! "$people" =~ ^[0-9]+$ || "$people" != *[1-9]* ]]; then
  echo "people must be a positive whole number" >&2
  exit 1
fi

awk -v bill="$bill" -v pct="$tip_percent" -v people="$people" 'BEGIN {
  tip = bill * (pct / 100)
  total = bill + tip
  per_person = total / people
  printf "Tip: %.2f\n", tip
  printf "Total: %.2f\n", total
  printf "Per person: %.2f\n", per_person
}'
