function jenv -w jenv --description "Wrapper function for jenv to work with fish shell"
    set cmd $argv[1]
    set arg ""
    if test (count $argv) -gt 1
        # Great... fish first array index is ... 1 !
        set arg $argv[2..-1]
    end

    switch "$cmd"
        case enable-plugin rehash shell shell-options
            set script (jenv "sh-$cmd" "$arg")
            eval $script
        case '*'
            command jenv $cmd $arg
    end
end
