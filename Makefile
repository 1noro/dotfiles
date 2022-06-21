.PHONY: all
all: help

##@ Generic utils
.PHONY: help
help: ## Print help
	@awk 'BEGIN {FS = ":.*##"; printf "Usage:\n  make \033[36m<target>\033[0m\n"} /^[^{]+:.*?##/ { printf "  \033[36m%-23s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

.PHONY: deps
deps: ## Install dependencies
	@echo "installing deps"

.PHONY: deploy
deploy: ## Deploy configs
	@/bin/bash scripts/deploy.sh

.PHONY: clean
clean: ## Clean configs
	@/bin/bash scripts/reset.sh
