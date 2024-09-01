#!/bin/bash

#########################
# Post Installation     #
#########################
# Setup AUR Helper
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

paru -Syu
paru -S bash-completion go nomacs 7-zip-full sublime-text-4 fcitx5-mozc docker docker-compose flatpak sway mako waybar wlsunset swaylock greetd swayidle rofi-lbonn-wayland-git tmux tilix python-pipx mkinitcpio-busybox mkinitcpio-firmware fastfetch udisks2 thunar

# Setup NTP (https://www.ntppool.org/en/)
# 0.id.pool.ntp.org 1.id.pool.ntp.org 2.id.pool.ntp.org 3.id.pool.ntp.org
# 0.jp.pool.ntp.org 1.jp.pool.ntp.org 2.jp.pool.ntp.org 3.jp.pool.ntp.org
sudo timedatectl set-ntp true
sudo vim /etc/systemd/timesyncd.conf

sudo systemctl enable systemd-timesyncd.service
sudo systemctl enable paccache.timer

# Setup pacman cache config
paccache -rk1
paccache -ruk1

paru -S thunderbird-beta
flatpak install flathub org.mozilla.firefox com.usebruno.Bruno io.dbeaver.DBeaverCommunity
