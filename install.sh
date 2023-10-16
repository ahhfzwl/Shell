#!/bin/bash -e
#apt update && apt install -y openssh-server systemctl wget curl vim nano screen unzip htop
mkdir /root/sing-box/ && cd /root/sing-box/
wget https://github.sock.cf/SagerNet/sing-box/releases/download/v1.5.3/sing-box-1.5.3-linux-amd64.tar.gz
tar -xvf sing-box-*.tar.gz
cp ./sing-box-*/sing-box /root/sing-box/
rm -rf /root/sing-box/sing-box-*
chmod +x /root/sing-box/sing-box
wget -O /root/sing-box/config.json https://raw.sock.cf/ahhfzwl/my/main/config.json
wget -O /etc/systemd/system/sing-box.service https://raw.sock.cf/ahhfzwl/my/main/sing-box.service
systemctl enable sing-box
wget -O /root/sing-box/systemctl.sh https://raw.sock.cf/ahhfzwl/my/main/systemctl.sh
