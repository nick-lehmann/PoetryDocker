Poetry inside Docker
====================

This images has the following configuration

- OS: stretch
- Python: 3.5
- Poetry: 0.12.17

An example on how to use this image

```
FROM nicklehmann/poetry:py3.5-0.12.17-stretch

ADD poetry.lock pyproject.toml ./

RUN poetry install --no-interaction --no-ansi

COPY . .

CMD ["python", "your_script.py"]
```
