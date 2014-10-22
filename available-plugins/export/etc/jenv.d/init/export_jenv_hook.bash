#export

configureBash(){
	if ! [[ "$PROMPT_COMMAND" =~ _jenv_export_hook ]]; then
	  PROMPT_COMMAND="_jenv_export_hook;$PROMPT_COMMAND";
	fi
}

configureZsh(){
	echo "configure export plugin for ZSH"
	typeset -ag chpwd_functions
	if [[ -z $chpwd_functions[(r)_jenv_export_hook] ]]; then
    		chpwd_functions+=_jenv_export_hook;
	fi
}

 _jenv_export_hook() {
  export JAVA_HOME=$(jenv javahome)
  export JENV_FORCEJAVAHOME=true
   }


shell="$(basename "$SHELL")"

 case "$shell" in
  bash )
   configureBash
    ;;
  zsh )
	configureZsh
    ;;
  * )
   echo "$shell is not supported yet for export plugin"
    ;;
  esac




_jenv_export_hook