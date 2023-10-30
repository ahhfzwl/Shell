#!/bin/bash

colo=$1
if [[ -z "$colo" ]]; then
  colo=HKG
fi
cd /ahhfzwl/sing-box/
i=1
while [ $i -le 30 ]; do   
  meta=$(curl -x socks5://127.0.0.1:1080 -s https://speed.cloudflare.com/meta --connect-timeout 2 --max-time 3 | awk -F\" '{print $22}')
  if [[ "$meta" != "$colo" ]]; then
    echo "$(date) $meta......"
    kill -9 "$(pidof sing-box)"
    sleep 1
    test -z "$(pidof sing-box)" && ./sing-box run >/dev/null 2>&1 &
    sleep 3
  else
    echo "$(date) $meta"
    break
  fi
  let i++
done
