Poetry inside Docker
====================

This images has the following configuration

- OS: buster
- Python: 2.7
- Poetry: 1.0.0b9

An example on how to use this image

```
FROM nicklehmann/poetry:py2.7-1.0.0b9-buster

ADD poetry.lock pyproject.toml ./

RUN poetry install --no-interaction --no-ansi

COPY . .

CMD ["python", "your_script.py"]
```
