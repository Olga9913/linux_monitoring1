#!/bin/bash
. ./print.sh

start=$(date +%s.%N)

if [[ -n $2 ]]
then
    echo "Can't be more than 1 parameter"
else
    if [[ -n $1 ]]
    then
        if [[ -d $1 ]]
        then
            if [[ ${1: -1} = "/" ]]
            then
                count_folders_subfolders $1
                folders_largest_size $1
                count_files $1
                different_files $1
                top10_files_largest_size $1
                top10_executable_files $1
                execution_time $start
            else
            echo "The directory should end with '/'"
            fi   
        else
            echo "This file doesn't exist or not a directory"
        fi
    else
        echo "Can't be less than 1 parameter"
    fi
fi