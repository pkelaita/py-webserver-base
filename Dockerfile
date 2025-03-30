# Build stage
FROM ghcr.io/astral-sh/uv:python3.13-bookworm-slim AS builder

WORKDIR /app
COPY server/pyproject.toml .
COPY server/uv.lock .
RUN uv sync --no-dev

# Run stage
FROM python:3.13-slim-bookworm

WORKDIR /app
COPY --from=builder /app/.venv .venv
COPY server/src src

ENV PATH="/app/.venv/bin:$PATH"
ENV PYTHONPATH=/app/src
ENV SERVER_ENV=production

EXPOSE 8080

CMD ["uvicorn", "src.api:app", "--host", "0.0.0.0", "--port", "8080"]
