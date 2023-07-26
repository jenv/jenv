#!/usr/bin/env bats

load 'test_helper/bats-support/load'
load 'test_helper/bats-assert/load'

teardown() {
  jenv global --unset
  jenv shell --unset
  rm -f ~/.jenv/versions/*
}

@test "add openjdk 1.7.0.261" {
  jenv add /usr/lib/jvm/java-1.7.0-openjdk-1.7.0.261-2.6.22.2.el7_8.$_ARCH/jre/

  run jenv versions
  assert_line --regexp '^ *1.7$'
  assert_line --regexp '^ *1.7.0.261$'
  assert_line --regexp '^ *openjdk64-1.7.0.261$'
}

@test "add openjdk 1.8.0.372" {
  jenv add /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.372.b07-1.el7_9.$_ARCH/jre/

  run jenv versions
  assert_line --regexp '^ *1.8$'
  assert_line --regexp '^ *1.8.0.372$'
  assert_line --regexp '^ *openjdk64-1.8.0.372$'
}

@test "add zulu 11.0.20" {
  jenv add /usr/lib/jvm/zulu11/

  run jenv versions
  assert_line --regexp '^ *11$'
  assert_line --regexp '^ *11.0$'
  assert_line --regexp '^ *11.0.20$'
  assert_line --regexp '^ *zulu64-11.0.20$'
}

