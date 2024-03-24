#!/bin/bash

echo "Arch Linux initial setup by JustCwertyf"
sudo pacman -Syu -y
echo "Choose, which graphics drivers do you need:"
echo "1. NVIDIA drivers"
echo "2. AMD drivers "
echo "3. Intel drivers "
echo "4. All combined"
read choice

case $choice in
    1)
        sudo pacman -S nvidia-dkms -y
        sudo pacman -S nvidia-utils -y
        ;;
    2)
        sudo pacman -S mesa -y
        sudo pacman -S amdvlk -y
        ;;
    3)
        sudo pacman -S mesa -y
        sudo pacman -S vulkan-intel -y
        sudo pacman -S xf86-video-intel -y
        ;;
    4)
        sudo pacman -S mesa -y
        sudo pacman -S amdvlk -y
        sudo pacman -S vulkan-intel -y
        sudo pacman -S xf86-video-intel -y
        sudo pacman -S nvidia-dkms -y
        sudo pacman -S nvidia-utils -y
        ;;
    *)
        echo "Uncorrect. Chose number 1-4."
        ;;
esac
sudo pacman -S archlinux-keyring
sudo pacman -S --needed git base-devel -y
sudo pacman -Sy git -y
sudo pacman -S make -y
sudo pacman -S linux-headers
sudo pacman -S firefox -y
sudo pacman -S noto-fonts-emoji noto-fonts ttf-liberation -y
sudo pacman -S pulseaudio -y
sudo pacman -S blueman -y
sudo systemctl enable bluetooth
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
echo "Your pc will be rebooted"
sudo reboot