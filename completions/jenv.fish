function __fish_jenv_needs_command
  set cmd (commandline -opc)
  if [ (count $cmd) -eq 1 -a $cmd[1] = 'jenv' ]
    return 0
  end
  return 1
end

function __fish_jenv_using_command
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
end

complete -f -c jenv -n '__fish_jenv_needs_command' -a '(jenv commands)'
for cmd in (jenv commands)
  complete -f -c jenv -n "__fish_jenv_using_command $cmd" -a "(jenv completions $cmd)"
end
