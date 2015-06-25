

backuppath=$PATH

PATH="$(remove_from_path "${JENV_ROOT}/shims")"
VLT_BIN="$(command -v "vlt" || true)"
make_shims "$VLT_BIN"    

PATH=$backuppath
