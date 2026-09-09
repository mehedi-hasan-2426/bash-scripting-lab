#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <name> [occasion]" >&2
  exit 1
fi

name="$1"
occasion="${2:-}"

if [[ -n "$occasion" ]]; then
  echo "Happy ${occasion}, ${name}!"
else
  echo "Hello, ${name}!"
fi
