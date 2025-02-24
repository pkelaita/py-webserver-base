FROM python:3.13-slim
COPY --from=ghcr.io/astral-sh/uv:0.5.30 /uv /uvx /bin/

WORKDIR /app
COPY pyproject.toml .
COPY uv.lock .
RUN uv sync
COPY . .

ENV PYTHONPATH=/app/src
ENV SERVER_ENV=production

EXPOSE 8080

CMD ["uv", "run", "uvicorn", "src.api:app", "--host", "0.0.0.0", "--port", "8080"]