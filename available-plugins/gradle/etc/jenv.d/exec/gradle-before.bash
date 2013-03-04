if [ "$1" = "gradle" ]; then            
  if [ -n "$JENV_OPTIONS" ]; then
    if [ -z "$GRADLE_OPTS" ]; then
      exportVariable GRADLE_OPTS $JENV_OPTIONS
    else
      echo "GRADLE_OPTS is set and not overridden by jenv"
    fi
    unset JENV_OPTIONS        
  fi
fi
