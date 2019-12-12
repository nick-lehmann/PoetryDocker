Poetry inside Docker
====================

This images has the following configuration

- OS: alpine
- Python: 3.8
- Poetry: 1.0.0b9

An example on how to use this image

```
FROM nicklehmann/poetry:py3.8-1.0.0b9-alpine

ADD poetry.lock pyproject.toml ./

RUN poetry install --no-interaction --no-ansi

COPY . .

CMD ["python", "your_script.py"]
```
