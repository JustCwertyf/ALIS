#!/bin/bash

echo "Arch Linux initial setup by JustCwertyf"
sudo pacman -Syu --noconfirm
echo "Choose, which graphics drivers do you need:"
echo "1. NVIDIA drivers"
echo "2. AMD drivers "
echo "3. Intel drivers "
echo "4. All combined"
read choice

case $choice in
    1)
        sudo pacman -S nvidia-dkms --noconfirm
        sudo pacman -S nvidia-utils --noconfirm
        ;;
    2)
        sudo pacman -S mesa --noconfirm
        sudo pacman -S amdvlk --noconfirm
        ;;
    3)
        sudo pacman -S mesa --noconfirm
        sudo pacman -S vulkan-intel --noconfirm
        sudo pacman -S xf86-video-intel --noconfirm
        ;;
    4)
        sudo pacman -S mesa --noconfirm
        sudo pacman -S amdvlk --noconfirm
        sudo pacman -S vulkan-intel --noconfirm
        sudo pacman -S xf86-video-intel --noconfirm
        sudo pacman -S nvidia-dkms --noconfirm
        sudo pacman -S nvidia-utils --noconfirm
        ;;
    *)
        echo "Uncorrect. Chose number 1-4."
        ;;
esac
sudo pacman -S archlinux-keyring --noconfirm
sudo pacman -S --needed git base-devel --noconfirm
sudo pacman -Sy git --noconfirm
sudo pacman -S make --noconfirm
sudo pacman -S linux-headers --noconfirm
sudo pacman -S firefox --noconfirm
sudo pacman -S noto-fonts-emoji noto-fonts ttf-liberation --noconfirm
sudo pacman -S pulseaudio --noconfirm
sudo pacman -S blueman --noconfirm
sudo systemctl enable bluetooth
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
echo "Your pc will be rebooted"
sudo reboot
