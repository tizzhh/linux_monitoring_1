#!bin/bash

validate_parameter() {
    if [ $# -ne 4 ]
    then
        echo "Usage: bash main.sh [bg color of value names] [font color of value names] [bg color of values] [font color of values]"
        exit 2
    fi

    for param in "$@"
    do
        if ! [[ $param =~ ^[1-6]$ ]]
        then
            echo "parameters should be either 1, or 2, or 3, or 4, or 5, or 6"
            exit 2
        fi
    done

    if [[ "$1" == "$2" || "$3" == "$4" ]]
    then
        echo "parameters 1 and 2 or 3 and 4 must not be the same"
        exit 2
    fi
}