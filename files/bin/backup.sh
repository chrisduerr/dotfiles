#!/bin/bash

exclude="--exclude /programming/rust/**/target \
         --exclude /programming/rust/rust \
         --exclude /programming/c/**/build \
         --exclude /movies \
         --exclude /music \
         --exclude /downloads \
         --exclude /.cache \
         --exclude /.config/nvim/plugins \
         --exclude /.rustup \
         --exclude /.cargo \
         --exclude /.local/share/Steam/steamapps/common \
         --exclude alarm-sysroot"

# Rsync files
rsync -Phav --delete /home/undeadleech/ /mnt/zfast/backup/archhq $exclude
