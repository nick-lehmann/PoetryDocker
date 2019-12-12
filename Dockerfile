FROM python:3.8-alpine3.10

ARG YOUR_ENV

ENV YOUR_ENV=${YOUR_ENV} \
  PYTHONFAULTHANDLER=1 \
  PYTHONUNBUFFERED=1 \
  PYTHONHASHSEED=random \
  PIP_NO_CACHE_DIR=off \
  PIP_DISABLE_PIP_VERSION_CHECK=on \
  PIP_DEFAULT_TIMEOUT=100 \
  POETRY_VERSION=1.0.0b9

RUN apk add curl build-base openssl-dev libffi-dev git

RUN cd /opt && \
    pip install virtualenv && \
    virtualenv -p python3 poetry && \
    source poetry/bin/activate && \
    pip install "poetry==$POETRY_VERSION" && \
    ln -s $(pwd)/poetry/bin/poetry /usr/bin/poetry && \
    deactivate && \
    pip uninstall virtualenv -y && \
    poetry config virtualenvs.create false

ENV VIRTUAL_ENV=/usr/bin/python

WORKDIR /opt/project

CMD ["poetry"]
