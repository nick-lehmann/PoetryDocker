FROM python:3.5-alpine

# Specify the environment you want to build for
ENV PYTHONFAULTHANDLER=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONHASHSEED=random \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    POETRY_VERSION=1.0.0b9

# Jetbrains tools use this directory by default. Makes running your
# applications with PyCharm easier.
WORKDIR /opt/project

# Install native dependencies
RUN apk add curl build-base openssl-dev libffi-dev git

# Install poetry inside virtualenv
RUN cd /opt && \
    pip install virtualenv && \
    virtualenv poetry && \
    source poetry/bin/activate && \
    pip install "poetry==$POETRY_VERSION" && \
    ln -s $(pwd)/poetry/bin/poetry /usr/bin/poetry && \
    deactivate && \
    pip uninstall virtualenv -y && \
    poetry config virtualenvs.create false || poetry config settings.virtualenvs.create false

# Needed to make poetry install your dependencies in your system python
ENV VIRTUAL_ENV=/usr/bin/python

CMD ["poetry"]
