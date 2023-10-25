#!bin/bash

get_total_number_of_folders() {
    find $1 -type d | wc -l
}

get_top_five() {
    du -h $1 | sort -h -r | head -n 5 | awk '{print NR" - "$2", "$1}'
}

get_total_number_of_files() {
    find $1 -type f | wc -l
}

get_total_number_of_conf_files () {
    find $1 -type f -name "*.conf" | wc -l
}

get_total_number_of_text_files () {
    find $1 -type f -name "*.txt" | wc -l
}

get_total_number_of_exe_files () {
    find $1 -type f -executable | wc -l
}

get_total_number_of_log_files () {
    find $1 -type f -name "*.log" | wc -l
}

get_total_number_of_archive_files () {
    find $1 -type f \( -name "*.zip" -o \
                       -name "*.gz" -o  \
                       -name "*.tar" -o \
                       -name "*.tar.gz" -o \
                       -name "*.tar.bz2" -o \
                       -name "*.tar.xz" -o \
                       -name "*.tgz" -o \
                       -name "*.tbz2" -o \
                       -name "*.7z" -o \
                       -name "*.iso" -o \
                       -name "*.cpio" -o \
                       -name "*.a" -o \
                       -name "*.ar" \) | wc -l
}

get_total_number_of_symbolic_links_files () {
    find $1 -type l | wc -l
}

get_top_ten_files() {
    find $1 -type f -exec du -h {} \; | sort -h -r | head -n 10 | awk '{split($2, a, "."); print NR" - "$2", "$1", "a[length(a)]}'
}

get_top_ten_exe_files() {
    IFS=$'\n'
    without_hash=($(find $1 -type f -executable -exec du -h {} \; | sort -h -r | head -n 10 | awk '{print $2", "$1}'))

    for (( i=0; i<10; i++ ))
    do
        file_name=$(echo "${without_hash[$i]}" | cut -f1 -d ",")
        hash_val=$(md5sum "$file_name" | cut -f1 -d " ")
        echo "$(( i + 1 )) - ${without_hash[$i]}, $hash_val"
    done
}