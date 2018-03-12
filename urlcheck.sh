#!/bin/bash

PATH=/home/user/bin:/home/user/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
PT=/home/user/Documents/URL_Monitoring/pt
PTO=/home/user/Documents/URL_Monitoring/pt_output
PTR=/home/user/Documents/URL_Monitoring/pt_result.csv
a=200;b=301;c=302;d=304

function url_test {
	cat /dev/null > $PTO
	while read pt; do
		curl -o /dev/null --silent --head --write-out '%{http_code}' -g "$pt" >> $PTO
		echo -e '\t '"$pt" >> $PTO
	done <$PT
}

function url_result {
	cat /dev/null > $PTR
	echo -e "Request URL;Status Code" >> $PTR
	while read pto; do
		x=$(echo $pto | awk '{print $1}')
		y=$(echo $pto | awk '{print $2}')
		if [[ "$x" == "$a" ]] || [[ "$x" == "$b" ]] || [[ "$x" == "$c" ]] || [[ "$x" == "$d" ]]; then
			echo -e "$y;$x" >> $PTR
		else
			true
		fi
	done <$PTO
}

url_test
url_result
