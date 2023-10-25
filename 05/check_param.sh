#!bin/bash

validate_parameter() {
    if [ $# -ne 1 ]
    then
        echo "Usage: sudo bash main.sh [relative/absolute path with an / at the end]"
        exit 2
    fi

    if ! [ -d $1 ]
    then
        echo "This directory doesn't exist"
        exit 2
    fi

    end_slash_status=$(echo "$1" | grep -E "/$")
    if [[ -z "$end_slash_status" ]]
    then
        echo "There should be an / at the end of the parameter"
        exit 2
    fi
}