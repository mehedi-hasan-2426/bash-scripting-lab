# 01: Shell Basics

Bash is both a command interpreter and a scripting language. Everything you type at a
prompt is a valid line in a script, which is why the fastest way to learn is to try
things interactively first, then save what works.

## The shebang

Every script starts with a line that tells the kernel which interpreter to run it with:

```sh
#!/usr/bin/env bash
```

Using `env` looks up `bash` on `PATH` instead of hard-coding `/bin/bash`, which keeps
scripts portable across systems where bash lives somewhere else (some BSDs, Nix, etc.).

## Making a script runnable

```sh
chmod +x greet.sh
./greet.sh
```

Without the executable bit you'd have to run it as `bash greet.sh`, which works too but
ignores the shebang.

## Exit codes

Every command returns a numeric exit code: `0` for success, non-zero for failure. The
special variable `$?` holds the exit code of the last command:

```sh
grep "error" app.log
echo "grep exited with $?"
```

Scripts inherit this convention: `exit 0` at the end of a successful script, a non-zero
`exit N` when something went wrong. Later lessons on error handling build directly on
this.

## Try it

Write a one-line script that prints `Hello from bash`, make it executable, and run it
two ways: `./hello.sh` and `bash hello.sh`. Confirm both print the same thing.
