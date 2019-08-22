if [[ ! -o interactive ]]; then
    return
fi

compctl -S "" -K _jenv jenv

_jenv() {
  local words completions
  read -cA words

  if [ "${#words[@]}" -eq 2 ]; then
    completions="$(jenv commands)"
  else
    completions="$(jenv completions ${words[2,-1]})"
  fi

  reply=("${(ps:\n:)completions}")
}
