# 08: Working with Files and Text

## Redirection

```sh
command > out.txt      # stdout to file, overwrite
command >> out.txt     # stdout to file, append
command 2> err.txt     # stderr to file
command > all.txt 2>&1 # both stdout and stderr to the same file
```

Order matters in the last example: `2>&1` must come after the stdout redirect, so
stderr is pointed at wherever stdout was *just* redirected to.

## Pipes

```sh
grep "ERROR" app.log | sort | uniq -c | sort -rn
```

Each command in the pipeline runs concurrently, with the previous command's stdout
feeding the next command's stdin. This is the core Unix composition pattern: small
tools, combined, instead of one program that does everything.

## `grep`, `sed`, `awk`: a starter map

- `grep pattern file`: find lines matching a pattern
- `sed 's/old/new/g' file`: substitute text
- `awk '{print $1}' file`: pull out fields from structured text (default: whitespace-
  separated columns)

```sh
awk -F, '{print $2}' contacts.csv   # second comma-separated field of every line
```

## Here-documents

```sh
cat <<EOF
Multi-line text
with $variable expansion
EOF
```

Quote the delimiter (`<<'EOF'`) to disable expansion when you want the text literal.

## Try it

Given a log file with lines like `2026-09-09 ERROR disk full`, write a one-liner that
prints how many `ERROR` lines there are per date.
