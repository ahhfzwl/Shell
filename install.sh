#!/bin/bash
bash <(curl -Ls https://raw.sock.cf/ahhfzwl/Shell/main/add.sh)
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
    echo "安装软件包: $package_list"
    apt update && apt -y install $package_list
  fi
}

install_packages
