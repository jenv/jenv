if [ "$1" = "sbt" ]; then
  if [ -n "$JENV_OPTIONS" ]; then
    if [ -z "$SBT_OPTS" ]; then
      exportVariable SBT_OPTS "$JENV_OPTIONS"
    else
      echo "SBT_OPTS is set and not overridden by jenv"
    fi
    unset JENV_OPTIONS
  fi
  JENV_OPTIONS="$JENV_OPTIONS -java-home $JAVA_HOME"
fi
