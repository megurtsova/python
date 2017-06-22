#!/bin/bash

# Repair "==> default: stdin: is not a tty" message
sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile

export DEBIAN_FRONTEND=noninteractive
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
locale-gen en_US.UTF-8
dpkg-reconfigure locales

echo -e "\n--- APT update ---\n"
sudo apt-get update > /dev/null 2>&1

echo -e "\n--- Install utilities ---\n"
sudo apt-get install -y curl git
sudo apt-get install -y zip gzip tar

echo -e "\n--- Install python3 ---\n"
sudo apt-get install python3

echo -e "\n--- System install complete ---\n"
