# Exercise 01: Greeting Card

Write a script `solution.sh` that takes a name and an optional occasion, and prints a
short personalised greeting.

## Requirements

- `$1` is the recipient's name (required).
- `$2` is an occasion, e.g. `birthday`, `graduation` (optional).
- If no occasion is given, print: `Hello, <name>!`
- If an occasion is given, print: `Happy <occasion>, <name>!`
- If `$1` is missing, print a usage message to stderr and exit `1`.

## Example

```sh
$ ./solution.sh Ada
Hello, Ada!

$ ./solution.sh Ada birthday
Happy birthday, Ada!

$ ./solution.sh
Usage: ./solution.sh <name> [occasion]
```

## What this exercise practices

Positional arguments, optional arguments with a default, and basic input validation.
See [lesson 03](../../lessons/03-input-arguments-and-exit-codes.md).
