# Exercise 03: Fortune Cookie

Write a script `solution.sh` that picks one line at random from a list of quotes and
prints it.

## Requirements

- Quotes live in `quotes.txt`, one per line, shipped alongside `solution.sh`.
- Running `./solution.sh` with no arguments prints exactly one random quote.
- Running `./solution.sh --seed N` picks deterministically using `N` as a seed, so the
  same seed always prints the same quote (this is what makes the script testable).
- If `quotes.txt` is missing or empty, print an error to stderr and exit `1`.

## Example

```sh
$ ./solution.sh --seed 1
(prints whichever quote line 1's seed maps to)
```

## What this exercise practices

Reading a file into an array, `$RANDOM`, and designing a script so its "random"
behaviour is still testable. See [lesson 07](../../lessons/07-arrays-and-strings.md)
and [lesson 10](../../lessons/10-debugging-and-testing.md).
