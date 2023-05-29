#!/bin/bash

function print_system_data {
    get_colour $1
    left_background="\033[4$?m"
    get_colour $2
    left_text="\033[3$?m"
    get_colour $3
    right_background="\033[4$?m"
    get_colour $4
    right_text="\033[3$?m"
    default_colour="\033[37m\033[0m"

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
    info_colours default_flag
}

function get_colour {
    res=0
    case "$1" in
    1) res=7 ;;
    2) res=1 ;;
    3) res=2 ;;
    4) res=6 ;;
    5) res=5 ;;
    6) res=0 ;;
    esac
    return $res
}

function info_colours {
    echo -e "\nColumn 1 background = $(if [[ $1 -eq 0 ]]; then echo -n ${column1_background}; text_colour ${column1_background}; else default_colours ${column1_background_default}; fi)"
    echo "Column 1 font color = $(if [[ $1 -eq 0 ]] ; then echo -n ${column1_font_color}; text_colour ${column1_font_color}; else default_colours ${column1_font_color_default}; fi)"
    echo "Column 2 background = $(if [[ $1 -eq 0 ]] ; then echo -n ${column2_background}; text_colour ${column2_background}; else default_colours ${column2_background_default}; fi)"
    echo "Column 2 font color = $(if [[ $1 -eq 0 ]] ; then echo -n ${column2_font_color}; text_colour ${column2_font_color}; else default_colours ${column2_font_color_default}; fi)"
}

function text_colour {
    case "$1" in
    1) echo " (white)" ;;
    2) echo " (red)" ;;
    3) echo " (green)" ;;
    4) echo " (blue)" ;;
    5) echo " (purple)" ;;
    6) echo " (black)" ;;
    esac
}

function default_colours {
    case "$1" in
    1) echo " default (white)" ;;
    2) echo " default (red)" ;;
    3) echo " default (green)" ;;
    4) echo " default (blue)" ;;
    5) echo " default (purple)" ;;
    6) echo " default (black)" ;;
    esac
}