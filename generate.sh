#!/usr/bin/env bash

ls | grep "[0-9].[0-9]" | xargs rm -rf
docker run -v $(pwd):/opt -w /opt --user $(id -u):$(id -g) fabric8/fish-pepper
mv poetry/images/* .
rmdir poetry/images
