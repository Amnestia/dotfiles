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
paru -S dnscrypt-proxy rustup bash-completion go nomacs 7-zip-full sublime-text-4 fcitx5-mozc docker docker-compose flatpak sway mako waybar wlsunset swaylock greetd swayidle swaybg greetd-gtkgreet fzf xdg-desktop-portal-wlr xdg-desktop-portal-gtk rofi-lbonn-wayland-git tmux tilix python-pipx fastfetch udisks2 thunar wireplumber mesa firefox lib32-mesa vulkan-radeon lib32-vulkan-radeon wdisplays vulkan-tools vulkan-icd-loader lib32-vulkan-icd-loader librewolf-bin bruno-bin steam steam-native-runtime bash-completion jq linux-firmware cmus texlive-full speedtest-go wireguard-tools winetricks wine-staging wine-gecko wine-mono
paru -S noto-fonts noto-fonts-cjk noto-fonts-cjk-fontconfig noto-fonts-emoji otf-aurulent-nerd otf-codenewroman-nerd otf-comicshanns-nerd otf-commit-mono-nerd otf-droid-nerd otf-firamono-nerd otf-font-awesome otf-geist-mono-nerd otf-hasklig-nerd otf-hermit-nerd otf-ipafont otf-monaspace-nerd otf-opendyslexic-nerd otf-overpass-nerd otf-takao ttf-0xproto-nerd ttf-3270-nerd ttf-agave-nerd ttf-anonymouspro-nerd ttf-arimo-nerd ttf-bigblueterminal-nerd ttf-bitstream-vera-mono-nerd ttf-cascadia-code-nerd ttf-cascadia-mono-nerd ttf-cousine-nerd ttf-d2coding-nerd ttf-daddytime-mono-nerd ttf-dejavu ttf-dejavu-nerd ttf-envycoder-nerd ttf-fantasque-nerd ttf-firacode-nerd ttf-go-nerd ttf-hack-nerd ttf-hanazono ttf-heavydata-nerd ttf-iawriter-nerd ttf-ibmplex-mono-nerd ttf-inconsolata-go-nerd ttf-inconsolata-lgc-nerd ttf-inconsolata-nerd ttf-intone-nerd ttf-iosevka-nerd ttf-iosevkaterm-nerd ttf-jetbrains-mono-nerd ttf-lekton-nerd ttf-liberation ttf-liberation-mono-nerd ttf-lilex-nerd ttf-martian-mono-nerd ttf-meslo-nerd ttf-monofur-nerd ttf-monoid-nerd ttf-mononoki-nerd ttf-mplus-nerd ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-common ttf-nerd-fonts-symbols-mono ttf-noto-nerd ttf-profont-nerd ttf-proggyclean-nerd ttf-roboto-mono-nerd ttf-sazanami ttf-sharetech-mono-nerd ttf-sourcecodepro-nerd ttf-space-mono-nerd ttf-terminus-nerd ttf-tinos-nerd ttf-ubuntu-mono-nerd ttf-ubuntu-nerd ttf-victor-mono-nerd
flatpak install flathub io.dbeaver.DBeaverCommunity net.lutris.Lutris dev.vencord.Vesktop

source ~/.bashrc
nvm install --lts
nvm install-latest-npm

vim +PlugUp
