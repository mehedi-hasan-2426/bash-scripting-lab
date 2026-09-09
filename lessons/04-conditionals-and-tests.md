# 04: Conditionals and Tests

## `if` / `elif` / `else`

```sh
if [[ "$answer" == "yes" ]]; then
  echo "Proceeding"
elif [[ "$answer" == "no" ]]; then
  echo "Stopping"
else
  echo "Unrecognised answer: $answer" >&2
  exit 1
fi
```

## `[[ ... ]]` vs `[ ... ]`

`[[ ]]` is a bash keyword: it supports `&&`, `||`, pattern matching, and does not word-
split or glob-expand unquoted variables inside it. `[ ]` is the older, POSIX-portable
test command, stricter about quoting and without those conveniences. Prefer `[[ ]]` in
bash scripts unless you specifically need `/bin/sh` portability.

## Common test operators

| Test | Meaning |
| --- | --- |
| `-z "$s"` | string is empty |
| `-n "$s"` | string is non-empty |
| `"$a" == "$b"` | string equality |
| `-eq`, `-ne`, `-lt`, `-gt` | numeric comparisons |
| `-f path` | path exists and is a regular file |
| `-d path` | path exists and is a directory |
| `-x path` | path exists and is executable |

Numeric and string comparisons use different operators on purpose: `"$a" == "$b"`
compares text, `[[ $a -eq $b ]]` compares numbers, and `"10" == "10.0"` is false while
`10 -eq 10.0` would error, since `[[ ]]`'s numeric context does not parse decimals.

## Case statements

For matching one value against several patterns, `case` reads better than a chain of
`elif`:

```sh
case "$1" in
  start|up)   echo "starting" ;;
  stop|down)  echo "stopping" ;;
  *)          echo "unknown command: $1" >&2; exit 1 ;;
esac
```

## Try it

Write a script that takes a number as its only argument and prints whether it is
positive, negative, or zero, using `[[ ]]` numeric tests.
