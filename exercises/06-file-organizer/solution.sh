#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <directory> [--apply]" >&2
  exit 1
fi

dir="$1"
apply="${2:-}"

if [[ ! -d "$dir" ]]; then
  echo "directory not found: $dir" >&2
  exit 1
fi

shopt -s nullglob
for file in "$dir"/*; do
  [[ -f "$file" ]] || continue

  base="$(basename "$file")"
  if [[ "$base" == *.* && "$base" != .* ]]; then
    ext="${base##*.}"
  else
    ext="no-extension"
  fi

  echo "${base} -> ${ext}/${base}"

  if [[ "$apply" == "--apply" ]]; then
    mkdir -p "${dir}/${ext}"
    mv -- "$file" "${dir}/${ext}/${base}"
  fi
done
