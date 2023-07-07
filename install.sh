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

echo "Installing Catacomb…"
#dependency "squeekboard swaybg catacomb-git tzompantli-git epitaph-git"
dependency "squeekboard swaybg"
mkdir -p ~/.config/catacomb
ln --force ./files/catacomb.sh ~/.config/catacomb/post_start.sh

echo "Installing NeoVim…"
dependency "python python-pynvim neovim"
mkdir -p ~/.config/nvim/.backup
ln --force ./files/init.vim ~/.config/nvim/init.vim

echo "Installing binaries…"
ln -sr --force ./files/bin ~/

echo "Installing Zsh…"
dependency "zsh zsh-autosuggestions"
ln --force ./files/zshrc ~/.zshrc
ln --force ./files/zprofile ~/.zprofile
ln -sr --force ./files/zsh ~/.config/

echo "Setting up Alacritty…"
dependency "ttf-fira-mono"
mkdir -p ~/.config/alacritty
ln --force ./files/alacritty.toml ~/.config/alacritty/alacritty.toml

echo "Setting up XDG directory names…"
ln --force ./files/xdg.dirs ~/.config/user-dirs.dirs

echo "Setting up GTK theme…"
mkdir -p ~/.config/gtk-3.0
mkdir -p ~/.config/gtk-4.0
ln --force ./files/gtk3-settings.ini ~/.config/gtk-3.0/settings.ini
ln --force ./files/gtk4-settings.ini ~/.config/gtk-4.0/settings.ini

echo "Setting up systemd services…"
dependency "rsync nfs-utils"
sudo ln --force ./files/systemd/* /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable --now backup.timer
