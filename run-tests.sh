#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

docker build --tag jenv:tests $SCRIPT_DIR/test

docker run --mount type=bind,source=$SCRIPT_DIR,target=/root/.jenv jenv:test /root/.jenv/test/bats/bin/bats /root/.jenv/test
