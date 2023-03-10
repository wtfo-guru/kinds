SHELL:=/usr/bin/env bash

PROJECT ?= $(shell git rev-parse --show-toplevel)
DISTRO ?= ubuntu20.04
PYVERS = 3.10.9

.PHONY: black mypy lint sunit unit package test
black:
	poetry run isort .
	poetry run black .

mypy: black
	poetry run mypy kinds tests/**/*.py

lint: mypy
	poetry run flake8 .
	poetry run doc8 -q docs

sunit:
	poetry run pytest -s tests

unit:
	poetry run pytest tests

package:
	poetry check
	poetry run pip check
	# re-enable when safety supports packaging ^22.0
	# poetry run safety check --full-report

test: lint package unit

.PHONY: work39 work37 work38 work
work39:
	docker run --rm -it --volume $(PROJECT):/project/ qs5779/python-testing:ubuntu20.04-3.9.14 /bin/bash

work37:
	docker run --rm -it --volume $(PROJECT):/project/ qs5779/python-testing:ubuntu20.04-3.7.16 /bin/bash

work38:
	docker run --rm -it --volume $(PROJECT):/project/ qs5779/python-testing:ubuntu20.04-3.8.16 /bin/bash

work:
	docker run --rm -it --volume $(PROJECT):/project/ qs5779/python-testing:$(DISTRO)-$(PYVERS) /bin/bash

.PHONY: chlog docs
chlog:
	github_changelog_generator -u wtfo-guru -p kinds
	sed -i -e '/^$$/N;/^\n$$/D' ./CHANGELOG.md
	m2r2 --overwrite --anonymous-references CHANGELOG.md
	sed -i '/This Changelog was automatically generated by/d' ./CHANGELOG.rst
	mv -f ./CHANGELOG.rst ./docs/pages/changelog.rst
	poetry run doc8 -q docs

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
