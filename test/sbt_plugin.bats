#!/usr/bin/env bats

load 'test_helper/bats-support/load'
load 'test_helper/bats-assert/load'

setup() {
  export JENV_ROOT="$BATS_TEST_TMPDIR/jenv"
  export JENV_VERSION=test
  export JENV_DIR="$BATS_TEST_TMPDIR"
  export JENV_HOOK_PATH="$BATS_TEST_DIRNAME/../available-plugins/sbt/etc/jenv.d"
  unset JENV_OPTIONS SBT_OPTS

  mkdir -p "$JENV_ROOT/versions/test/bin"
  cat > "$JENV_ROOT/versions/test/bin/sbt" <<'SCRIPT'
#!/usr/bin/env bash
printf 'arg=<%s>\n' "$@"
printf 'SBT_OPTS=<%s>\n' "$SBT_OPTS"
SCRIPT
  chmod +x "$JENV_ROOT/versions/test/bin/sbt"
  cp "$JENV_ROOT/versions/test/bin/sbt" "$JENV_ROOT/versions/test/bin/java"
}

@test "sbt receives the Java home without literal quotes" {
  run "$BATS_TEST_DIRNAME/../bin/jenv" exec sbt compile "testOnly ExampleSpec" ""

  assert_success
  assert_line --index 0 'arg=<-java-home>'
  assert_line --index 1 "arg=<$JENV_ROOT/versions/test>"
  assert_line --index 2 'arg=<compile>'
  assert_line --index 3 'arg=<testOnly ExampleSpec>'
  assert_line --index 4 'arg=<>'
  assert_line --index 5 'SBT_OPTS=<>'
}

@test "sbt keeps spaces and quotes in the Java home in one argument" {
  mv "$JENV_ROOT" "$JENV_ROOT home's [test]"
  export JENV_ROOT="$JENV_ROOT home's [test]"

  run "$BATS_TEST_DIRNAME/../bin/jenv" exec sbt --version

  assert_success
  assert_line --index 0 'arg=<-java-home>'
  assert_line --index 1 "arg=<$JENV_ROOT/versions/test>"
  assert_line --index 2 'arg=<--version>'
  assert_line --index 3 'SBT_OPTS=<>'
}

@test "sbt still receives jenv options through SBT_OPTS" {
  export JENV_OPTIONS='-Xmx1g -Dexample=value'

  run "$BATS_TEST_DIRNAME/../bin/jenv" exec sbt compile

  assert_success
  assert_line --index 0 'arg=<-java-home>'
  assert_line --index 1 "arg=<$JENV_ROOT/versions/test>"
  assert_line --index 2 'arg=<compile>'
  assert_line --index 3 "SBT_OPTS=<$JENV_OPTIONS>"
}

@test "sbt leaves existing SBT_OPTS unchanged" {
  export JENV_OPTIONS=-Xmx1g
  export SBT_OPTS=-Xmx2g

  run "$BATS_TEST_DIRNAME/../bin/jenv" exec sbt compile

  assert_success
  assert_line 'SBT_OPTS is set and not overridden by jenv'
  assert_line "arg=<$JENV_ROOT/versions/test>"
  assert_line 'SBT_OPTS=<-Xmx2g>'
  refute_line 'arg=<-Xmx1g>'
}

@test "sbt plugin leaves other commands alone" {
  run "$BATS_TEST_DIRNAME/../bin/jenv" exec java -version

  assert_success
  assert_output $'arg=<-version>\nSBT_OPTS=<>'
}
