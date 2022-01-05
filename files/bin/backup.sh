#!/bin/bash

exclude="--exclude /programming/rust/**/target \
         --exclude /programming/rust/vtebench \
         --exclude /programming/rust/rust \
         --exclude /programming/c/**/build \
         --exclude /movies \
         --exclude /music \
         --exclude /downloads \
         --exclude /.cache \
         --exclude /.config/nvim/plugins \
         --exclude /.rustup \
         --exclude /.cargo \
         --exclude /.local"

# Rsync files
sudo -u undeadleech rsync -Phav --delete /home/undeadleech/ /mnt/backup/archhq $exclude
