SHELL=/bin/bash

.PHONY: format lint

format:
	isort .
	black .

lint:
	flake8 .
