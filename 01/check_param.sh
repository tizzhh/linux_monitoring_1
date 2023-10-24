#!/bin/bash

function validate_parameter {
    local len=$#
    if [ $len -ne 1 ]
    then
        echo "script uses only 1 parameter"
        exit 2
    fi

    local param=$1
    if [[ $param =~ ^[0-9]+$ ]]
    then
        echo "invalid input"
        exit 2
    else
        echo $param
    fi
}
