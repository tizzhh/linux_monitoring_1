#!/bin/bash

source system_data.sh

source checks.sh

validate_file

BLACK="\033[30m"
RED="\033[31m"
GREEN="\033[32m"
BLUE="\033[34m"
PURPLE="\033[35m"
WHITE="\033[37m"

BG_BLACK="\033[40m"
BG_RED="\033[41m"
BG_GREEN="\033[42m"
BG_BLUE="\033[44m"
BG_PURPLE="\033[45m"
BG_WHITE="\033[47m"

RESET_COLOR="\033[0m"

font_colors=("" "$WHITE" "$RED" "$GREEN" "$BLUE" "$PURPLE" "$BLACK")
bg_colors=("" "$BG_WHITE" "$BG_RED" "$BG_GREEN" "$BG_BLUE" "$BG_PURPLE" "$BG_BLACK")

get_color_name() {
    local color_number=$1

    case $color_number in
        1) echo "white";;
        2) echo "red";;
        3) echo "green";;
        4) echo "blue";;
        5) echo "purple";;
        6) echo "black";;
    esac
}

source config.cfg
column1_background=$column1_background
column1_font_color=$column1_font_color
column2_background=$column2_background
column2_font_color=$column2_font_color

if [[ "$column1_background" ==  "$column1_font_color" ]]
then
    column1_background="a"
    column1_font_color="a"
fi
if [[ "$column2_background" ==  "$column2_font_color" ]]
then
    column2_background="a"
    column2_font_color="a"
fi

parameter_1="${bg_colors[$column1_background]}"
parameter_2="${font_colors[$column1_font_color]}"
parameter_3="${bg_colors[$column2_background]}"
parameter_4="${font_colors[$column2_font_color]}"

column1_background_name=$(get_color_name ${column1_background})
column1_font_color_name=$(get_color_name ${column1_font_color})
column2_background_name=$(get_color_name ${column2_background})
column2_font_color_name=$(get_color_name ${column2_font_color})

check_default

get_system_data() {
    HOSTNAME_var=$(get_hostname)
    TIMEZONE_var=$(get_timezone)
    USER_var=$(get_user)
    OS_var=$(get_os_version)
    DATE_var=$(get_date)
    UPTIME_var=$(get_uptime)
    UPTIME_secs=$(get_uptime_secs)
    IP_var=$(get_ip)
    MASK_var=$(get_subnet_mask)
    GATEWAY_var=$(get_gateway)
    RAM_TOTAL_var=$(get_ram_total)
    RAM_USED_var=$(get_ram_used)
    RAM_FREE_var=$(get_ram_free)
    SPACE_ROOT_var=$(get_space_root)
    SPACE_ROOT_USED_var=$(get_space_root_used)
    SPACE_ROOT_FREE_var=$(get_space_root_free)
}

print_system_data() {
    echo -e "${parameter_1}${parameter_2}HOSTNAME${RESET_COLOR} = ${parameter_3}${parameter_4}$HOSTNAME_var${RESET_COLOR}"
    echo -e "${parameter_1}${parameter_2}TIMEZONE${RESET_COLOR} = ${parameter_3}${parameter_4}$TIMEZONE_var${RESET_COLOR}"
    echo -e "${parameter_1}${parameter_2}USER${RESET_COLOR} = ${parameter_3}${parameter_4}$USER_var${RESET_COLOR}"
    echo -e "${parameter_1}${parameter_2}OS${RESET_COLOR} = ${parameter_3}${parameter_4}$OS_var${RESET_COLOR}"
    echo -e "${parameter_1}${parameter_2}DATE${RESET_COLOR} = ${parameter_3}${parameter_4}$DATE_var${RESET_COLOR}"
    echo -e "${parameter_1}${parameter_2}UPTIME${RESET_COLOR} = ${parameter_3}${parameter_4}$UPTIME_var${RESET_COLOR}"
    echo -e "${parameter_1}${parameter_2}UPTIME_SEC${RESET_COLOR} = ${parameter_3}${parameter_4}$UPTIME_secs${RESET_COLOR}"
    echo -e "${parameter_1}${parameter_2}IP${RESET_COLOR} = ${parameter_3}${parameter_4}$IP_var${RESET_COLOR}"
    echo -e "${parameter_1}${parameter_2}MASK${RESET_COLOR} = ${parameter_3}${parameter_4}$MASK_var${RESET_COLOR}"
    echo -e "${parameter_1}${parameter_2}GATEWAY${RESET_COLOR} = ${parameter_3}${parameter_4}$GATEWAY_var${RESET_COLOR}"
    echo -e "${parameter_1}${parameter_2}RAM_TOTAL${RESET_COLOR} = ${parameter_3}${parameter_4}$RAM_TOTAL_var GB${RESET_COLOR}"
    echo -e "${parameter_1}${parameter_2}RAM_USED${RESET_COLOR} = ${parameter_3}${parameter_4}$RAM_USED_var GB${RESET_COLOR}"
    echo -e "${parameter_1}${parameter_2}RAM_FREE${RESET_COLOR} = ${parameter_3}${parameter_4}$RAM_FREE_var GB${RESET_COLOR}"
    echo -e "${parameter_1}${parameter_2}SPACE_ROOT${RESET_COLOR} = ${parameter_3}${parameter_4}$SPACE_ROOT_var MB${RESET_COLOR}"
    echo -e "${parameter_1}${parameter_2}SPACE_ROOT_USED${RESET_COLOR} = ${parameter_3}${parameter_4}$SPACE_ROOT_USED_var MB${RESET_COLOR}"
    echo -e "${parameter_1}${parameter_2}SPACE_ROOT_FREE${RESET_COLOR} = ${parameter_3}${parameter_4}$SPACE_ROOT_FREE_var MB${RESET_COLOR}"
}

print_color_scheme() {
    echo "Column 1 background = ${column1_background} ($column1_background_name)"
    echo "Column 1 font color = ${column1_font_color} ($column1_font_color_name)"
    echo "Column 2 background = ${column2_background} ($column2_background_name)"
    echo "Column 2 font color = ${column2_font_color} ($column2_font_color_name)"
}

get_system_data
print_system_data
print_color_scheme

exit 0