.PHONY: *

export PYTHONPATH := src

default: lint type test

init: server-init
lint: server-lint
type: server-type
test: server-test


# Server

server-init:
	cd server && uv sync

server-dev:
	cd server && SERVER_ENV=development uv run uvicorn src.api:app --reload --port 8080

server-lint:
	cd server && uv run ruff check .

server-type:
	cd server && uv run mypy src

server-test:
	cd server && uv run pytest -v --cov=src --cov-report=term-missing