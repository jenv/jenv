if [ "$1" = "ant" ]; then            
  if [ -n "$JENV_OPTIONS" ]; then
    if [ -z "$ANT_OPTS" ]; then
      exportVariable ANT_OPTS $JENV_OPTIONS
    else
      echo "ANT_OPTS is set and not overridden by jenv"
    fi
    unset JENV_OPTIONS        
  fi
fi
