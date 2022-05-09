#!/usr/bin/env bats

setup() {
  load 'test_helper/bats-support/load'
  load 'test_helper/bats-assert/load'

  export PATH=$HOME/.jenv/bin/:$PATH
  eval "$(jenv init -)"

  jenv global --unset
  jenv shell --unset
  rm -f ~/.jenv/versions/*
}

@test "add openjdk 1.6.0.41" {
  jenv add /usr/lib/jvm/java-1.6.0-openjdk-1.6.0.41.x86_64/jre/

  run jenv versions
  assert_line --regexp '^ *1.6$'
  assert_line --regexp '^ *1.6.0.41$'
  assert_line --regexp '^ *openjdk64-1.6.0.41$'
}

@test "add openjdk 1.7.0.261" {
  jenv add /usr/lib/jvm/java-1.7.0-openjdk-1.7.0.261-2.6.22.2.el7_8.x86_64/jre/

  run jenv versions
  assert_line --regexp '^ *1.7$'
  assert_line --regexp '^ *1.7.0.261$'
  assert_line --regexp '^ *openjdk64-1.7.0.261$'
}

@test "add openjdk 1.8.0.322" {
  jenv add /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.322.b06-1.el7_9.x86_64/jre/

  run jenv versions
  assert_line --regexp '^ *1.8$'
  assert_line --regexp '^ *1.8.0.322$'
  assert_line --regexp '^ *openjdk64-1.8.0.322$'
}

@test "add zulu 11" {
  jenv add /usr/lib/jvm/zulu-11/

  run jenv versions
  assert_line --regexp '^ *11$'
  assert_line --regexp '^ *11.0$'
  assert_line --regexp '^ *11.0.15$'
  assert_line --regexp '^ *zulu64-11.0.15$'
}

