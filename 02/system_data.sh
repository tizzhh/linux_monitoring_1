#!bin/bash

get_hostname() {
    local hostname_val=$(hostname)
    echo "$hostname_val"
}

get_timezone() {
    local timezone_location=$(timedatectl show --property=Timezone --value)
    local timezone_offset=$(date +"UTC %z")
    timezone_offset=${timezone_offset/0}
    timezone_offset=${timezone_offset/%00/}
    echo "$timezone_location $timezone_offset"
}

get_user() {
    echo "$USER"
}

get_os_version() {
    local os_version=$(cat /etc/os-release | head -1 | sed 's/PRETTY_NAME="//;s/"//')
    echo "$os_version"
}

get_date() {
    local date=$(date "+%-e %B %Y %H:%M:%S")
    echo "$date"
}

get_uptime() {
    local uptime=$(uptime -p | sed 's/up //')
    echo "$uptime"
}

get_uptime_secs() {
    local uptime_secs=$(awk '{print $1}' /proc/uptime)
    echo "$uptime_secs"
}

get_ip() {
    local ip=$(hostname -I | awk '{print $1}')
    echo "$ip"
}

get_subnet_mask() {
    local subnet=$(ip -o -f inet addr show | awk '/scope global/ {print $4}' | head -1 | sed 's/.*\///')
    local subnet_mask=$((0xFFFFFFFF << (32 - $subnet)))
    local subnet_mask_dotted_decimal=$(printf "%d.%d.%d.%d\n" $((subnet_mask >> 24 & 255)) $((subnet_mask >> 16 & 255)) $((subnet_mask >> 8 & 255)) $((subnet_mask & 255)))
    echo "$subnet_mask_dotted_decimal"
}

get_gateway() {
    local gateway=$(ip route | awk '/default/ { print $3 }')
    echo "$gateway"
}

get_ram_total() {
    local total_ram=$(free | head -2 | tail -1 | awk '{print $2}')
    total_ram=$(echo "scale=3; $total_ram / 1048576" | bc)
    echo "$total_ram"
}

get_ram_used() {
    local used_ram=$(free | head -2 | tail -1 | awk '{print $3}')
    used_ram=$(echo "scale=3; $used_ram / 1048576" | bc)
    echo "$used_ram"
}

get_ram_free() {
    local free_ram=$(free | head -2 | tail -1 | awk '{print $4}')
    free_ram=$(echo "scale=3; $free_ram / 1048576" | bc)
    echo "$free_ram"
}

get_space_root() {
    local space_root=$(df / | tail -1 | awk '{print $2}' | sed 's/M//')
    space_root=$(echo "scale=2; $space_root / 1024" | bc)
    echo "$space_root"
}

get_space_root_used() {
    local space_root_used=$(df / | tail -1 | awk '{print $3}' | sed 's/M//')
    space_root_used=$(echo "scale=2; $space_root_used / 1024" | bc)
    echo "$space_root_used"
}

get_space_root_free() {
    local space_root_free=$(df / | tail -1 | awk '{print $4}' | sed 's/M//')
    space_root_free=$(echo "scale=2; $space_root_free / 1024" | bc)
    echo "$space_root_free"
}