#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <password>" >&2
  exit 1
fi

password="$1"
score=0

[[ ${#password} -ge 8 ]] && score=$((score + 1))
[[ "$password" =~ [0-9] ]] && score=$((score + 1))
[[ "$password" =~ [a-z] ]] && score=$((score + 1))
[[ "$password" =~ [A-Z] ]] && score=$((score + 1))
[[ "$password" =~ [^a-zA-Z0-9] ]] && score=$((score + 1))

if [[ $score -le 2 ]]; then
  echo "Weak"
elif [[ $score -le 4 ]]; then
  echo "Moderate"
else
  echo "Strong"
fi
