

backuppath=$PATH

PATH="$(remove_from_path "${JENV_ROOT}/shims")"
MAVEN_BIN="$(command -v "mvn" || true)"
MAVEN_DEBUG="$(command -v "mvnDebug" || true)"


PATH=$backuppath

make_shims "$MAVEN_BIN"  
make_shims "$MAVEN_DEBUG"  


