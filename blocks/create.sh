#!/bin/sh

path="$HOME/.wm/dwmblocks"
delim=$(printf "#%.0s" {1..60})

modules=0

if [ -n "$1" ]; then
    for arg in $@
    do
        # debug output
        [ -d $arg ] && printf "%-35s" "module '$arg' exists..." && echo "skipping" \
            && continue || printf "%-35s" "module '$arg' creating..."

        mkdir $arg

        # generate shebang
        echo -e "#!/bin/sh\n" | tee $arg/main.sh > $arg/event.sh
        
        # generate header
        echo -e "$delim\n# '$arg' module for dwmblocks\n#\n#"\
        "<description>\n$delim\n" >> $arg/main.sh

        # generate sections
        echo -e "# appearance\nicon='\\u'\ncolor='\x'\n\n#"\
        "output formats\nformats=()\nsource \"$path/handler.sh\"\n\n#"\
        "final output\noutput=\"\"\nget_index $arg && \\"\
        "\nprintf \"\$color\$icon \$output\"" >> $arg/main.sh

        # generate case statement
        echo -e "case \"\$1\" in \n    1) ;;\n    2) ;;\n"\
        "   3) ;;\n    4) ;;\n    5) ;;\n    6) ;;\n    7)"\
        ";;\nesac" >> $arg/event.sh

        # set execution permissions
        chmod +x $arg/main.sh $arg/event.sh

        ((modules++))

        echo "done"
    done

    [ $modules == 0 ] && echo "no modules were created" && exit 0
    echo "successfully created $modules module(s)"
fi