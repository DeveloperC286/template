.PHONY: default
default:
	echo "Default target."

.PHONY: check-shell-formatting
check-shell-formatting:
	shfmt --simplify --diff ci/*.sh rust/ci/*.sh rust/ci/*.sh.jinja

.PHONY: check-yaml-formatting
check-yaml-formatting:
	yamlfmt -verbose -lint -dstar .github/workflows/* rust/.github/workflows/continuous-integration.yml rust/.github/workflows/continuous-delivery.yml

.PHONY: fix-shell-formatting
fix-shell-formatting:
	shfmt --simplify --write ci/*.sh rust/ci/*.sh rust/ci/*.sh.jinja

.PHONY: fix-yaml-formatting
fix-yaml-formatting:
	yamlfmt -verbose -dstar .github/workflows/* rust/.github/workflows/continuous-integration.yml rust/.github/workflows/continuous-delivery.yml

.PHONY: check-github-actions-workflows-linting
check-github-actions-workflows-linting:
	actionlint -verbose -color
	actionlint -verbose -color rust/.github/workflows/continuous-integration.yml rust/.github/workflows/continuous-delivery.yml

.PHONY: check-rust-dogfood-workflow
check-rust-dogfood-workflow:
	./ci/check-rust-dogfood-workflow.sh

.PHONY: check-shell-linting
check-shell-linting:
	shellcheck ci/*.sh rust/ci/*.sh rust/ci/*.sh.jinja

.PHONY: check-scripts-permissions
check-scripts-permissions:
	./ci/check-scripts-permissions.sh

.PHONY: check-common-files
check-common-files:
	./ci/check-common-files.sh
