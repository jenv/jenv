_jenv() {
  COMPREPLY=()
  local word="${COMP_WORDS[COMP_CWORD]}"

  if [ "$COMP_CWORD" -eq 1 ]; then
    COMPREPLY=( $(compgen -W "$(jenv commands)" -- "$word") )
  else
    local words=("${COMP_WORDS[@]}")
    unset words[0]
    unset words[$COMP_CWORD]
    local compgen_option=""
    if [ "${words[1]}" == "add" -a "$COMP_CWORD" -eq 3 ]; then
      compgen_option="-o nospace -o dirnames"
    fi
    local completions=$(jenv completions "${words[@]}")
    COMPREPLY=( $(compgen $compgen_option -W "$completions" -- "$word") )
  fi
}

complete -F _jenv jenv
