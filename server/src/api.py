import os

from fastapi import FastAPI
from pydantic import BaseModel

from logger import logger

if os.getenv("SERVER_ENV") == "development":
    from dotenv import load_dotenv  # pragma: no cover

    load_dotenv()  # pragma: no cover

app = FastAPI()


class HealthResponse(BaseModel):
    status: str = "healthy"


@app.get("/health", response_model=HealthResponse)
async def health_check() -> HealthResponse:
    logger.info("Health check")
    return HealthResponse()
