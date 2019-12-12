Poetry inside Docker
====================

This images has the following configuration

- OS: {{= fp.config.os.base }}
- Python: {{= fp.config.version.python}}
- Poetry: {{= fp.config.poetry.version}}

An example on how to use this image

```
FROM nicklehmann/poetry:py{{= fp.config.version.python}}-{{= fp.config.poetry.version}}-{{= fp.config.os.base }}

ADD poetry.lock pyproject.toml ./

RUN poetry install --no-interaction --no-ansi

COPY . .

CMD ["python", "your_script.py"]
```
