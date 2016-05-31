#export


_jenv_export_hook() {
  local error_code=$?
  export JAVA_HOME=$(jenv javahome)
  export JENV_FORCEJAVAHOME=true

  if [ -e "$JAVA_HOME/bin/javac" ]
  then
    export JDK_HOME=$JAVA_HOME
    export JENV_FORCEJDKHOME=true
  fi
  $(exit $error_code)
}

if ! [[ "$PROMPT_COMMAND" =~ _jenv_export_hook ]]; then
    PROMPT_COMMAND="_jenv_export_hook;$PROMPT_COMMAND";
fi


_jenv_export_hook
