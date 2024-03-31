#export

_jenv_export_hook() {
  if ! type -t jenv &>/dev/null
  then
    return
  fi

  export JENV_FORCEJAVAHOME=
  export JENV_FORCEJDKHOME=

  local home
  if ! home=$(jenv javahome 2>/dev/null)
  then
    return
  fi

  export JAVA_HOME=$home
  export JENV_FORCEJAVAHOME=true

  if [ -e "$JAVA_HOME/bin/javac" ]
  then
    export JDK_HOME="$JAVA_HOME"
    export JENV_FORCEJDKHOME=true
  fi
}

if ! [[ "$PROMPT_COMMAND" =~ _jenv_export_hook ]]; then
  PROMPT_COMMAND="_jenv_export_hook;$PROMPT_COMMAND";
fi

_jenv_export_hook
