if [ "$1" = "mvn" ]; then            
  exportVariable MAVEN_OPTS $JENV_OPTIONS
  unset JENV_OPTIONS        
fi