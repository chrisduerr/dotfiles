#!/bin/bash

function dependency {
    pacman -Qi $1 &> /dev/null && return
    read -p "Depenencies required: Do you want to install '$1'? [Y/n] " choice
    if [[ "${choice^^}" != N ]]; then
        sudo pacman -S --needed $1
    fi
}

# Just making sure
mkdir -p ~/.config

echo "Installing picom…"
dependency "picom"
mkdir -p ~/.config/picom
ln --force ./files/picom.conf ~/.config/picom/picom.conf

echo "Installing NeoVim…"
dependency "python python-neovim neovim"
mkdir -p ~/.config/nvim/.backup
ln --force ./files/init.vim ~/.config/nvim/init.vim

echo "Installing binaries…"
ln -sr --force ./files/bin ~/

echo "Installing i3…"
dependency "i3-gaps"
mkdir -p ~/.config/i3
ln --force ./files/i3config ~/.config/i3/config

echo "Installing X…"
dependency "xorg-xinit xorg-server"
ln --force ./files/xinitrc ~/.xinitrc
ln --force ./files/XCompose ~/.XCompose

echo "Installing Zsh…"
dependency "zsh zsh-autosuggestions"
ln --force ./files/zshrc ~/.zshrc
ln --force ./files/zprofile ~/.zprofile
ln -sr --force ./files/zsh ~/.config/

echo "Installing WeeChat…"
dependency "weechat"
mkdir -p ~/.weechat
ln --force ./files/weechat/weechat.conf ~/.weechat/weechat.conf
ln --force ./files/weechat/buflist.conf ~/.weechat/buflist.conf
ln --force ./files/weechat/irc.conf ~/.weechat/irc.conf
ln -sr --force ./files/weechat/python ~/.weechat/

echo "Installing Pulseaudio…"
dependency "pulseaudio"
mkdir -p ~/.config/pulse
ln --force ./files/pulseaudio.pa ~/.config/pulse/default.pa

echo "Setting up Alacritty…"
dependency "ttf-fira-mono"
mkdir -p ~/.config/alacritty
ln --force ./files/alacritty.yml ~/.config/alacritty/alacritty.yml

echo "Setting up XDG directory names…"
ln --force ./files/xdg.dirs ~/.config/user-dirs.dirs

echo "Setting up GTK theme…"
mkdir -p ~/.config/gtk-3.0
ln --force ./files/gtk3-settings.ini ~/.config/gtk-3.0/settings.ini

echo "Setting up systemd services…"
dependency "rsync nfs-utils"
sudo ln --force ./files/systemd/* /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable --now backup.service
sudo systemctl enable --now rgbfusion.service
