import os
import logging
from logging.config import dictConfig

LOG_LEVEL = os.getenv("LOG_LEVEL", "INFO").upper()

LOGGING_CONFIG = {
    "version": 1,
    "disable_existing_loggers": False,
    "formatters": {"default": {"format": "%(levelname)s:     %(message)s"}},
    "handlers": {
        "default": {
            "formatter": "default",
            "class": "logging.StreamHandler",
            "stream": "ext://sys.stdout",
        }
    },
    "loggers": {"app": {"handlers": ["default"], "level": LOG_LEVEL}},
}


def setup_logger() -> logging.Logger:
    dictConfig(LOGGING_CONFIG)
    return logging.getLogger("app")


logger = setup_logger()
