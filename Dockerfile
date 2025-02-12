FROM python:3.13-slim
COPY --from=ghcr.io/astral-sh/uv:0.5.30 /uv /uvx /bin/

WORKDIR /app
COPY requirements.txt .
RUN uv pip install -r requirements.txt --system
COPY . .

ENV PYTHONPATH=/app/src
ENV SERVER_ENV=production

EXPOSE 8080

CMD ["uvicorn", "src.api:app", "--host", "0.0.0.0", "--port", "8080"]