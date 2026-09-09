# Contributing

Thanks for taking a look. This is a small project, so the process is light.

## Getting set up

```sh
./scripts/run-all-tests.sh   # run every exercise's tests
```

You need `bash` 4+ and [ShellCheck](https://www.shellcheck.net/). There is nothing to
install beyond those: no package manager, no build step.

## Adding a lesson

Keep each lesson focused on one concept, short enough to read in a few minutes, and
end it with a small "Try it" prompt. Link to it from the table in `README.md`.

## Adding an exercise

```sh
./scripts/new-exercise.sh your-exercise-name
```

Then fill in the three generated files:

- `README.md`: the brief, covering inputs, required output, and edge cases
- `solution.sh`: a correct, `set -euo pipefail`, ShellCheck-clean reference solution
- `test.sh`: checks that exercise the normal case and at least one edge case, exiting
  non-zero on any failure (follow the pattern in the existing exercises)

Add the new exercise to the table in `README.md`, and run `./scripts/run-all-tests.sh`
before opening a pull request.

## Branching and commits

`main` is the only long-lived branch and is always deployable. Work on a short-lived
branch off `main` and open a pull request; do not commit directly to `main`.

```sh
git switch -c feat/palindrome-exercise
```

Prefix branches with `fix/`, `feat/`, `docs/` or `chore/`.

Write commit subjects in the imperative mood, under about 50 characters, describing
the change rather than the file touched:

```
Add palindrome checker exercise
Fix quoting bug in file organizer test
```

## Code style

Match what is already there. A few things that are deliberate:

- `set -euo pipefail` at the top of every script
- comments explain why something is done, not what the next line does
- destructive actions (moving, deleting, overwriting) are opt-in via an explicit flag,
  never the default
- no runtime dependencies beyond `bash` and standard Unix tools (`awk`, `grep`,
  `sed`, `wc`)

## Pull requests

CI must pass: ShellCheck, shfmt formatting, all exercise tests, secret scan, and
dependency review. Keep pull requests focused on one lesson or one exercise at a time.
