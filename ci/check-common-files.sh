#!/usr/bin/env sh

set -o errexit
set -o xtrace

exit_code=0

diff -q .envrc basic/.envrc || exit_code=1
diff -q .envrc rust/.envrc || exit_code=1

diff -q .github/workflows/conventional-commits.yml basic/.github/workflows/conventional-commits.yml || exit_code=1
diff -q .github/workflows/conventional-commits.yml rust/.github/workflows/conventional-commits.yml || exit_code=1

diff -q .github/workflows/git-history.yml basic/.github/workflows/git-history.yml || exit_code=1
diff -q .github/workflows/git-history.yml rust/.github/workflows/git-history.yml || exit_code=1

diff -q .github/workflows/github-actions-workflows.yml basic/.github/workflows/github-actions-workflows.yml || exit_code=1
diff -q .github/workflows/github-actions-workflows.yml rust/.github/workflows/github-actions-workflows.yml || exit_code=1

diff -q .github/workflows/mirroring.yml basic/.github/workflows/mirroring.yml || exit_code=1
diff -q .github/workflows/mirroring.yml rust/.github/workflows/mirroring.yml || exit_code=1

diff -q .github/workflows/release-please.yml basic/.github/workflows/release-please.yml || exit_code=1
diff -q .github/workflows/release-please.yml rust/.github/workflows/release-please.yml || exit_code=1

diff -q .gitignore basic/.gitignore || exit_code=1

diff -q LICENSE basic/LICENSE || exit_code=1
diff -q LICENSE rust/LICENSE || exit_code=1

diff -q release-please-config.json basic/release-please-config.json || exit_code=1

diff -q .yamlfmt basic/.yamlfmt || exit_code=1
diff -q .yamlfmt rust/.yamlfmt || exit_code=1

# The Copier answers file template has no root canonical, so the flavours are
# diffed against each other directly.
diff -q "basic/{{_copier_conf.answers_file}}.jinja" "rust/{{_copier_conf.answers_file}}.jinja" || exit_code=1

exit $exit_code
