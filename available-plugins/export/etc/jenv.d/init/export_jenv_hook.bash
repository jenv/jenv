#export


 _jenv_export_hook() {
  export JAVA_HOME=$(jenv javahome)
  export JENV_FORCEJAVAHOME=true

  if [ -e "$JAVA_HOME/bin/javac" ]
  then
    export JDK_HOME="$JAVA_HOME"
    export JENV_FORCEJDKHOME=true
  fi
   }

if ! [[ "$PROMPT_COMMAND" =~ _jenv_export_hook ]]; then
    PROMPT_COMMAND="$PROMPT_COMMAND;_jenv_export_hook";
fi


_jenv_export_hook
