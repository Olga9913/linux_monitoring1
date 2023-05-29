#!/bin/bash
. ./print.sh
source ./config.conf

HOSTNAME=$(hostname)
timedatectl set-timezone Europe/Moscow
TIMEZONE=$(timedatectl | grep -oP 'Time zone: \K.*')
USER=$(whoami)
OS=$(cat /etc/issue | awk '{print $1,$2,$3}'| sed -r '/^\s*$/d')
DATE=$(date "+%d %b %Y %H:%M:%S")
UPTIME=$(uptime -p)
UPTIME_SEC=$(cat /proc/uptime | awk '{print $1}' )
IP=$(ip a | grep "dynamic enp0s3" | awk '{print $2}')
MASK=$(ifconfig | sed -n '/enp0s8/,/^$/{/^$/d; p}' | grep netmask | awk '{print $4}')
GATEWAY=$(ip route | grep default | awk '{print $3}')
RAM_TOTAL=$(free -m | awk '/Mem:/{printf "%.3f GB", $2/1024}')
RAM_USED=$(free -m | awk '/Mem:/{printf "%.3f GB", $3/1024}')
RAM_FREE=$(free -m | awk '/Mem:/{printf "%.3f GB", $4/1024}')
SPACE_ROOT=$(df /root/ | awk '/\/$/ {printf "%.2f MB", $2/1024}')
SPACE_ROOT_USED=$(df /root/ | awk '/\/$/ {printf "%.2f MB", $3/1024}')
SPACE_ROOT_FREE=$(df /root/ | awk '/\/$/ {printf "%.2f MB", $4/1024}')

re="^[1-6]$"
default_flag=0

if [[ $column1_background =~ $re ]] && [[ $column1_font_color =~ $re ]] && [[ $column2_background =~ $re ]] && [[ $column2_font_color =~ $re ]]
then
    if [[ $column1_background != $column1_font_color ]] && [[ $column2_background != $column2_font_color ]]
    then
        print_system_data ${column1_background} ${column1_font_color} ${column2_background} ${column2_font_color}
    else
        column1_background_default=6
        column1_font_color_default=1
        column2_background_default=6
        column2_font_color_default=1
        default_flag=1
        print_system_data ${column1_background_default} ${column1_font_color_default} ${column2_background_default} ${column2_font_color_default}
    fi
fi
