#!/bin/bash

# search os
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID_LIKE
else
    OS=$(uname -s)
fi

case $OS in

    debian)
        # install ansible
        sudo apt update
        sudo apt install python3-pip -y
        pip3 install ansible
        ansible-galaxy collection install community.general
        ;;

    arch)
        sudo pacman -Sy ansible
        ansible-galaxy collection install community.general
        ;;
    *)
        echo "$OS not supported"
        ;;
esac

# create inventory
sudo mkdir /etc/ansible
sudo cp hosts /etc/ansible/
