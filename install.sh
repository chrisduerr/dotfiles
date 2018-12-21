#!/bin/bash

function dependency {
    pacaur -Qi $1 &> /dev/null && return
    read -p "Depenencies required: Do you want to install '$1'? [y/N] " choice
    if [[ "${choice^^}" == Y ]]; then
        pacaur -S $1
    fi
}

function symlink {
    CURRENT_REALPATH=$(realpath -m "$2")
    TARGET_REALPATH=$(realpath -m "$1")
    if [[ "$CURRENT_REALPATH" != "$TARGET_REALPATH" ]]; then
        if [[ ! -f "$2" ]] || [[ ! -d "$2" ]]; then
            rm -rf "$2"
        fi
        ln -sr $1 $2
    fi
}

# Just making sure
mkdir -p ~/.config

# Compton
echo "Installing compton…"
dependency "compton"
symlink ./files/compton.conf ~/.config/compton.conf

# Neovim
echo "Installing neovim…"
dependency "python python-neovim neovim"
mkdir -p ~/.config/nvim/.backup
symlink ./files/init.vim ~/.config/nvim/init.vim

# Binaries
echo "Installing binaries…"
symlink ./files/bin ~/bin

# Alacritty
echo "Installing alacritty…"
dependency "alacritty-git otf-fira-mono ttf-font-awesome"
mkdir -p ~/.config/alacritty
symlink ./files/alacritty.yml ~/.config/alacritty/alacritty.yml

# i3-gaps
echo "Installing i3…"
dependency "i3-gaps otf-fira-mono ttf-font-awesome maim slop compton feh"
mkdir -p ~/.config/i3
symlink ./files/i3config ~/.config/i3/config

# SSH
echo "Installing ssh…"
dependency "openssh"
mkdir -p ~/.ssh
symlink ./files/sshconfig ~/.ssh/config

# Xinitrc
echo "Installing xinit…"
dependency "xorg-xinit xorg-server"
symlink ./files/xinitrc ~/.xinitrc

# Zsh
echo "Installing zsh…"
dependency "zsh zsh-autosuggestions"
symlink ./files/zshrc ~/.zshrc
symlink ./files/zsh ~/.config/zsh
symlink ./files/zprofile ~/.zprofile

# Weechat
echo "Installing weechat…"
dependency "weechat-python3-git"
mkdir -p ~/.weechat
symlink ./files/weechat/weechat.conf ~/.weechat/weechat.conf
symlink ./files/weechat/buflist.conf ~/.weechat/buflist.conf
symlink ./files/weechat/irc.conf ~/.weechat/irc.conf
symlink ./files/weechat/python ~/.weechat/python

# XDG Directory names
echo "Setting up XDG directory names…"
symlink ./files/xdg.dirs ~/.config/user-dirs.dirs

# Theme for GTK
echo "Installing GTK theme…"
mkdir -p ~/.config/gtk-3.0
symlink ./files/gtk3-settings.ini ~/.config/gtk-3.0/settings.ini
