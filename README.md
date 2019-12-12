Poetry inside Docker
====================

This dockerfile contains the awesome new Python packaging tools [Poetry](https://github.com/python-poetry/poetry), created by [Sébastien Eustace](https://github.com/sdispater).


## How to use this image

```bash
$ docker run -it --rm nicklehmann/poetry:py3.7-preview-alpine 
Poetry version 1.0.0b9

USAGE
  poetry [-h] [-q] [-v [<...>]] [-V] [--ansi] [--no-ansi] [-n] <command> [<arg1>] ... [<argN>]

ARGUMENTS
  <command>              The command to execute
  <arg>                  The arguments of the command

GLOBAL OPTIONS
    [...]

AVAILABLE COMMANDS
    [...]
```

The image behaves like you are using `poetry` installed normally. So you can just append the commands and options as you normally would.

```bash
$ docker run -it --rm nicklehmann/poetry:py3.7-preview-alpine install --help
BusyBox v1.30.1 (2019-06-12 17:51:55 UTC) multi-call binary.

Usage: install [-cdDsp] [-o USER] [-g GRP] [-m MODE] [-t DIR] [SOURCE]... DEST

Copy files and set attributes

	-c	Just copy (default)
	-d	Create directories
	-D	Create leading target directories
	-s	Strip symbol table
	-p	Preserve date
	-o USER	Set ownership
	-g GRP	Set group ownership
	-m MODE	Set permissions
	-t DIR	Install to DIR
```

You can also base your own image on this as follows:

```dockerfile
FROM nicklehmann/poetry:py3.7-latest-alpine

ARG STAGE

ADD poetry.lock pyproject.toml ./
RUN poetry install $(test "$STAGE" == production && echo "--no-dev") --no-interaction --no-ansi

COPY . .

CMD ["python", "yourscript.py"]
```

Normal installation
-------------------

Instead of downloading the installation script from the internet and executing it, `poetry` is installed manually using `virtualenv` and `pip`. I am not a fan of piping content from the internet in my build scripts / CI and decided against that. Furthermore, it is not totally clear to me what the `get-poetry.py` does. Therefore, installing it like any other python CLI tool is much more clear to me.


Virtualenv
----------

In this image, `poetry` installs dependencies into the system `site-packages`. There is no point in creating virtualenvs inside docker containers. While some might argue that this is a more natural flow for experienced python programmers, for me this is just the case if you also work with normal virtualenvs. Because I try to use docker containers everywhere, installing everything at system level makes more sense and the integration with tools like `PyCharm` easier.


Contribute
==========

If you want to generate all dockerfiles after having made a change, execute the `generate.sh` script. It will invoke `fish-pepper` as a docker container, generate the dockerfiles and move them to the top-level directory.
