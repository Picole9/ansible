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

echo generate locale
sed -i '/de_DE.UTF-8 UTF-8/s/^#//g' /etc/locale.gen
sed -i '/en_US.UTF-8 UTF-8/s/^#//g' /etc/locale.gen
locale-gen
localectl set-locale LANG=de_DE.UTF-8
localectl set-keymap de

echo install essentials
case $OS in
debian)
  apt update && apt upgrade -y
  apt install git -y
  ;;
arch)
  paman -Syu
  pacman -Sy git sudo
  ;;
*)
  echo "$OS not supported"
  ;;
esac
echo 'Defaults env_keep += "*_proxy *_PROXY"' >/etc/sudoers.d/proxy

echo Do you want to create a new user?
select yn in "Yes" "No"; do
  case $yn in
  Yes)
    echo " "
    while read -p "Please enter the username you wish to create : " username; do
      if [ "x$username" = "x" ]; then
        echo "Blank username entered. Try again!"
        username=""
      elif grep -q "^$username" /etc/passwd; then
        echo "Username already exists. Try again!"
        username=""
      else
        useradd -m -g users -G wheel -s /bin/bash "$username"
        echo "%wheel ALL=(ALL) ALL" >/etc/sudoers.d/wheel
        passwd $username
        echo on wsl you might want to set the default user in /etc/wsl.conf
      fi
    done
    ;;
  No)
    break
    ;;
  esac
done
