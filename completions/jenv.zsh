if [[ ! -o interactive ]]; then
    return
fi

compctl -K _jenv jenv

_jenv() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(jenv commands)"
  else
    completions="$(jenv completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
