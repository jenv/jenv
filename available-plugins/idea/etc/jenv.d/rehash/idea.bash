

backuppath=$PATH

PATH="$(remove_from_path "${JENV_ROOT}/shims")"
IDEA_BIN="$(command -v "idea" || true)"


PATH=$backuppath

make_shims "$IDEA_BIN"


