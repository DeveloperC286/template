.PHONY: default
default:
	echo "Default target."

.PHONY: check-yaml-formatting
check-yaml-formatting:
	yamlfmt -verbose -lint -dstar .github/workflows/*

.PHONY: fix-yaml-formatting
fix-yaml-formatting:
	yamlfmt -verbose -dstar .github/workflows/*

.PHONY: check-github-actions-workflows-linting
check-github-actions-workflows-linting:
	actionlint -verbose -color

.PHONY: check-scripts-permissions
check-scripts-permissions:
	./ci/check-scripts-permissions.sh

.PHONY: check-shellcheck
check-shellcheck:
	shellcheck ci/*.sh rust/ci/*.sh
