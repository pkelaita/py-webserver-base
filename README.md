# Python Webserver Base

This is just a skeleton. Replace this with the description.

## Requirements

- [Python](https://www.python.org/) >= 3.13
- [GNU Make](https://www.gnu.org/software/make/)
- [UV](https://astral.sh/blog/uv)
- [Docker](https://www.docker.com/)

## Installation

```bash
make init
```

## Development

- Run the webserver: `make server-dev`
- Run tests: `make test`
- Lint: `make lint`
- Typecheck: `make type`

## Running in Docker

```bash
docker build -t app-name .
docker run -p 8080:8080 app-name
```
