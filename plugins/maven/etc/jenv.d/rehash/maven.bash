remove_from_path() {
  local path_to_remove="$(expand_path "$1")"
  local result=""

  if [ -z "$path_to_remove" ]; then
    echo "${PATH}"
    return
  fi

  local paths
  IFS=: paths=($PATH)

  for path in "${paths[@]}"; do
    path="$(expand_path "$path" || true)"
    if [ -n "$path" ] && [ "$path" != "$path_to_remove" ]; then
      result="${result}${path}:"
    fi
  done

  echo "${result%:}"
}

expand_path() {
  if [ ! -d "$1" ]; then
    return 1
  fi

  local cwd="$(pwd)"
  cd "$1"
  pwd
  cd "$cwd"
}

backuppath=$PATH

PATH="$(remove_from_path "${JENV_ROOT}/shims")"
MAVEN_BIN="$(command -v "mvn" || true)"

PATH=$backuppath

#echo "make shims $MAVEN_BIN"
make_shims "$MAVEN_BIN"

