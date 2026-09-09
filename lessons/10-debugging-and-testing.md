# 10: Debugging and Testing

## `set -x`

```sh
set -x   # turn on
...
set +x   # turn off
```

Prints every command and its expanded arguments to stderr before running it. It's the
fastest way to see what a script actually did versus what you assumed it did.

```sh
bash -x ./script.sh    # trace the whole script without editing it
```

## Syntax-checking without running

```sh
bash -n ./script.sh
```

Parses the script and reports syntax errors without executing a single line, useful
as a fast pre-commit check.

## `PS4` for more useful trace output

```sh
export PS4='+ ${BASH_SOURCE}:${LINENO}: '
bash -x ./script.sh
```

By default `set -x` prefixes each traced line with a plain `+`. Customising `PS4` adds
the file and line number, which matters the moment a script is more than a screenful
long.

## Writing simple tests for a script

A script's contract is: given these arguments/stdin, produce this stdout and this exit
code. You can check that without a testing framework:

```sh
#!/usr/bin/env bash
set -euo pipefail

actual=$(./greet.sh "Ada")
expected="Hello, Ada"

if [[ "$actual" == "$expected" ]]; then
  echo "PASS"
else
  echo "FAIL: expected '$expected', got '$actual'" >&2
  exit 1
fi
```

Every exercise in this repository has a `test.sh` written exactly this way. Read a
few of them alongside their `solution.sh` to see the pattern in practice.

## Try it

Write a `test.sh` for a script from an earlier lesson that checks both a normal case
and one edge case (empty input, a negative number, a missing file, pick one).
