#!/bin/env sh

docker run --rm -t -i -v $(pwd):/app:rw mkenney/phpdoc $@

