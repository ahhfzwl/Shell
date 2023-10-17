#!/bin/bash -e
config=$1
echo 此脚本在 Ubuntu 上制作，其他系统未做测试。脚本需要 unzip ，请选择是否安装。
echo 1.跳过
echo 2.安装
echo -e 0.退出'\n'
read -p "请选择(默认1):" mode
if [ -z "$mode" ]
then
	mode=1
fi
if [ $mode == 1 ]
then
echo 1.跳过
elif [ $mode == 2 ]
then
  apt update && apt install -y wget unzip
elif [ $mode == 0 ]
then
echo 2.安装
fi

if [[ -z "$config" ]], then
  config_url="https://raw.sock.cf/ahhfzwl/my/main/config.json"
  echo "$config_url"
fi
if [[ $config == server ]]; then
  config_url="https://raw.sock.cf/ahhfzwl/my/main/config-server.json"
  echo "$config_url"
fi
if [[ $config == local ]]; then
  config_url="https://raw.sock.cf/ahhfzwl/my/main/config-local.json"
  echo "$config_url"
fi

exit 0

if [[ -e /root/sing-box/ ]]; then
  systemctl stop sing-box
  systemctl disable sing-box
  rm /root/sing-box/ -rf
  rm /etc/systemd/system/sing-box.service
fi

mkdir /root/sing-box/ && cd /root/sing-box/
wget https://github.sock.cf/SagerNet/sing-box/releases/download/v1.5.3/sing-box-1.5.3-linux-amd64.tar.gz
tar -xvf sing-box-*.tar.gz
cp ./sing-box-*/sing-box /root/sing-box/
rm -rf /root/sing-box/sing-box-*
chmod +x /root/sing-box/sing-box
wget -O /root/sing-box/config.json $config_url
wget -O /etc/systemd/system/sing-box.service https://raw.sock.cf/ahhfzwl/my/main/sing-box.service
systemctl enable sing-box
wget -O /root/sing-box/systemctl.sh https://raw.sock.cf/ahhfzwl/my/main/systemctl.sh
