

backuppath=$PATH

PATH="$(remove_from_path "${JENV_ROOT}/shims")"
GOLO_BIN="$(command -v "golo" || true)"
GOLOC_BIN="$(command -v "goloc" || true)"
GOLOGOLO_BIN="$(command -v "gologolo" || true)"


PATH=$backuppath

make_shims "$GOLOGOLO_BIN"    
make_shims "$GOLOC_BIN"  
make_shims "$GOLO_BIN"


