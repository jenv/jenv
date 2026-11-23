if [ "$1" = "sbt" ]; then
  if [ -n "$JENV_OPTIONS" ]; then
    if [ -z "$SBT_OPTS" ]; then
      exportVariable SBT_OPTS "$JENV_OPTIONS"
    else
      echo "SBT_OPTS is set and not overridden by jenv"
    fi
    unset JENV_OPTIONS
  fi
  # Keep the command at $1 for jenv-exec's shift and the Java home in one argument.
  set -- "$1" -java-home "$JAVA_HOME" "${@:2}"
fi
