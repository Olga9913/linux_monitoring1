#!/bin/bash
. ./print.sh

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

print_system_research

while [ 1 ]
do
    echo "Do you want to save the text into a file? Y/N"
    read save
    if [ "$save" = "Y" ] || [ "$save" = 'y' ]; then
    date_status=$(date "+%d_%m_%y_%H_%M_%S")
    file="$date_status.status"
    print_system_research >> $file
    break
    fi
    if [ "$save" = "N" ] || [ "$save" = 'n' ]; then
    break
    fi
    echo "Type Y/y | N/n"
done

