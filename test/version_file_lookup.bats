#!/usr/bin/env bats

load 'test_helper/bats-support/load'
load 'test_helper/bats-assert/load'

run_with_deadline() {
  bash -c '
    output=$(mktemp)
    "$@" >"$output" &
    pid=$!
    ( sleep 2; kill "$pid" 2>/dev/null ) &
    watcher=$!

    wait "$pid"
    rc=$?

    kill "$watcher" 2>/dev/null || true
    wait "$watcher" 2>/dev/null || true
    cat "$output"
    rm -f "$output"
    exit "$rc"
  ' bash "$@"
}

@test "version file lookup handles relative JENV_DIR without looping" {
  run run_with_deadline env JENV_ROOT="$HOME/.jenv" JENV_DIR=relative-root "$HOME/.jenv/libexec/jenv-version-file"

  assert_success
  assert_line "$HOME/.jenv/version"
}

@test "options file lookup handles relative JENV_DIR without looping" {
  run run_with_deadline env JENV_ROOT="$HOME/.jenv" JENV_DIR=relative-root "$HOME/.jenv/libexec/jenv-options-file"

  assert_success
  assert_line "$HOME/.jenv/options"
}
