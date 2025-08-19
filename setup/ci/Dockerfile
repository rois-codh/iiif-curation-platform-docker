FROM alpine:3.20
MAINTAINER Tarek Saier <tareksaier@gmail.com>

ENV INSTALL_PATH /canvasindexer
ENV VIRTUAL_ENV /opt/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

RUN apk add --no-cache \
    gcc \
    musl-dev \
    python3 \
    python3-dev \
    py3-psycopg2

RUN python3 -m venv $VIRTUAL_ENV

COPY requirements.txt requirements.txt
RUN uv pip install --no-cache -r requirements.txt
RUN uv pip install --no-cache gunicorn

RUN apk del gcc musl-dev python3-dev \
    && rm -rf /root/.cache

COPY . .
CMD gunicorn -c gunicorn_config.py 'canvasindexer:create_app()'
