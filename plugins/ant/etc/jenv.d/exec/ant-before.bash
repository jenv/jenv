if [ "$1" = "ant" ]; then            
  exportVariable ANT_OPTS $JENV_OPTIONS
  unset JENV_OPTIONS        
fi