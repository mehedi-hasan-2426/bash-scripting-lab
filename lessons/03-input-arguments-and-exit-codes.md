# 03: Input, Arguments, and Exit Codes

## Positional parameters

```sh
#!/usr/bin/env bash
echo "Script name: $0"
echo "First arg:   $1"
echo "All args:    $*"
echo "Arg count:   $#"
```

Run it as `./script.sh alpha beta` and trace through each line to see how the shell
fills in `$1`, `$2`, `$*` and `$#`.

## Reading input interactively

```sh
read -rp "What is your name? " name
echo "Hello, $name"
```

`-r` disables backslash escaping in the input (almost always what you want), `-p` shows
a prompt without needing a separate `echo`.

## Validating arguments before using them

A script that touches files or runs commands based on user input should check its
inputs first and fail loudly and early:

```sh
if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <name>" >&2
  exit 1
fi
```

Printing usage errors to `>&2` (stderr) instead of stdout keeps error messages separate
from real output, which matters the moment someone pipes your script's output into
another command.

## Exit codes as your script's public API

Anything that calls your script only reliably sees two things: what it printed and
its exit code. Reserve `0` for success, and pick distinct non-zero codes for distinct
failure reasons if the caller might need to branch on them:

```sh
[[ -f "$1" ]] || { echo "file not found: $1" >&2; exit 2; }
```

## Try it

Write a script that requires exactly one argument, prints a usage message and exits
`1` if it's missing, and otherwise greets the caller by that name.
