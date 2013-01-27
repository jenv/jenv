

backuppath=$PATH

PATH="$(remove_from_path "${JENV_ROOT}/shims")"
ANT_BIN="$(command -v "ant" || true)"

PATH=$backuppath

#echo "make shims $MAVEN_BIN"
make_shims "$ANT_BIN"   


