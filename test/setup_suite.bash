#!/usr/bin/env bats

setup_suite() {
  export PATH=$HOME/.jenv/bin/:$PATH

  eval "$(jenv init -)"

  # TODO: this should be in jenv-init
  export -f jenv
}

