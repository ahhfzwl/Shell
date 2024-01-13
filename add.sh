#!/bin/bash

# 定义要安装的软件列表
software_list=("iputils-ping" "net-tools" "dnsutils iproute2")

# 检测并安装缺失的软件
for software in "${software_list[@]}"; do
  if ! dpkg -l | grep -q "^ii  $software "; then
    echo "正在安装 $software ..."
    sudo apt-get install -y "$software"
    if [ $? -eq 0 ]; then
      echo "$software 安装成功！"
    else
      echo "安装 $software 失败，请手动安装。"
    fi
  else
    echo "$software 已经安装，跳过。"
  fi
done

echo "批量安装完成。"
