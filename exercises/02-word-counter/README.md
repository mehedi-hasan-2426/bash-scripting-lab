# Exercise 02: Word Counter

Write a script `solution.sh` that takes a file path as its only argument and reports
line, word, and character counts, like a small, explicit reimplementation of `wc`.

## Requirements

- `$1` is a path to a text file.
- If the file doesn't exist, print an error to stderr and exit `1`.
- Print three lines, in this order and format:
  ```
  Lines: <n>
  Words: <n>
  Chars: <n>
  ```

## Example

```sh
$ printf 'hello world\nsecond line\n' > sample.txt
$ ./solution.sh sample.txt
Lines: 2
Words: 4
Chars: 24
```

## What this exercise practices

Reading files, `wc`-style text processing, and validating that a path exists before
using it. See [lesson 08](../../lessons/08-working-with-files-and-text.md).
