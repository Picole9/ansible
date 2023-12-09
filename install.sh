#!/bin/bash

# install ansible
sudo apt update
sudo apt install python3-pip -y
pip3 install ansible
# ansible-galaxy collection install community.general

# create inventory
sudo mkdir /etc/ansible
sudo copy hosts /etc/ansible/
