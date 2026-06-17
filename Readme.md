# Django + Postgres Docker Starter

A small Django starter project wired to PostgreSQL with Docker Compose.

## Stack

- Python 3.14
- Django 6.0
- PostgreSQL 18
- psycopg 3
- Gunicorn for production

## Requirements

- Docker
- Docker Compose v2

## Setup

Create your local environment file:

```sh
cp .env.sample .env
```

For production, replace the sample `SECRET_KEY`, restrict `ALLOWED_HOSTS`, add your public origin to `CSRF_TRUSTED_ORIGINS`, and enable the HTTPS-related settings when TLS terminates in front of Django.

## Development

```sh
docker compose up --build
```

The app runs at http://localhost:8000 and automatically applies migrations after PostgreSQL is healthy.

Run linting:

```sh
docker compose run --rm web ruff check --no-cache .
```

## Production-like Run

```sh
docker compose -f docker-compose.prod.yml up --build
```

The production Compose file builds the smaller runtime image, runs migrations, collects static files, and serves Django with Gunicorn.
