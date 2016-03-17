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
jenv_emulate=`emulate`
emulate zsh

typeset -ag chpwd_functions
if [[ -z $chpwd_functions[(r)_jenv_export_hook] ]]; then
      chpwd_functions+=_jenv_export_hook;
fi

emulate $jenv_emulate
#export



_jenv_export_hook
