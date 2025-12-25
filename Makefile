.PHONY: default
default:
	echo "Default target."

.PHONY: check-shell-formatting
check-shell-formatting:
	shfmt --simplify --diff ci/* rust/ci/*

.PHONY: check-yaml-formatting
check-yaml-formatting:
	yamlfmt -verbose -lint -dstar .github/workflows/*

.PHONY: fix-shell-formatting
fix-shell-formatting:
	shfmt --simplify --write ci/* rust/ci/*

.PHONY: fix-yaml-formatting
fix-yaml-formatting:
	yamlfmt -verbose -dstar .github/workflows/*

.PHONY: check-github-actions-workflows-linting
check-github-actions-workflows-linting:
	actionlint -verbose -color

.PHONY: check-shell-linting
check-shell-linting:
	shellcheck ci/*.sh rust/ci/*.sh

.PHONY: check-scripts-permissions
check-scripts-permissions:
	./ci/check-scripts-permissions.sh
