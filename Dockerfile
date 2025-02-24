FROM python:3.13-slim
COPY --from=ghcr.io/astral-sh/uv:0.6.2 /uv /uvx /bin/

WORKDIR /app
COPY server/pyproject.toml .
COPY server/uv.lock .
RUN uv sync --no-dev
COPY server/ .

ENV PYTHONPATH=/app/src
ENV SERVER_ENV=production

EXPOSE 8080

CMD ["uv", "run", "uvicorn", "src.api:app", "--host", "0.0.0.0", "--port", "8080"]