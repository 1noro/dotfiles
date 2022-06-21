.PHONY: all
all: help

##@ Generic utils
.PHONY: help
help: ## Print help
	@awk 'BEGIN {FS = ":.*##"; printf "Usage:\n  make \033[36m<target>\033[0m\n"} /^[^{]+:.*?##/ { printf "  \033[36m%-23s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

.PHONY: check
check: ## Check missing dependencies
	@/bin/bash scripts/check-deps.sh

.PHONY: deps
deps: ## Install dependencies
	# @/bin/bash scripts/install-deps.sh
	echo "nothing to do"

.PHONY: deploy
deploy: ## Deploy configs
	@/bin/bash scripts/deploy.sh

.PHONY: restore
restore: ## Restore configs
	@/bin/bash scripts/restore.sh
