#!/usr/bin/env sh

# rust/.github/workflows/dogfood.yml.jinja is a Copier template, so
# actionlint/yamlfmt can't lint/format-check it directly. Render both of its
# `uses_git` variants to real workflow files and check those instead.

set -o errexit
set -o xtrace

work_dir_uses_git=$(mktemp -d)
work_dir_no_git=$(mktemp -d)

cleanup() {
	rm -rf "$work_dir_uses_git" "$work_dir_no_git"
}
trap cleanup EXIT

copier copy --data project_type=rust --data project_name=dogfood-workflow-check --data uses_git=true --defaults --force . "$work_dir_uses_git"
copier copy --data project_type=rust --data project_name=dogfood-workflow-check --data uses_git=false --defaults --force . "$work_dir_no_git"

yamlfmt -verbose -lint -dstar "$work_dir_uses_git/.github/workflows/dogfood.yml" "$work_dir_no_git/.github/workflows/dogfood.yml"

actionlint -verbose -color "$work_dir_uses_git/.github/workflows/dogfood.yml" "$work_dir_no_git/.github/workflows/dogfood.yml"
