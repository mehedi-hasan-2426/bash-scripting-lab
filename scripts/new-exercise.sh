#!/usr/bin/env bash
# Scaffold a new numbered exercise folder with README.md, solution.sh and test.sh stubs.
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <exercise-name>" >&2
  echo "Example: $0 palindrome-checker" >&2
  exit 1
fi

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
exercises_dir="${root}/exercises"

last_num=$(find "$exercises_dir" -maxdepth 1 -mindepth 1 -type d -printf '%f\n' 2>/dev/null \
  | grep -oE '^[0-9]+' | sort -n | tail -1)
next_num=$(printf '%02d' "$(( ${last_num:-0} + 1 ))")

slug="$1"
target="${exercises_dir}/${next_num}-${slug}"

if [[ -e "$target" ]]; then
  echo "already exists: $target" >&2
  exit 1
fi

mkdir -p "$target"

cat > "${target}/README.md" <<EOF
# Exercise ${next_num}: ${slug//-/ }

Describe the exercise here: what the script takes as input, what it must print, and
any edge cases it needs to handle.

## Example

\`\`\`sh
\$ ./solution.sh
\`\`\`
EOF

cat > "${target}/solution.sh" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

echo "TODO: implement me"
EOF

cat > "${target}/test.sh" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"

pass=0
fail=0

# TODO: add checks, following the pattern used in the other exercises.

echo "---"
echo "$pass passed, $fail failed"
[[ $fail -eq 0 ]]
EOF

chmod +x "${target}/solution.sh" "${target}/test.sh"

echo "created ${target}"
