

backuppath=$PATH

PATH="$(remove_from_path "${JENV_ROOT}/shims")"
LEIN_BIN="$(command -v "lein" || true)"



PATH=$backuppath

make_shims "$LEIN_BIN"  


