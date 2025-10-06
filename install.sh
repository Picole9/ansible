#!/bin/bash

# detect os
if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [[ -z $ID_LIKE ]]; then
        OS=$ID
    else
        OS=$ID_LIKE
    fi
else
    OS=$(uname -s)
fi
echo detected $OS

echo install ansible
case $OS in
debian)
    sudo apt update
    sudo apt install python3-pip -y
    pip3 install ansible
    ansible-galaxy collection install community.general
    ;;
arch)
    sudo -E pacman -Sy ansible
    ansible-galaxy collection install community.general
    ;;
*)
    echo "$OS not supported"
    ;;
esac

echo create inventory
sudo mkdir /etc/ansible
sudo cp hosts /etc/ansible/
sudo touch /etc/ansible/ansible.cfg
sudo ansible-config init --disabled >/etc/ansible/ansible.cfg
