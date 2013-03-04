

backuppath=$PATH

PATH="$(remove_from_path "${JENV_ROOT}/shims")"
SBT_BIN="$(command -v "sbt" || true)"


PATH=$backuppath

make_shims "$SBT_BIN"  


