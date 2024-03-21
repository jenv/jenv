if [ "$1" = "lein" ]; then
  exportVariable JAVA_CMD "$JAVA_HOME/bin/java"
  exportVariable LEIN_JAVA_CMD "$JAVA_HOME/bin/java"
  if [ -n "$JENV_OPTIONS" ]; then
    if [ -z "$LEIN_JVM_OPTS" ]; then
      exportVariable LEIN_JVM_OPTS "$JENV_OPTIONS"
      exportVariable JVM_OPTS "$JENV_OPTIONS"
    else
      echo "LEIN_JVM_OPTS is set and not overridden by jenv"
    fi
    unset JENV_OPTIONS
  fi
fi
