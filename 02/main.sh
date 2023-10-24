#!/bin/bash

source system_data.sh

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
    echo "HOSTNAME = $HOSTNAME_var"
    echo "TIMEZONE = $TIMEZONE_var"
    echo "USER = $USER_var"
    echo "OS = $OS_var"
    echo "DATE = $DATE_var"
    echo "UPTIME = $UPTIME_var"
    echo "UPTIME_SEC = $UPTIME_secs"
    echo "IP = $IP_var"
    echo "MASK = $MASK_var"
    echo "GATEWAY = $GATEWAY_var"
    echo "RAM_TOTAL = $RAM_TOTAL_var GB"
    echo "RAM_USED = $RAM_USED_var GB"
    echo "RAM_FREE = $RAM_FREE_var GB"
    echo "SPACE_ROOT = $SPACE_ROOT_var MB"
    echo "SPACE_ROOT_USED = $SPACE_ROOT_USED_var MB"
    echo "SPACE_ROOT_FREE = $SPACE_ROOT_FREE_var MB"
}

save_system_data_to_file() {
    echo "save data to file (Y/N)?"
    read response

    if [[ "$response" == "Y" || "$response" == "y" ]]
    then
        local file="$(date +"%d_%m_%y_%H_%M_%S").status"
        print_system_data > "$file"
        echo "The data was saved in the file $file"
    fi
}

get_system_data
print_system_data
save_system_data_to_file

exit 0