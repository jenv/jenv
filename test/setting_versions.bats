#!/usr/bin/env bats

load 'test_helper/bats-support/load'
load 'test_helper/bats-assert/load'

setup() {
  export tmp_dir_1=`mktemp -d`
  export tmp_dir_2=`mktemp -d`
}

teardown() {
  jenv global --unset
  jenv shell --unset
  rm -f ~/.jenv/versions/*

  rm -rf $tmp_dir_1 $tmp_dir_2
}

@test "global version is set globally" {
  jenv add /usr/lib/jvm/graalvm-ce-java11-22.3.3/

  jenv global 11

  cd $tmp_dir_1

  assert_equal "$(jenv version-name)" 11
  [ $(realpath $(jenv javahome)) = "/usr/lib/jvm/graalvm-ce-java11-22.3.3" ]
}

@test "local is set for current directory" {
  jenv add /usr/lib/jvm/graalvm-ce-java11-22.3.3/
  jenv add /usr/lib/jvm/zulu18/

  jenv global 11

  cd $tmp_dir_1

  jenv local 18

  assert_equal "$(jenv version-name)" 18
  [ $(realpath $(jenv javahome)) = "/usr/lib/jvm/zulu18-ca" ]
}

@test "local is set for current directory only, reverts to global" {
  jenv add /usr/lib/jvm/graalvm-ce-java11-22.3.3/
  jenv add /usr/lib/jvm/zulu18/

  jenv global 11

  cd $tmp_dir_1

  jenv local 18

  cd $tmp_dir_2

  assert_equal "$(jenv version-name)" 11
  [ $(realpath $(jenv javahome)) = "/usr/lib/jvm/graalvm-ce-java11-22.3.3" ]
}

@test "shell sets for current shell" {
  jenv add /usr/lib/jvm/graalvm-ce-java11-22.3.3/
  jenv add /usr/lib/jvm/zulu18/

  jenv global 11

  output=$(jenv shell 18 && jenv version-name)
  assert_equal $output 18

  output=$(jenv shell 18 && realpath $(jenv javahome))
  [ $output = "/usr/lib/jvm/zulu18-ca" ]
}

@test "shell sets for current shell only, reverts to global outside" {
  jenv add /usr/lib/jvm/graalvm-ce-java11-22.3.3/
  jenv add /usr/lib/jvm/zulu18/

  jenv global 11
  
  $(jenv shell 18)

  assert_equal "$(jenv version-name)" 11
  [ $(realpath $(jenv javahome)) = "/usr/lib/jvm/graalvm-ce-java11-22.3.3" ]
}
