# 09: Error Handling and Safe Scripting

## The safety net: `set -euo pipefail`

```sh
#!/usr/bin/env bash
set -euo pipefail
```

- `-e`: exit immediately if any command fails (careful: a few constructs suppress
  this, like commands inside `if`/`while` conditions, which is correct and expected)
- `-u`: treat unset variables as an error instead of silently expanding to empty
- `-o pipefail`: a pipeline fails if *any* stage fails, not just the last one

Without `pipefail`, `grep foo missing.txt | sort` "succeeds" (exit 0) because `sort`
succeeded, even though `grep` failed to find the file. That's the kind of bug this
line exists to catch.

## Cleaning up with `trap`

```sh
tmpfile=$(mktemp)
trap 'rm -f "$tmpfile"' EXIT

echo "data" > "$tmpfile"
# ... use $tmpfile ...
```

The trap runs whether the script exits normally, hits an error under `set -e`, or is
interrupted with Ctrl-C, so temporary files don't pile up when something goes wrong.

## Failing loudly

```sh
if ! curl -fsS "$url" -o "$dest"; then
  echo "download failed: $url" >&2
  exit 1
fi
```

`-f` makes curl exit non-zero on HTTP errors instead of silently saving an error page
as if it were the file.

## ShellCheck

Run [ShellCheck](https://www.shellcheck.net/) on every script. It catches unquoted
variables, unreachable code, common quoting mistakes, and dozens of other issues before
they become 2am production incidents. This repository runs it in CI on every change.

## Try it

Take any script from an earlier lesson and add `set -euo pipefail` plus a `trap` that
cleans up a temp file. Then run it through ShellCheck and fix whatever it flags.
