#!bin/bash

validate_file() {
    if ! [ -f "config.cfg" ]
    then
        echo "file config.cfg doesn't exist"
        exit 1
    fi
}

check_parameters() {
    if ! [[ $column1_background =~ ^[1-6]$ ]]
    then
        column1_background=6
        parameter_1="${bg_colors[$column1_background]}"
        column1_background_name=$(get_color_name ${column1_background})
        column1_background="default"
    fi
    if ! [[ $column1_font_color =~ ^[1-6]$ ]]
    then
        column1_font_color=1
        parameter_2="${font_colors[$column1_font_color]}"
        column1_font_color_name=$(get_color_name ${column1_font_color})
        column1_font_color="default"
    fi
    if ! [[ $column2_background =~ ^[1-6]$ ]]
    then
        column2_background=2
        parameter_3="${bg_colors[$column2_background]}"
        column2_background_name=$(get_color_name ${column2_background})
        column2_background="default"
    fi
    if ! [[ $column2_font_color =~ ^[1-6]$ ]]
    then
        column2_font_color=4
        parameter_4="${font_colors[$column2_font_color]}"
        column2_font_color_name=$(get_color_name ${column2_font_color})
        column2_font_color="default"
    fi
}