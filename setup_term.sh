#!/usr/bin/env bash

if [ $# -lt 1 ];
    then echo "Provide indentation style: 'py' or 'c'"
    echo "Optionally provide 'n' as second arg for no restart"
elif [ $# -eq 1 ]; then
    python ~/set_indent_style.py $1
    echo "Finished setting indent style..."
    echo "Restarting bash so .bashrc takes effect..."
    exec bash
elif [ "$2" == "n" ]; then
    python ~/set_indent_style.py $1
    echo "Finished setting indent style..."
else
    echo "Args: [indent style] ['n' if no restart]"
fi

