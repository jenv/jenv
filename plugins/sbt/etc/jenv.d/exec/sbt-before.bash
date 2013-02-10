if [ "$1" = "sbt" ]; then            
  if [ -n "$JENV_OPTIONS" -a -z "$SBT_OPTS" ]; then
    exportVariable SBT_OPTS $JENV_OPTIONS
    unset JENV_OPTIONS        
  fi      
fi