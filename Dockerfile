FROM python:3.14-slim-trixie

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PIP_NO_CACHE_DIR=1 \
    RUFF_CACHE_DIR=/tmp/.ruff_cache

WORKDIR /app

RUN apt-get update \
    && apt-get install -y --no-install-recommends libpq5 \
    && rm -rf /var/lib/apt/lists/* \
    && addgroup --system django \
    && adduser --system --ingroup django django

COPY requirements-dev.txt requirements.txt ./
RUN pip install -r requirements-dev.txt

COPY . .

USER django

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
