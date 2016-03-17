#export

 _jenv_export_hook() {
  export JAVA_HOME=$(jenv javahome)
  export JENV_FORCEJAVAHOME=true

  if [ -e "$JAVA_HOME/bin/javac" ]
  then
    export JDK_HOME=$(jenv javahome)
    export JENV_FORCEJDKHOME=true
  fi
 }

#echo "configure export plugin for ZSH"
typeset -ag chpwd_functions
if [[ -z $chpwd_functions[(r)_jenv_export_hook] ]]; then
      chpwd_functions+=_jenv_export_hook;
fi

#export



_jenv_export_hook