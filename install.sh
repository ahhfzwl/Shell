#!/usr/bin/bash
# bash <(curl -Ls https://raw.sock.cf/ahhfzwl/Shell/main/install.sh)
install() {
  APK=""
  for i in cron htop openssh-server nano wget curl screen iputils-ping net-tools dnsutils iproute2 tcptraceroute bc socat systemctl
  do
    if ! dpkg -l | grep -q "^ii  $i "; then
      APK="$APK $i"
    fi
  done
  if [ -z "$APK" ]
  then
    echo "APK OK"
  else
    echo "install$APK"
    apt update && apt -y install $APK
  fi
}
install
