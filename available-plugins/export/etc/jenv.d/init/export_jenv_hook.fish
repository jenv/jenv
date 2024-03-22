# load jenv and enable export hook
function __jenv_export_hook --on-event fish_prompt
  if not type -q jenv
    return
  end

  set -gx __JENV_CURRENT_VERSION $__JENV_CURRENT_VERSION
  set -gx __JENV_LAST_VERSION $__JENV_CURRENT_VERSION
  set -gx __JENV_LAST_SYSTEM_JAVA_HOME $__JENV_LAST_SYSTEM_JAVA_HOME
  set -gx JENV_FORCEJAVAHOME ""
  set -gx JENV_FORCEJDKHOME ""

  set -l home ""
  if ! jenv javahome --detail 2>/dev/null | read __JENV_CURRENT_VERSION home
    return
  end

  if [ "$__JENV_CURRENT_VERSION" = "system" ]
    if [ -z "$__JENV_LAST_VERSION" ]
      :
    else if [ "$__JENV_LAST_VERSION" != "system" ]
      set home $__JENV_LAST_SYSTEM_JAVA_HOME
    else
      set __JENV_LAST_SYSTEM_JAVA_HOME $home
    end
  end

  set -gx JAVA_HOME $home
  set -gx JENV_FORCEJAVAHOME true

  if test -e "$JAVA_HOME/bin/javac"
    set -gx JDK_HOME "$JAVA_HOME"
    set -gx JENV_FORCEJDKHOME true
  end
end
