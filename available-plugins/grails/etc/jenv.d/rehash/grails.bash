

backuppath=$PATH

PATH="$(remove_from_path "${JENV_ROOT}/shims")"
GRAILS_BIN="$(command -v "grails" || true)"
make_shims "$GRAILS_BIN"    

GRAILS_DEBUG="$(command -v "grails-debug" || true)"
make_shims "$GRAILS_DEBUG"

PATH=$backuppath




