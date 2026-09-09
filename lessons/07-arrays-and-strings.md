# 07: Arrays and Strings

## Indexed arrays

```sh
fruits=("apple" "banana" "cherry")
echo "${fruits[0]}"        # apple
echo "${fruits[@]}"        # all elements, each as a separate word
echo "${#fruits[@]}"       # element count
fruits+=("date")           # append
```

Always quote `"${fruits[@]}"` when iterating, so elements containing spaces stay
intact:

```sh
for fruit in "${fruits[@]}"; do
  echo "Fruit: $fruit"
done
```

## Associative arrays

```sh
declare -A capitals
capitals[France]="Paris"
capitals[Japan]="Tokyo"

for country in "${!capitals[@]}"; do
  echo "$country -> ${capitals[$country]}"
done
```

`declare -A` is required before use: bash needs to know up front that it's an
associative (string-keyed) array rather than an indexed one.

## String manipulation with parameter expansion

```sh
path="/home/user/report.tar.gz"
echo "${path##*/}"     # report.tar.gz   - strip longest match of */ from the front
echo "${path%.gz}"     # /home/user/report.tar  - strip .gz from the end
echo "${path/user/dev}" # /home/dev/report.tar.gz - first-match replace
```

These four operators (`##`, `#`, `%%`, `%`) cover most path- and extension-handling
that would otherwise need `basename`/`dirname`/`sed`, and they run without spawning a
subprocess.

## Try it

Given an array of filenames, write a loop that prints just the extension of each one
using parameter expansion (no external tools).
