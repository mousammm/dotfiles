#!/bin/bash

1/ login: root ; voidlinux

2/ cfdisk dev/nvme0np6 ; gpt
  boot 1G   ; mkfs.fat -F 32 /dev/ ; mount --mkdir /dev/.. /mnt/boot/efi
  swap 4G   ; mkswap /dev/         ; swapon /dev/..
  root Rest ; mkfs.ext4 /dev/      ; mount /dev/.. /mnt

3/ Base system 
xbps-install -Sy -R https://repo-default.voidlinux.org/current -r /mnt base-system
xgenfstab -U /mnt > /mnt/etc/fstab

4/ chroot into mnt
xchroot /mnt /bin/bash
xbps-install vim base-devel grub efibootmgr os-prober 

5/ configuration
vim /etc/hostname 
vim /etc/default/libc-locals ; en_US.UTF-8
xbps-reconfigure -f glibc-locales

6/ root password
passwd # for root 
useradd -mG wheel mousam
passwd mousam
EDITOR=vim visudo ; [ %wheel ALL=(ALL:ALL) NOPASSWD: ALL ]

7/ grub
xbps-install -S grub-x86_64-efi
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id="Void"
vim /etc/default/grub
GRUB_DISABLE_OS_PROBER=false # add
sudo os-prober
sudo grub-mkconfig -o /boot/grub/grub.cfg

8/ gui
su mousam 
sudo xbps-install -Su
alias xi="sudo xbps-install" ; source .bashrc
xi xorg xinit
xi i3 i3status dmemu vvst firefox neofetch

9/ dhpc: internet works after reboot
xbps-install dhcpcd
ln -s /etc/sv/dhcpcd /etc/runit/runsvdir/default/dhcpcd
ls -la /etc/runit/runsvdir/default

10/ all pkgs configure properly
xbps-reconfigure -fa
exit #from chroot 
umount -R /mnt
shutdown -r now

11/ startttt
echo "exec i3" >> .xinitrc
startx
