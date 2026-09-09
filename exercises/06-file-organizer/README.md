# Exercise 06: File Organizer (Dry Run by Default)

Write a script `solution.sh` that reports how it *would* organise files in a directory
by extension, without touching anything unless explicitly told to.

## Requirements

- `$1`: directory to scan (required).
- By default (no `--apply` flag), print one line per file that *would* move, in the
  form `<file> -> <extension>/<file>`, and touch nothing on disk. This is the dry run
  and is the default specifically so the script is safe to run out of curiosity.
- With `--apply` as `$2`, actually create the extension subfolders and move the files.
- Files with no extension are reported as going to a folder named `no-extension`.
- Subdirectories that already exist under the scanned directory are left alone. Only
  top-level files are considered.
- If the directory doesn't exist, print an error to stderr and exit `1`.

## Example

```sh
$ ./solution.sh ./downloads
report.pdf -> pdf/report.pdf
photo.jpg -> jpg/photo.jpg
notes -> no-extension/notes

$ ./solution.sh ./downloads --apply
(same output, and the files are actually moved this time)
```

## What this exercise practices

Defaulting to the safe, non-destructive action and requiring an explicit flag to do
anything real. The same pattern is worth using any time a script can delete, move, or
overwrite something. See [lesson 09](../../lessons/09-error-handling-and-safe-scripting.md).
