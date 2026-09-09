# Exercise 05: Password Strength Checker

Write a script `solution.sh` that rates a password's strength based on simple, explicit
rules. There are no external tools, no network calls, and it never prints the password back to
you (only the rating), which matters for anything handling secrets.

## Requirements

- `$1` is the password to check.
- Award one point each for: length >= 8, contains a digit, contains a lowercase
  letter, contains an uppercase letter, contains a symbol (anything not a letter or
  digit).
- Print a rating based on the point total:
  - 0-2 points: `Weak`
  - 3-4 points: `Moderate`
  - 5 points: `Strong`
- If no argument is given, print a usage message to stderr and exit `1`.
- Never echo the password itself back to the terminal.

## Example

```sh
$ ./solution.sh 'hunter2'
Weak

$ ./solution.sh 'C0rrect-Horse-Battery'
Strong
```

## What this exercise practices

Pattern matching with `[[ $s == *pattern* ]]` and regex tests (`=~`), arithmetic
accumulation, and being deliberate about what a script does and doesn't print. See
[lesson 04](../../lessons/04-conditionals-and-tests.md).
