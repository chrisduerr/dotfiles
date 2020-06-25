#!/bin/bash

function dependency {
    pacman -Qi $1 &> /dev/null && return
    read -p "Depenencies required: Do you want to install '$1'? [y/N] " choice
    if [[ "${choice^^}" == Y ]]; then
        pacman -S --needed $1
    fi
}

# Just making sure
mkdir -p ~/.config

echo "Installing picom…"
dependency "picom"
mkdir -p ~/.config/picom
ln --force ./files/picom.conf ~/.config/picom/picom.conf

echo "Installing neovim…"
dependency "python python-neovim neovim"
mkdir -p ~/.config/nvim/.backup
ln --force ./files/init.vim ~/.config/nvim/init.vim

echo "Installing binaries…"
ln -sr --force ./files/bin ~/

echo "Installing alacritty…"
dependency "alacritty-git otf-fira-mono ttf-font-awesome"
mkdir -p ~/.config/alacritty
ln --force ./files/alacritty.yml ~/.config/alacritty/alacritty.yml

echo "Installing i3…"
dependency "i3-gaps otf-fira-mono ttf-font-awesome maim slop compton feh"
mkdir -p ~/.config/i3
ln --force ./files/i3config ~/.config/i3/config

echo "Installing ssh…"
dependency "openssh"
mkdir -p ~/.ssh
ln --force ./files/sshconfig ~/.ssh/config

echo "Installing xinit…"
dependency "xorg-xinit xorg-server"
ln --force ./files/xinitrc ~/.xinitrc

echo "Installing zsh…"
dependency "zsh zsh-autosuggestions"
ln --force ./files/zshrc ~/.zshrc
ln --force ./files/zprofile ~/.zprofile
ln -sr --force ./files/zsh ~/.config/

echo "Installing weechat…"
dependency "weechat-python3-git"
mkdir -p ~/.weechat
ln --force ./files/weechat/weechat.conf ~/.weechat/weechat.conf
ln --force ./files/weechat/buflist.conf ~/.weechat/buflist.conf
ln --force ./files/weechat/irc.conf ~/.weechat/irc.conf
ln -sr --force ./files/weechat/python ~/.weechat/

echo "Setting up XDG directory names…"
ln --force ./files/xdg.dirs ~/.config/user-dirs.dirs

echo "Installing GTK theme…"
mkdir -p ~/.config/gtk-3.0
ln --force ./files/gtk3-settings.ini ~/.config/gtk-3.0/settings.ini
