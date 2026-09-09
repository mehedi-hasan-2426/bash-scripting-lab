# 05: Loops

## `for` over a list

```sh
for lang in bash python go; do
  echo "Hello from $lang"
done
```

## `for` over files, safely

```sh
for file in ./data/*.csv; do
  [[ -e "$file" ]] || continue   # handles the case where no file matches the glob
  echo "Processing $file"
done
```

The `[[ -e "$file" ]] || continue` guard matters: if no file matches `*.csv`, bash
leaves the literal glob pattern in `$file` by default, and the loop body would run
once with that garbage value unless you check for it.

## `while` and reading line by line

```sh
while IFS= read -r line; do
  echo "Line: $line"
done < input.txt
```

`IFS=` prevents leading/trailing whitespace from being trimmed, and `-r` stops
backslashes in the file from being interpreted as escapes. This is the standard,
safe idiom for reading a file line by line in bash. Prefer it over parsing the
output of `cat file | while read line`, which runs the loop in a subshell and loses
any variables it sets once the pipeline ends.

## `until`

```sh
count=0
until [[ $count -ge 3 ]]; do
  echo "count is $count"
  ((count++))
done
```

`until` is `while` with the condition inverted: loop while the condition is false.

## Try it

Write a script that reads a text file passed as `$1` line by line and prints each
line prefixed with its line number.
