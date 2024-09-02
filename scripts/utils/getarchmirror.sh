curl -s "https://archlinux.org/mirrorlist/?country=FR&country=AU&country=ID&country=DE&country=SG&country=JP&country=US&country=GB&protocol=https&use_mirror_status=on" | sed -e 's/^#Server/Server/' -e '/^#/d' | sudo tee /etc/pacman.d/mirrorlist.backup_2
sudo rankmirrors -v -n 20 /etc/pacman.d/mirrorlist.backup_2 | sudo tee /etc/pacman.d/mirrorlist
