#!/bin/bash
. ./print.sh

if [[ -n $5 ]]
then
    echo "Can't be more than 4 parameters"
else
    if [[ -n $4 ]]
    then
        re="^[1-6]$"
        if [[ $1 =~ $re ]] && [[ $2 =~ $re ]] && [[ $3 =~ $re ]] && [[ $4 =~ $re ]]
        then
            if [[ $1 != $2 ]] && [[ $3 != $4 ]]
            then
                HOSTNAME=$(hostname)
                sudo timedatectl set-timezone Europe/Moscow
                TIMEZONE=$(timedatectl | grep -oP 'Time zone: \K.*')
                USER=$(whoami)
                OS=$(cat /etc/issue | awk '{print $1,$2,$3}' | sed -r '/^\s*$/d')
                DATE=$(date "+%d %b %Y %H:%M:%S")
                UPTIME=$(uptime -p)
                UPTIME_SEC=$(cat /proc/uptime | awk '{print $1}')
                IP=$(ip a | grep "dynamic enp0s3" | awk '{print $2}')
                MASK=$(ifconfig | sed -n '/enp0s3/,/^$/{/^$/d; p}' | grep netmask | awk '{print $4}')
                GATEWAY=$(ip route | grep default | awk '{print $3}')
                RAM_TOTAL=$(free -m | awk '/Mem:/{printf "%.3f GB", $2/1024}')
                RAM_USED=$(free -m | awk '/Mem:/{printf "%.3f GB", $3/1024}')
                RAM_FREE=$(free -m | awk '/Mem:/{printf "%.3f GB", $4/1024}')
                SPACE_ROOT=$(df /root/ | awk '/\/$/ {printf "%.2f MB", $2/1024}')
                SPACE_ROOT_USED=$(df /root/ | awk '/\/$/ {printf "%.2f MB", $3/1024}')
                SPACE_ROOT_FREE=$(df /root/ | awk '/\/$/ {printf "%.2f MB", $4/1024}')

                get_colour $1
                left_background="\033[4$?m"
                get_colour $2
                left_text="\033[3$?m"
                get_colour $3
                right_background="\033[4$?m"
                get_colour $4
                right_text="\033[3$?m"
                default_colour="\033[37m\033[0m"
            
                print_system_data
            else
                echo "par 1!=2 and par 3!=4"
            fi
        else
            echo "par is 1-6"
        fi
    else
        echo "Should be 4 parameters"
    fi
fi