

backuppath=$PATH

PATH="$(remove_from_path "${JENV_ROOT}/shims")"
GROOVY_BIN="$(command -v "groovy" || true)"
make_shims "$GROOVY_BIN"    

GROOVY_BIN="$(command -v "groovyConsole" || true)"
make_shims "$GROOVY_BIN"               

GROOVY_BIN="$(command -v "groovyc" || true)"
make_shims "$GROOVY_BIN"         

GROOVY_BIN="$(command -v "groovysh" || true)"
make_shims "$GROOVY_BIN"


PATH=$backuppath




