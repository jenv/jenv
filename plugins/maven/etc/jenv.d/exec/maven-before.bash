if [ "$1" = "mvn" ]; then            
  if [ -n "$JENV_OPTIONS" -a -z "$MAVEN_OPTS" ]; then
    exportVariable MAVEN_OPTS $JENV_OPTIONS
    unset JENV_OPTIONS        
  fi
fi
