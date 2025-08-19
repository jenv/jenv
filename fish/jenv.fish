set -gx PATH $HOME/.jenv/shims $PATH
command jenv rehash 2>/dev/null
function jenv
  set -l cmd $argv[1]
  set -l arg ""
  if test (count $argv) -gt 1
    # Great... fish first array index is ... 1 !
    set arg $argv[2..-1]
  end

  switch "$cmd"
    case enable-plugin rehash shell shell-options
        set -l script (jenv "sh-$cmd" "$arg")
        eval $script
    case '*'
        command jenv $cmd $arg
    end
end
