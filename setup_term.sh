#!/usr/bin/env bash

if [ $# -ne 1 ];
    then echo "Provide indentation style: 'py' or 'c'"
else
    python set_indent_style.py $1
    echo "Finished setting indent style..."
    echo "Restarting bash so .bashrc takes effect..."
    exec bash
fi

