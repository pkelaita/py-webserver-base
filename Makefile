.PHONY: *

export PYTHONPATH := src

default: lint type test

init:
	uv pip install -r requirements.txt
	uv pip install -r requirements-dev.txt

dev:
	SERVER_ENV=development uvicorn src.api:app --reload --port 8080

test:
	pytest -v --cov=src --cov-report=term-missing

lint:
	ruff check .

type:
	mypy src