

backuppath=$PATH

PATH="$(remove_from_path "${JENV_ROOT}/shims")"
GRADLE_BIN="$(command -v "gradle" || true)"

PATH=$backuppath

#echo "make shims $MAVEN_BIN"
make_shims "$GRADLE_BIN"   


