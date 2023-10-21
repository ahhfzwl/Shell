#!/bin/bash

systemctl restart ssh
screen -wipe

name1=ddns
screen -S $name1 -X quit >/dev/null 2>&1
screen -dmS $name1
screen -x -S $name1 -p 0 -X stuff "bash /root/by.now.cc.do.sh e4-ubuntu.by.now.cc"
screen -x -S $name1 -p 0 -X stuff "\n"

name2=sing-box
screen -S $name2 -X quit >/dev/null 2>&1
screen -dmS $name2
screen -x -S $name2 -p 0 -X stuff "bash /root/sing-box/systemctl.sh"
screen -x -S $name2 -p 0 -X stuff "\n"
