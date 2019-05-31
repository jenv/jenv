#export

function jenv_set_java_home_preexec --on-event fish_preexec
    set -gx JAVA_HOME (jenv javahome)
    set -gx JENV_FORCEJAVAHOME true

    if test -e "$JAVA_HOME/bin/javac"
        set -gx JDK_HOME "$JAVA_HOME"
        set -gx JENV_FORCEJAVAHOME true
    end
end

jenv_set_java_home_preexec
