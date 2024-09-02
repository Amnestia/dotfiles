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

pacstrap -K /mnt base base-devel linux linux-firmware intel-ucode vim git e2fsprogs sudo dhcpcd pacman-contrib 

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
sudo pacman -S grub efibootmgr docker docker-compose
sudo usermod -a -G docker user

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
sudo mkinitcpio -P

# Setup GRUB
sudo vim /etc/default/grub
# GRUB_CMDLINE_LINUX_DEFAULT="linux /vmlinuz-linux cryptdevice=UUID=uuidrootpartitionLUKS:root:allow-discards root=/dev/mapper/root resume=/dev/mapper/swap loglevel=3 intel_iommu=on quiet splash l1tf=full,force mds=full,nosmt mitigations=auto,nosmt nosmt=force"

sudo grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
sudo grub-mkconfig -o /boot/grub/grub.cfg

