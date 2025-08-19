FROM alpine:3.20

ENV INSTALL_PATH /jsonkeeper
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

RUN apk add --no-cache \
    gcc \
    musl-dev \
    python3 \
    python3-dev \
    py3-psycopg2

RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

COPY requirements.txt requirements.txt
RUN uv pip install --no-cache -r requirements.txt
RUN uv pip install --no-cache gunicorn

RUN apk del gcc musl-dev python3-dev \
    && rm -rf /root/.cache

COPY . .
CMD gunicorn -c gunicorn_config.py 'jsonkeeper:create_app()'
