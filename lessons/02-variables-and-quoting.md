# 02: Variables and Quoting

## Declaring variables

```sh
name="Ada"
echo "Hello, $name"
```

No spaces around `=`. `name = "Ada"` is parsed as running a command called `name` with
arguments `=` and `"Ada"`, which is one of the first errors every bash beginner hits.

## Quoting rules

This is the part of bash that causes the most subtle bugs, so it is worth learning
early and precisely:

| Quoting | Expands variables? | Expands globs (`*`)? |
| --- | --- | --- |
| `"double"` | yes | no |
| `'single'` | no | no |
| unquoted | yes | yes |

```sh
file="my report.txt"
echo $file      # prints: my report.txt  <- but as TWO words to anything reading argv
echo "$file"    # prints: my report.txt  <- as ONE word, correctly
```

The rule of thumb: quote every variable expansion unless you specifically want word
splitting or globbing. `"$file"` should be your default, `$file` the deliberate
exception.

## Parameter expansion basics

```sh
greeting="Hello"
echo "${greeting}, world"        # braces disambiguate from surrounding text
echo "${greeting:-Hi}"            # default if greeting is unset or empty
echo "${#greeting}"                # length of the string
```

## Try it

Store a filename containing a space in a variable, then write two versions of a loop
that echoes it: one that breaks because of missing quotes, and one that is fixed by
quoting. Compare the output.
