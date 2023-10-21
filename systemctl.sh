#!/bin/bash

colo=$1
while true
do
meta=$(curl -x socks5://127.0.0.1:1080 -s https://speed.cloudflare.com/meta --connect-timeout 2 --max-time 3 | awk -F\" '{print $22}')
if [[ "$meta" != "HKG" ]]; then
 	echo "$(date) $meta......"
	systemctl restart sing-box
	sleep 3
elif [[ "$meta" == "HKG" ]]; then
 	echo "$(date) $meta......"
	sleep 300
else
	echo $meta
	break
fi
done
