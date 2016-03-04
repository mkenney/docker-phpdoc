#!/bin/env sh

docker run --rm -i -v $(pwd):/app:rw mkenney/phpdoc $@

