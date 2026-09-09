# Exercise 04: Tip Calculator

Write a script `solution.sh` that computes a tip and a per-person total for a bill.

## Requirements

- `$1`: bill amount (e.g. `84.50`)
- `$2`: tip percentage (e.g. `18`)
- `$3`: number of people to split between (optional, default `1`)
- Print:
  ```
  Tip: <amount>
  Total: <amount>
  Per person: <amount>
  ```
- All amounts are rounded to 2 decimal places.
- Bash has no floating point arithmetic built in, so this script uses `awk` for the
  math, a common, dependency-free way to do decimal arithmetic in a shell script.

## Example

```sh
$ ./solution.sh 84.50 18 3
Tip: 15.21
Total: 99.71
Per person: 33.24
```

## What this exercise practices

Working around bash's integer-only arithmetic, optional arguments with defaults, and
formatting numeric output. See [lesson 04](../../lessons/04-conditionals-and-tests.md).
