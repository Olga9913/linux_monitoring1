#!/bin/bash

function print_system_data {
    echo -e "${left_background}${left_text}HOSTNAME${default_colour} = ${right_background}${right_text}$HOSTNAME${default_colour}"
    echo -e "${left_background}${left_text}TIMEZONE${default_colour} = ${right_background}${right_text}$TIMEZONE${default_colour}"
    echo -e "${left_background}${left_text}USER${default_colour} = ${right_background}${right_text}$USER${default_colour}"
    echo -e "${left_background}${left_text}OS${default_colour} = ${right_background}${right_text}$OS${default_colour}"
    echo -e "${left_background}${left_text}DATE${default_colour} = ${right_background}${right_text}$DATE${default_colour}"
    echo -e "${left_background}${left_text}UPTIME${default_colour} = ${right_background}${right_text}$UPTIME${default_colour}"
    echo -e "${left_background}${left_text}UPTIME_SEC${default_colour} = ${right_background}${right_text}$UPTIME_SEC${default_colour}"
    echo -e "${left_background}${left_text}IP${default_colour} = ${right_background}${right_text}$IP${default_colour}"
    echo -e "${left_background}${left_text}MASK${default_colour} = ${right_background}${right_text}$MASK${default_colour}"
    echo -e "${left_background}${left_text}GATEWAY${default_colour} = ${right_background}${right_text}$GATEWAY${default_colour}"
    echo -e "${left_background}${left_text}RAM_TOTAL${default_colour} = ${right_background}${right_text}$RAM_TOTAL${default_colour}"
    echo -e "${left_background}${left_text}RAM_USED${default_colour} = ${right_background}${right_text}$RAM_USED${default_colour}"
    echo -e "${left_background}${left_text}RAM_FREE${default_colour} = ${right_background}${right_text}$RAM_FREE${default_colour}"
    echo -e "${left_background}${left_text}SPACE_ROOT${default_colour} = ${right_background}${right_text}$SPACE_ROOT${default_colour}"
    echo -e "${left_background}${left_text}SPACE_ROOT_USED${default_colour} = ${right_background}${right_text}$SPACE_ROOT_USED${default_colour}"
    echo -e "${left_background}${left_text}SPACE_ROOT_FREE${default_colour} = ${right_background}${right_text}$SPACE_ROOT_FREE${default_colour}"
}

function get_colour {
    res=0
    case "$1" in
        1) res=7 ;;
        2) res=1 ;;
        3) res=2 ;;
        4) res=4 ;;
        5) res=5 ;;
        6) res=0 ;;
    esac
    return $res
}