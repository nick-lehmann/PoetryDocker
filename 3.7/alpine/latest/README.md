Poetry inside Docker
====================

This images has the following configuration

- OS: alpine
- Python: 3.7
- Poetry: 0.12.17

An example on how to use this image

```
FROM nicklehmann/poetry:py3.7-0.12.17-alpine

ADD poetry.lock pyproject.toml ./

RUN poetry install --no-interaction --no-ansi

COPY . .

CMD ["python", "your_script.py"]
```
