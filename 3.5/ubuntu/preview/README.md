Poetry inside Docker
====================

This images has the following configuration

- OS: ubuntu
- Python: 3.5
- Poetry: 1.0.0b9

An example on how to use this image

```
FROM nicklehmann/poetry:py3.5-1.0.0b9-ubuntu

ADD poetry.lock pyproject.toml ./

RUN poetry install --no-interaction --no-ansi

COPY . .

CMD ["python", "your_script.py"]
```
