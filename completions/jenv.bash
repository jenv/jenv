_jenv() {
  COMPREPLY=()
  local word="${COMP_WORDS[COMP_CWORD]}"

  if [ "$COMP_CWORD" -eq 1 ]; then
    COMPREPLY=( $(compgen -W "$(jenv commands)" -- "$word") )
  else
    local words=("${COMP_WORDS[@]}")
    unset words[0]
    local completions=$(jenv completions "${words[@]}")
    COMPREPLY=( $(compgen -W "$completions" -- "$word") )
    # Prevents the addition of a trailing space when completing a path
    [[ $COMPREPLY = */ ]] && complete -o nospace
  fi
}

complete -F _jenv jenv
