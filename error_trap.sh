#!/bin/bash

onerror()
{
    status=$?
    script=$0
    line=$1
    shift

    args=
    for i in "$@"; do 
        args+="\"$i\" "
    done

    echo ""
    echo "------------------------------------------------------------"
    echo "Error occured on $script [Line $line]: Status $status"
    echo ""
    echo "PID: $$"
    echo "User: $USER"
    echo "Current directory: $PWD"
    echo "Command line: $script $args"
    echo "------------------------------------------------------------"
    echo ""
}

begintrap()
{
    set -e
    trap 'onerror $LINENO "$@"' ERR
}

begintrap
