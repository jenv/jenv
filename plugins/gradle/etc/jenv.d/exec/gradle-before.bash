if [ "$1" = "gradle" ]; then            
  exportVariable GRADLE_OPTS $JENV_OPTIONS
  unset JENV_OPTIONS        
fi