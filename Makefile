.PHONY: *

export PYTHONPATH := src

default: lint type test

init:
	uv sync

dev:
	SERVER_ENV=development uv run uvicorn src.api:app --reload --port 8080

test:
	uv run pytest -v --cov=src --cov-report=term-missing

lint:
	uv run ruff check .

type:
	uv run mypy src