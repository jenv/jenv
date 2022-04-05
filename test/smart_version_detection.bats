#!/usr/bin/env bats

setup() {
  load 'test_helper/bats-support/load'
  load 'test_helper/bats-assert/load'

  export PATH=$HOME/.jenv/bin/:$PATH
  eval "$(jenv init -)"

  (jenv versions | grep graalvm-11.0.13-amd64 > /dev/null) || jenv add /usr/lib/jvm/graalvm-ce-java11-21.3.0/
  (jenv versions | grep openjdk-11.0.14.1-amd64 > /dev/null) || jenv add /usr/lib/jvm/java-11-openjdk-11.0.14.1.1-1.el7_9.x86_64/
  (jenv versions | grep zulu-11.0.15-amd64 > /dev/null) || jenv add /usr/lib/jvm/zulu-11/
  (jenv versions | grep zulu-11.0.15-i386 > /dev/null) || jenv add /usr/lib/jvm/zulu-11-x86/
  (jenv versions | grep zulu-18.0.1-amd64 > /dev/null) || jenv add /usr/lib/jvm/zulu-18/
  (jenv versions | grep zulu-18-i386 > /dev/null) || jenv add /usr/lib/jvm/zulu-18-x86/

  jenv global --unset
  jenv shell --unset
}

@test "Selecting Java version prefers JDK with same vendor and architecture" {
  jenv global zulu-18.0.1-amd64
  jenv global 11

  run jenv global
  assert_output "zulu-11.0.15-amd64"
}

@test "Selecting Java version prefers JDK with same vendor and architecture 2" {
  jenv global zulu-11.0.15-amd64
  jenv global 18

  run jenv global
  assert_output "zulu-18.0.1-amd64"
}

@test "Selecting Java version prefers JDK with same vendor and architecture 3" {
  jenv global zulu-11.0.15-i386
  jenv global 18

  run jenv global
  assert_output "zulu-18-i386"
}

@test "Selecting Java version prefers JDK with same architecture if no vendor matches" {
  jenv global openjdk-11.0.14.1-amd64
  jenv global 18

  run jenv global
  assert_output "zulu-18.0.1-amd64"
}

@test "Selecting more detailed Java version" {
  jenv global zulu-11.0.15-i386
  jenv global 11.0.14

  run jenv global
  assert_output "openjdk-11.0.14.1-amd64"
}

@test "Selecting provider" {
  jenv global zulu-11.0.15-i386
  jenv global openjdk

  run jenv global
  assert_output "openjdk-11.0.14.1-amd64"
}

@test "Selecting architecture" {
  jenv global zulu-11.0.15-i386
  jenv global amd64

  run jenv global
  assert_output "zulu-11.0.15-amd64"
}

