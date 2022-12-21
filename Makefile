SHELL:=/usr/bin/env bash

PROJECT ?= $(shell git rev-parse --show-toplevel)
DISTRO ?= ubuntu20.04
PYVERS = 3.10.9

.PHONY: black
black:
	poetry run isort .
	poetry run black .

.PHONY: lint
lint: black
	poetry run mypy kinds tests/**/*.py
	poetry run flake8 .
	poetry run doc8 -q docs

.PHONY: unit
unit:
	poetry run pytest

.PHONY: package
package:
	poetry check
	poetry run pip check
	# poetry run safety check --full-report

.PHONY: test
test: lint package unit

.PHONY: work36
work36:
	docker run --pull --rm -it --volume $(PROJECT):/project/ qs5779/python-testing:ubuntu20.04-3.6.15 /bin/bash

.PHONY: work37
work37:
	docker run --pull --rm -it --volume $(PROJECT):/project/ qs5779/python-testing:ubuntu20.04-3.7.16 /bin/bash

.PHONY: work38
work38:
	docker run --pull --rm -it --volume $(PROJECT):/project/ qs5779/python-testing:ubuntu20.04-3.8.16 /bin/bash

.PHONY: work
work:
	docker run --pull --rm -it --volume $(PROJECT):/project/ qs5779/python-testing:$(DISTRO)-$(PYVERS) /bin/bash.PHONY: docs

docs:
	@cd docs && $(MAKE) $@

.PHONY: clean clean-build clean-pyc clean-test
clean: clean-build clean-pyc clean-test ## remove all build, test, coverage and Python artifacts

clean-build: ## remove build artifacts
	rm -fr build/
	rm -fr dist/
	rm -fr .eggs/
	find . -name '*.egg-info' -exec rm -fr {} +
	find . -name '*.egg' -exec rm -f {} +

clean-pyc: ## remove Python file artifacts
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -fr {} +

clean-test: ## remove test and coverage artifacts
	rm -fr .tox/
	rm -f .coverage
	rm -fr htmlcov/
	rm -fr .pytest_cache
	rm -fr .mypy_cache
