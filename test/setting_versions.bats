#!/usr/bin/env bats

setup() {
  export PATH=$HOME/.jenv/bin/:$PATH

  eval "$(jenv init -)"
  jenv global --unset
  jenv shell --unset
  rm -f ~/.jenv/versions/*
}

@test "global version is set globally" {
  jenv add /usr/lib/jvm/graalvm-ce-java11-22.3.3/

  jenv global 11
  cd `mktemp -d`

  assert_equal "$(jenv version-name)" 11
  [ $(realpath $(jenv javahome)) = "/usr/lib/jvm/graalvm-ce-java11-22.3.3" ]
}

@test "local is set for current directory" {
  jenv add /usr/lib/jvm/graalvm-ce-java11-22.3.3/
  jenv add /usr/lib/jvm/zulu18/

  jenv global 11

  cd `mktemp -d`
  jenv local 18

  [ $(realpath $(jenv javahome)) = "/usr/lib/jvm/zulu18-ca" ]
}

@test "local is set for current directory only, reverts to global" {
  jenv add /usr/lib/jvm/graalvm-ce-java11-22.3.3/
  jenv add /usr/lib/jvm/zulu18/

  jenv global 11

  cd `mktemp -d`
  jenv local 18

  cd `mktemp -d`

  [ $(realpath $(jenv javahome)) = "/usr/lib/jvm/graalvm-ce-java11-22.3.3" ]
}

@test "shell sets for current shell" {
  jenv add /usr/lib/jvm/graalvm-ce-java11-22.3.3/
  jenv add /usr/lib/jvm/zulu18/

  jenv global 11
  
  output=$(jenv shell 18 && realpath $(jenv javahome))
  [ $output = "/usr/lib/jvm/zulu18-ca" ]
}

@test "shell sets for current shell only, reverts to global outside" {
  jenv add /usr/lib/jvm/graalvm-ce-java11-22.3.3/
  jenv add /usr/lib/jvm/zulu18/

  jenv global 11
  
  $(jenv shell 18)

  [ $(realpath $(jenv javahome)) = "/usr/lib/jvm/graalvm-ce-java11-22.3.3" ]
}
