if [ "$1" = "mvn" ]; then            
  if [ -n "$JENV_OPTIONS" ]; then
    if [ -z "$MAVEN_OPTS" ]; then
      exportVariable MAVEN_OPTS $JENV_OPTIONS
    else
      echo "MAVEN_OPTS is set and not overridden by jenv"
    fi
    unset JENV_OPTIONS        
  fi
fi
