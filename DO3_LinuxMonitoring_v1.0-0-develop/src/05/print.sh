#!/bin/bash

function count_folders_subfolders {
    echo "Total number of folders, including subfolders = $(find $1 2>/dev/null -type d | wc -l)"
}

function folders_largest_size {
    echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
    TOP_5=$(du -h $1 2>/dev/null | sort -hr | head -n 5)
    IFS=$'\n'
    COUNTER=1
    for text in ${TOP_5}
    do
    for string in $text
    do
    echo -n "$COUNTER - "
    echo  $string | awk '{print $2",",$1}'
    COUNTER=$[COUNTER + 1]
    done
    done
}

function count_files {
    echo "Total number of files = $(find $1 2>/dev/null -type f | wc -l)"
}

function different_files {
    echo "Number of:"
    echo "Configuration files (with the .conf extension) = $(find $1 2>/dev/null -type f -name "*.conf" | wc -l | awk '{print $1}')"
    echo "Text files = $(find $1 2>/dev/null -type f -name "*.txt" | wc -l | awk '{print $1}')"
    echo "Executable files = $(find $1 2>/dev/null -type f -executable | wc -l | awk '{print $1}')"
    echo "Log files (with the extension .log) = $(find $1 2>/dev/null -type f -name "*.log" | wc -l | awk '{print $1}')"
    echo "Archive files = $(find $1 2>/dev/null -type f -name "*.zip" -o -name "*.7z" -o -name "*.rar" -o -name "*.tar" | wc -l | awk '{print $1}')"
    echo "Symbolic links = $(find $1 2>/dev/null -type l | wc -l | awk '{print $1}')"
}

function top10_files_largest_size {
    echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
    TOP_10=$(find $1 2>/dev/null -type f -exec du -h {} + | sort -hr | head -10)
    IFS=$'\n'
    COUNTER=1
    for text in ${TOP_10}
    do
    for string in $text
    do
    echo -n "$COUNTER - "
    echo -n "$(echo $string | awk '{print $2", "}')"
    echo -n "$(echo $string | awk '{print $1", "}')"
    echo "$(echo $string | grep -m 1 -o -E "\.[^/.]+$" | awk -F . '{print $2}')"
    COUNTER=$[COUNTER + 1]
    done
    done
}

function top10_executable_files {
    echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
    TOP_10=$(find $1 2>/dev/null -type f -executable -exec du -h {} + | sort -hr | head -10)
    IFS=$'\n'
    COUNTER=1
    for text in ${TOP_10}
    do
    for string in $text
    do
    echo -n "$COUNTER - "
    echo -n "$(echo $string | awk '{print $2", "}')"
    echo -n "$(echo $string | awk '{print $1", "}')"
    get_hash=$(echo $string | awk '{print $2}')
    MD5=$(md5sum $get_hash | awk '{print $1}') 
    echo "$MD5"
    COUNTER=$[COUNTER + 1]
    done
    done
}

function execution_time {
    end=$(date +%s.%N)
    dur=$(echo "$end - $1" | bc); \
    printf "Script execution time (in seconds) = %.1f seconds\n" $dur
}
