#!bin/bash

start_time=$(date +%s.%N)

source "check_param.sh"

validate_parameter "$@"

source "directory_data.sh"

directory=$1

get_directory_data() {
    NUMBER_OF_FOLDERS=$(get_total_number_of_folders "$directory")
    TOP_FIVE=$(get_top_five "$directory")
    NUMBER_OF_FILES=$(get_total_number_of_files "$directory")
    NUMBER_OF_CONF=$(get_total_number_of_conf_files "$directory")
    NUMBER_OF_TXT=$(get_total_number_of_text_files "$directory")
    NUMBER_OF_EXE=$(get_total_number_of_exe_files "$directory")
    NUMBER_OF_LOG=$(get_total_number_of_log_files "$directory")
    NUMBER_OF_ARCHIVES=$(get_total_number_of_archive_files "$directory")
    NUMBER_OF_LINKS=$(get_total_number_of_symbolic_links_files "$directory")
    TOP_TEN_FILES=$(get_top_ten_files "$directory")
    TOP_TEN_EXE=$(get_top_ten_exe_files "$directory")
}

print_directory_data() {
    echo "Total number of folders (including all nested ones) = $NUMBER_OF_FOLDERS"
    echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
    echo "$TOP_FIVE"
    echo "Total number of files = $NUMBER_OF_FILES"
    echo "Number of:"
    echo "Configuration files (with the .conf extension) = $NUMBER_OF_CONF"
    echo "Text files = $NUMBER_OF_TXT"
    echo "Executable files = $NUMBER_OF_EXE"
    echo "Log files (with the extension .log) = $NUMBER_OF_LOG"
    echo "Archive files = $NUMBER_OF_ARCHIVES"
    echo "Symbolic links = $NUMBER_OF_LINKS"
    echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
    echo "$TOP_TEN_FILES"
    echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file)"
    echo "$TOP_TEN_EXE"
}

get_directory_data
print_directory_data

end_time=$(date +%s.%N)

runtime=$(echo "$end_time - $start_time" | bc)

echo "Script execution time (in seconds) = $runtime"

exit 0