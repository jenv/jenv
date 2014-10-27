#export


 _jenv_export_hook() {
  export JAVA_HOME=$(jenv javahome)
  export JENV_FORCEJAVAHOME=true
   }

if ! [[ "$PROMPT_COMMAND" =~ _jenv_export_hook ]]; then
    PROMPT_COMMAND="_jenv_export_hook;$PROMPT_COMMAND";
fi


_jenv_export_hook