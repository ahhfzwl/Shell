#!/bin/bash

packages=("cron" "htop" "openssh-server" "nano" "wget" "curl" "screen" "iputils-ping" "net-tools" "dnsutils" "iproute2" "tcptraceroute" "bc" "socat" "systemctl")

install_packages() {
  local to_install=()
  for pkg in "${packages[@]}"; do
    if ! dpkg -l | grep -q "^ii  $pkg "; then
      to_install+=("$pkg")
    fi
  done

  if [ "${#to_install[@]}" -eq 0 ]; then
    echo "所有软件包均已安装。"
  else
    local package_list="${to_install[*]}"
    echo "Installing packages: $package_list"
    apt update && apt -y install $package_list
  fi
}

install_packages
