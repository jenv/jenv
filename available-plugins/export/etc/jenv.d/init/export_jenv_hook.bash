#export

_jenv_export_hook() {
  export JENV_FORCEJAVAHOME=
  export JENV_FORCEJDKHOME=
  export __JENV_CURRENT_VERSION
  export __JENV_LAST_VERSION=$__JENV_CURRENT_VERSION
  export __JENV_LAST_SYSTEM_JAVA_HOME

  local home
  if ! read -r __JENV_CURRENT_VERSION home < <(jenv javahome --detail 2>/dev/null)
  then
    return
  fi

  if [ "$__JENV_CURRENT_VERSION" = "system" ]
  then
    if [ -z "$__JENV_LAST_VERSION" ]
    then
      continue
    elif [ "$__JENV_LAST_VERSION" != "system" ]
    then
      home=$__JENV_LAST_SYSTEM_JAVA_HOME
    else
      __JENV_LAST_SYSTEM_JAVA_HOME=$home
    fi
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
