# Security Policy

## Reporting a vulnerability

Report suspected vulnerabilities through GitHub's private vulnerability reporting
(Security tab, "Report a vulnerability") rather than a public issue. Please include
reproduction steps and the impact you believe it has.

Expect an acknowledgement within 5 working days.

## Scope

In scope:

- the example scripts in `exercises/` and `scripts/`
- the CI workflows in `.github/workflows/`

Out of scope:

- the two upstream projects credited in the README, which are separate projects with
  their own maintainers

## Security properties

Every script in this repository:

- runs under `set -euo pipefail` and fails loudly instead of silently continuing
- makes no network calls and reads no credentials or secrets
- defaults to a safe, non-destructive action where one applies (see
  `exercises/06-file-organizer`, which requires an explicit `--apply` flag before it
  moves anything)

Controls in place:

- [ShellCheck](https://www.shellcheck.net/) and `shfmt` run on every script, on every
  push and pull request
- a secret scan runs on every push and pull request
- dependency review runs on every pull request
- a weekly [OSSF Scorecard](https://github.com/ossf/scorecard) analysis is published
  to the repository's code scanning results
