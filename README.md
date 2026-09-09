# Bash Scripting Lab

<p align="center">
  <img src="assets/logo.svg" alt="Bash Scripting Lab logo" width="120" height="120">
</p>

<p align="center">
  <img src="assets/divider.svg" alt="" width="100%" height="6">
</p>

**A hands-on path to learning Bash: short lessons, then exercises you actually run and
test.**

[![CI](https://github.com/mehedi-hasan-2426/bash-scripting-lab/actions/workflows/ci.yml/badge.svg)](https://github.com/mehedi-hasan-2426/bash-scripting-lab/actions/workflows/ci.yml)
[![License](https://img.shields.io/badge/license-MIT-blue)](LICENSE)
![Lessons](https://img.shields.io/badge/lessons-10-4EAA25?logo=gnubash&logoColor=white)
![Exercises](https://img.shields.io/badge/exercises-6-4EAA25?logo=gnubash&logoColor=white)
![Dependencies](https://img.shields.io/badge/runtime%20dependencies-0-brightgreen)

## Contents

- [Why this exists](#why-this-exists)
- [Quick start](#quick-start)
- [Lessons](#lessons)
- [Exercises](#exercises)
- [Adding your own exercise](#adding-your-own-exercise)
- [Project structure](#project-structure)
- [Security](#security)
- [Contributing](#contributing)
- [Inspiration and credits](#inspiration-and-credits)

## Why this exists

Most Bash tutorials are either a wall of syntax with nothing to run, or a pile of
copy-pasted one-liners with no explanation of why they work. This repo tries to split
the difference: each lesson is short and links straight to the concept it teaches, and
each exercise is a real, runnable script with its own automated test, so you know
immediately whether your solution actually works, not just whether it looks right.

## Quick start

Requirements: `bash` 4+ and [ShellCheck](https://www.shellcheck.net/) (optional locally,
required in CI).

```sh
git clone https://github.com/mehedi-hasan-2426/bash-scripting-lab.git
cd bash-scripting-lab

# Read a lesson
cat lessons/01-shell-basics.md

# Try an exercise, then check your work
cd exercises/01-greeting-card
chmod +x solution.sh test.sh
./test.sh
```

Or run every exercise's tests at once from the repo root:

```sh
./scripts/run-all-tests.sh
```

## Lessons

| # | Topic |
| --- | --- |
| 01 | [Shell Basics](lessons/01-shell-basics.md) |
| 02 | [Variables and Quoting](lessons/02-variables-and-quoting.md) |
| 03 | [Input, Arguments, and Exit Codes](lessons/03-input-arguments-and-exit-codes.md) |
| 04 | [Conditionals and Tests](lessons/04-conditionals-and-tests.md) |
| 05 | [Loops](lessons/05-loops.md) |
| 06 | [Functions](lessons/06-functions.md) |
| 07 | [Arrays and Strings](lessons/07-arrays-and-strings.md) |
| 08 | [Working with Files and Text](lessons/08-working-with-files-and-text.md) |
| 09 | [Error Handling and Safe Scripting](lessons/09-error-handling-and-safe-scripting.md) |
| 10 | [Debugging and Testing](lessons/10-debugging-and-testing.md) |

## Exercises

| # | Exercise | Practices |
| --- | --- | --- |
| 01 | [Greeting Card](exercises/01-greeting-card) | positional/optional arguments |
| 02 | [Word Counter](exercises/02-word-counter) | reading files, text processing |
| 03 | [Fortune Cookie](exercises/03-fortune-cookie) | arrays, testable randomness |
| 04 | [Tip Calculator](exercises/04-tip-calculator) | arithmetic via `awk` |
| 05 | [Password Strength Checker](exercises/05-password-strength-checker) | pattern matching, regex tests |
| 06 | [File Organizer](exercises/06-file-organizer) | safe-by-default scripting |

Every exercise folder has the same shape: `README.md` (the brief), `solution.sh` (a
working reference solution), and `test.sh` (the checks that solution has to pass). Try
writing your own `solution.sh` before looking at the one provided.

## Adding your own exercise

```sh
./scripts/new-exercise.sh palindrome-checker
```

This scaffolds a new numbered folder with stub files in the same shape as the existing
exercises.

## Project structure

```
lessons/      short, focused write-ups, one concept each
exercises/    numbered folders: README.md + solution.sh + test.sh
scripts/      repo tooling (scaffold a new exercise, run all tests)
.github/      CI: ShellCheck, shfmt, exercise tests, dependency review, Scorecard
```

## Security

This repo has no runtime dependencies, no network calls in any script, and no secrets.
CI runs [ShellCheck](https://www.shellcheck.net/), a secret scan, dependency review on
every pull request, and a weekly [OSSF Scorecard](https://github.com/ossf/scorecard)
analysis. See [SECURITY.md](SECURITY.md) for how to report a problem.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).