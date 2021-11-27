
.PHONY: all
all: deps deploy

.PHONY: deps
deps:
	@echo "installing deps"

.PHONY: deploy
deploy:
	# @/bin/bash scripts/deploy.sh
	@echo "deploying"

.PHONY: clean
clean:
	# @/bin/bash scripts/reset.sh
	@echo "cleaning"

.PHONY: help
help:
	@echo "make"
	@echo "make deps"
	@echo "make deploy"
	@echo "make clean"
	@echo "make help"

