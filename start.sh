#!/usr/bin/bash

#add sources debian
sudo echo "deb http://deb.debian.org/debian bullseye main
deb-src http://deb.debian.org/debian bullseye main

deb http://deb.debian.org/debian-security/ bullseye-security main
deb-src http://deb.debian.org/debian-security/ bullseye-security main

deb http://deb.debian.org/debian bullseye-updates main
deb-src http://deb.debian.org/debian bullseye-updates main" >> /etc/apt/sources.list.d/debian.list
sudo echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" >> /etc/apt/sources.list.d/sur5r-i3.list

# install i3 sources
/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2022.02.17_all.deb keyring.deb SHA256:52053550c4ecb4e97c48900c61b2df4ec50728249d054190e8a0925addb12fc6
sudo dpkg -i ./keyring.deb

#update
sudo apt update && sudo apt upgrade -y

sudo apt install i3 -y
sudo apt install i3-gaps -y
sudo apt install polybar -y
sudo apt install feh compton rofi fonts-font-awesome thunar materia-gtk-theme papirus-icon-theme lxappearance arandr -y

#Create dirs 
mkdir ~/.config/i3
mkdir ~/.config/i3status
mkdir ~/.config/polybar

#Copy setting
cp i3-config ~/.config/i3/config
cp i3status.conf ~/.config/i3status/i3status.conf
cp polybar-config ~/.config/polybar/config
cp launch.sh ~/.config/polybar/launch.sh

#Add ru languadge in keyboard settings
echo 'setxkbmap -model pc105 -layout us,ru -option grp:win_space_toggle' >> .bashrc
