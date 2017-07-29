# ===================================================
# *      Author : icon97 <p.h.tan97@gmail.com>      *
# *      File Name : install.sh                     *
# *      Version : 1.0                              *
# *      Creation Date : 29/07/2017                 *
# *      Last Modified : 30/07/2017 00:01           *
# *      Description :                              *
# ===================================================

#!bin/bash

# Yaourt
sudo pacman -S yaourt --noconfirm

# Xorg and Graphic driver
sudo pacman -S xorg-server xorg-apps xorg-xinit xorg-twm xterm xf86-video-intel mesa --noconfirm

# I3wm
sudo pacman -S i3status --noconfirm
yaourt -S i3-gaps i3lock-color-git --noconfirm

# Audio
sudo pacman -S alsa-firmware alsa-utils alsa-plugins pulseaudio-alsa pulseaudio --noconfirm

# Theme and icon
sudo pacman -S arc-gtk-theme arc-icon-theme --noconfirm

# Font
sudo pacman -S ttf-dejavu ttf-inconsolata --noconfirm

# App
sudo pacman -S tree ranger w3m htop scrot screenfetch roxterm gparted nitrogen compton --noconfirm
sudo pacman -S xautolock lxappearance rofi dmenu wget curl libreoffice-fresh --noconfirm
sudo pacman -S zathura zathura-pdf-poppler gpicview firefox cmake -nocomfirm

yaourt -S pulseeffects --noconfirm

# Create folder
sudo pacman -S xdg-user-dirs --noconfirm
xdg-user-dirs-update
sudo pacman -R xdg-user-dirs --noconfirm

# System congiguration
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# Copy file config
cp -r ~/Archi3/.* ~/
fc-cache

# Done
sudo reboot
