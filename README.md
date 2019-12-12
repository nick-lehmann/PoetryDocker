Poetry inside Docker
====================

This dockerfile contains the awesome new Python packaging tools [Poetry](https://github.com/python-poetry/poetry), created by [Sébastien Eustace](https://github.com/sdispater).

I have decided to create my own poetry image because the one's if have found always had some issues, in my opinion.


Normal installation
-------------------

Instead of downloading the installation script from the internet and executing it, `poetry` is installed manually using `virtualenv` and `pip`. I am not a fan of piping content from the internet in my build scripts / CI and decided against that. Furthermore, it is not totally clear to me what the `get-poetry.py` does. Therefore, installing it like any other python CLI tool is much more clear to me.

Virtualenv
----------

In this image, `poetry` installs dependencies into the system `site-packages`. There is no point in creating virtualenvs inside docker containers. While some might argue that this is a more natural flow for experienced python programmers, for me this is just the case if you also work with normal virtualenvs. Because I try to use docker containers everywhere, installing everything at system level makes more sense and the integration with tools like `PyCharm` easier.

