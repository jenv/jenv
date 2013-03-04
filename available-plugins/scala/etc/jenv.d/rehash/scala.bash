

backuppath=$PATH

PATH="$(remove_from_path "${JENV_ROOT}/shims")"
SCALA_BIN="$(command -v "scala" || true)"
SCALAC_BIN="$(command -v "scalac" || true)"


PATH=$backuppath

make_shims "$SCALA_BIN"    
make_shims "$SCALAC_BIN"  



