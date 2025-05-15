

#!/bin/bash
set -e

date=$(date '+%H:%M:%S-%m-%d-%Y')
backup="duckDNS-curl-$date.log"
file_path="./duckDNS_logs"
token_path=./token
tokenValue=""


if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

hasToken(){
	if [ -f $token_path ]; then
		tokenValue=$(cat "$token_path")
        echo $tokenValue
        return 0;
	else
        echo "lacks token file, please do "touch token" in the repository and insert your token file\n"
		return 1;
	fi
}

dir_exists() {
    	if [ -e "$file_path" ]; then
        	return 0 
    	else
        	echo "File does not exit... Creating one"
        	mkdir "$file_path"
        	return 1 
    	fi
}

    hasToken
    dir_exists

    echo "Fedora installed Package Logger v1.0"
    echo "Logging installed packages to $backup..."
    echo $tokenValue
    echo url="https://www.duckdns.org/update?domains=sdautomacoes&token=$tokenValue&ip=" | curl -k -o $file_path/$backup -K - ;
    cat $file_path/$backup









