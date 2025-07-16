#!/usr/bin/env bats

load 'test_helper/bats-support/load'
load 'test_helper/bats-assert/load'

teardown() {
  jenv global --unset
  jenv shell --unset
  rm -f ~/.jenv/versions/*
}

get-build-number() {
  local _prefix=$1
  local _name_prefix=$(basename $_prefix)
  basename $_prefix* | sed -E "s|$_name_prefix([0-9]+)[-.].*|\1|g"
}

@test "add openjdk 1.8.0" {
  _BUILD_NO=$(get-build-number /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.)
  jenv add /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.*/jre/

  run jenv versions
  assert_line --regexp '^ *1.8$'
  assert_line --regexp "^ *1.8.0.${_BUILD_NO}$"
  assert_line --regexp "^ *openjdk64-1.8.0.${_BUILD_NO}$"
}

@test "add openjdk 11" {
  _PATCH_NO=$(get-build-number /usr/lib/jvm/java-11-openjdk-11.0.)
  jenv add /usr/lib/jvm/java-11-openjdk-11.0.*/

  run jenv versions
  assert_line --regexp '^ *11$'
  assert_line --regexp '^ *11.0$'
  assert_line --regexp "^ *11.0.${_PATCH_NO}$"
  assert_line --regexp "^ *openjdk64-11.0.${_PATCH_NO}$"
}

@test "add openjdk 17" {
  _PATCH_NO=$(get-build-number /usr/lib/jvm/java-17-openjdk-17.0.)
  jenv add /usr/lib/jvm/java-17-openjdk-17.0.*/

  run jenv versions
  assert_line --regexp '^ *17$'
  assert_line --regexp '^ *17.0$'
  assert_line --regexp "^ *17.0.${_PATCH_NO}$"
  assert_line --regexp "^ *openjdk64-17.0.${_PATCH_NO}$"
}

@test "add openjdk 21" {
  _PATCH_NO=$(get-build-number /usr/lib/jvm/java-21-openjdk-21.0.)
  jenv add /usr/lib/jvm/java-21-openjdk-21.0.*/

  run jenv versions
  assert_line --regexp '^ *21$'
  assert_line --regexp '^ *21.0$'
  assert_line --regexp "^ *21.0.${_PATCH_NO}$"
  assert_line --regexp "^ *openjdk64-21.0.${_PATCH_NO}$"
}

@test "add zulu 11" {
  jenv add /usr/lib/jvm/zulu11/

  run jenv versions
  assert_line --regexp '^ *11$'
  assert_line --regexp '^ *11.0$'
  assert_line --regexp '^ *11.0.[0-9]+$'
  assert_line --regexp '^ *zulu64-11.0.[0-9]+$'
}

@test "add zulu 18.0.2.1" {
  jenv add /usr/lib/jvm/zulu18/

  run jenv versions
  assert_line --regexp '^ *18$'
  assert_line --regexp '^ *18.0$'
  assert_line --regexp '^ *18.0.2.1$'
  assert_line --regexp '^ *zulu64-18.0.2.1$'
}

@test "add graalvm 11.0.20" {
  jenv add /usr/lib/jvm/graalvm-ce-java11-22.3.3/

  run jenv versions
  assert_line --regexp '^ *11$'
  assert_line --regexp '^ *11.0$'
  assert_line --regexp '^ *11.0.20$'
  assert_line --regexp '^ *graalvm64-11.0.20$'
}
