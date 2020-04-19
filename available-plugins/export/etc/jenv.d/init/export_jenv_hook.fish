# load jenv and enable export hook
function __jenv_export_hook --on-event fish_prompt
  set -gx JAVA_HOME (jenv javahome)
  set -gx JENV_FORCEJAVAHOME true

  if test -e "$JAVA_HOME/bin/javac"
    set -gx JDK_HOME "$JAVA_HOME"
    set -gx JENV_FORCEJDKHOME true
  end
end
