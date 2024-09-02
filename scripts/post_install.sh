#!/bin/bash

#########################
# Post Installation     #
#########################
# Setup NTP (https://www.ntppool.org/en/)
# 0.id.pool.ntp.org 1.id.pool.ntp.org 2.id.pool.ntp.org 3.id.pool.ntp.org
# 0.jp.pool.ntp.org 1.jp.pool.ntp.org 2.jp.pool.ntp.org 3.jp.pool.ntp.org
sudo vim /etc/systemd/timesyncd.conf
sudo timedatectl set-ntp true
sudo systemctl enable paccache.timer

# Setup pacman cache config
paccache -rk1
paccache -ruk1

# Setup AUR Helper
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
paru -Syu
paru -S dnscrypt-proxy rust bash-completion go nomacs 7-zip-full sublime-text-4 fcitx5-mozc docker docker-compose flatpak sway mako waybar wlsunset swaylock greetd swayidle swaybg greetd-gtkgreet rofi-lbonn-wayland-git tmux tilix python-pipx fastfetch udisks2 thunar thunderbird-beta-bin wireplumber
flatpak install flathub org.mozilla.firefox com.usebruno.Bruno io.dbeaver.DBeaverCommunity

source ~/.bashrc
nvm install --lts
nvm install-latest-npm

vim +PlugUp
