#!/usr/bin/env bash

do_test() {
  trap "rm -rf jenv.version *.time shims/ versions/" RETURN INT HUP TERM

  SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

  if ! docker build --tag jenv:test "$SCRIPT_DIR/test"
  then
    echo "Failed to build the Docker image."
    return 1
  fi

  if ! docker run --mount type=bind,source="$SCRIPT_DIR",target=/root/.jenv jenv:test /root/.jenv/test/bats/bin/bats /root/.jenv/test
  then
    echo "Tests failed."
    return 1
  fi
}

do_test
