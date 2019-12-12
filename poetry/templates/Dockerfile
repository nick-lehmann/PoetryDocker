FROM python:{{= fp.config.version.python}}-{{= fp.config.os.base }}

# Specify the environment you want to build for
ENV PYTHONFAULTHANDLER=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONHASHSEED=random \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    POETRY_VERSION={{= fp.config.poetry.version}}


RUN cd /opt && \
    # Install build dependencies
    apk add --virtual build-dependencies curl build-base openssl-dev libffi-dev && \
    # Install runtime dependencies
    apk add git openssl libffi && \
    # Create virtualenv
    pip install virtualenv && \
    virtualenv poetry && \
    source poetry/bin/activate && \
    # Install poetry inside virtualenv
    pip install "poetry==$POETRY_VERSION" && \
    # Bring poetry into path so you can just invoke `poetry`
    ln -s $(pwd)/poetry/bin/poetry /usr/bin/poetry && \
    deactivate && \
    pip uninstall virtualenv -y && \
    # Disable creation of virtualenvs
    poetry config virtualenvs.create false || poetry config settings.virtualenvs.create false && \
    # Uninstall build dependencies
    apk del build-dependencies

# Needed to make poetry install your dependencies in your system python
ENV VIRTUAL_ENV=/usr/bin/python

# Jetbrains tools use this directory by default. Makes running your
# applications with PyCharm easier.
WORKDIR /opt/project

CMD ["poetry"]
