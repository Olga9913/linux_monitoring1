#!/bin/bash

if [[ -n $1 ]]
then
    if [[ -n $2 ]]
    then
        echo "The number of arguments provided is incorrect. Please provide one arg."
    else
        re='^[+-]?[0-9]+([.][0-9]+)?$'
        num='[0-9]+'
        if ! [[ $1 =~ $re ]]
        then
            if [[ $1 =~ [0-9] ]];then
                echo "Input contains number"
            else
                echo $1
            fi
        else
            echo "error: The parameter can't be a number"
        fi
    fi
else
    echo "There are no parametres at all. Enter one parameter"  
fi