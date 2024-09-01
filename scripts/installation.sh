#!/bin/sh

# Example script, not to be run directly

# Paritioning
# Example Partition: 
# /dev/sda1 EFI(for boot) 
# /dev/sda2 Linux Swap
# /dev/sda3 Linux filesystem
fdisk -l
gdisk

# Encryption
cryptsetup -v luksFormat /dev/sda3
cryptsetup luksFormat /dev/sda2
cryptsetup open /dev/sda3 root
cryptsetup open /dev/sda2 swap
mkfs.fat -F32 /dev/sda1
mkswap /dev/mapper/swap
mkfs.ext4 /dev/mapper/root

# Mount
mount /dev/mapper/root /mnt
swapon /dev/mapper/swap
mount --mkdir /dev/sda1 /mnt/boot

pacstrap -K /mnt base base-devel linux linux-firmware intel-ucode vim git e2fsprogs sudo iwd pacman-contrib 

# Generate fstab
genfstab -U /mnt >> /mnt/etc/fstab

# Chroot
arch-chroot /mnt

# Change hostname and create user
vim /etc/hostname
# Uncomment wheel group
visudo /etc/sudoers
useradd -m user
passwd user
usermod -a -G wheel user

sudo -iu user

# Disable root login
sudo passwd -l root

# Generate locale
locale-gen
echo LANG=en_US.UTF-8 | sudo tee /etc/locale.conf

# Package installation
sudo pacman -S grub efibootmgr

# Setup mkinitcpio
vim /etc/initcpio/hooks/openswap
run_hook ()
{
    cryptsetup open /dev/device swapDevice
}
vim /etc/initcpio/install/openswap
build ()
{
   add_runscript
}
help ()
{
cat<<HELPEOF
  This opens the swap encrypted partition /dev/device in /dev/mapper/swapDevice
HELPEOF
}

vim /etc/mkinitcpio.conf
# Update hooks
# HOOKS=(base udev autodetect keyboard keymap modconf block encrypt openswap resume filesystems fsck)

# Setup GRUB
sudo vim /etc/default/grub
# GRUB_CMDLINE_LINUX_DEFAULT="linux /vmlinuz-linux cryptdevice=UUID=uuidrootpartitionLUKS:root:allow-discards root=/dev/mapper/root resume=/dev/mapper/swap loglevel=3 intel_iommu=on quiet splash l1tf=full,force mds=full,nosmt mitigations=auto,nosmt nosmt=force"

sudo grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
sudo grub-mkconfig -o /boot/grub/grub.cfg

#########################
# Post Installation     #
#########################
# Setup AUR Helper
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

paru -S fcitx5-mozc docker flatpak sway mako waybar wlsunset swaylock swayidle rofi-lbonn-wayland-git tmux tilix python-pipx mkinitcpio-busybox mkinitcpio-openswap fastfetch udisks2 thunar
sudo usermod -a -G docker user
paru -S mkinitcpio-firmware 
paru -Syu

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
