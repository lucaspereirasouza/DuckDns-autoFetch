

#!/bin/bash
set -e

date=$(date '+%H:%M:%S-%m-%d-%Y')
backup="duckDNS-curl-$date.log"
file_path="./duckDNS_logs"

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

echo "Fedora installed Package Logger v1.0"
dir_exists() {
    if [[ -e "$file_path" ]]; then
        return 0 
    else
        echo "File does not exit... Creating one"
        mkdir "$file_path"
        return 1 
    fi
}

if dir_exists; then
    echo "Logging installed packages to $backup..."
    
    echo url="https://www.duckdns.org/update?domains=sdautomacoes&token=925049d4-9d8d-42b8-9d4e-c2905a9203fc&ip=" 
    | curl -k -o $file_path/$backup -K - ;
    cat ~/duckdns/duck.log

fi







