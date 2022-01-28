SHELL=/bin/bash

.PHONY: format lint singularity singularity-shell

format:
	isort .
	black .

lint:
	flake8 .

singularity:
	singularity build td3.sif Singularity

singularity-shell:
	singularity shell --nv td3.sif