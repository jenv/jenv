

backuppath=$PATH

PATH="$(remove_from_path "${JENV_ROOT}/shims")"
GRAILS_BIN="$(command -v "spring" || true)"
make_shims "$GRAILS_BIN"    



PATH=$backuppath




