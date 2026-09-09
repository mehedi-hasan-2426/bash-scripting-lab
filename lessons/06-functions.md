# 06: Functions

## Defining and calling

```sh
greet() {
  local name="$1"
  echo "Hello, $name"
}

greet "Ada"
```

`local` scopes `name` to the function. Without it, `name` would leak into the global
shell environment and could clash with a variable of the same name elsewhere in the
script, a common source of bugs as scripts grow.

## Returning data

Bash functions don't return values the way most languages do. They have an exit code
(`return N`, 0-255, meant for success/failure) and can produce output on stdout, which
the caller captures with command substitution:

```sh
add() {
  echo $(( $1 + $2 ))
}

result=$(add 2 3)
echo "Result: $result"
```

Mixing the two purposes is a common mistake: don't try to `return` a computed number
larger than 255 or a string. Use `echo` and capture it, and reserve `return`/`exit`
codes strictly for success/failure signalling.

## Checking success

```sh
if greet "Ada"; then
  echo "greet succeeded"
fi
```

A function's exit status is the exit status of the last command it ran, unless it
calls `return` explicitly.

## Try it

Write a function `is_even` that takes one integer argument and returns exit code `0`
if it's even, `1` otherwise (no output needed). Call it from an `if` to confirm it
works both ways.
