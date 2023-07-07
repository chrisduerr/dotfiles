#!/bin/bash

exclude="--exclude /programming/**/target \
         --exclude /programming/**/build \
         --exclude /downloads \
         --exclude /.cache \
         --exclude /.config/nvim/plugins \
         --exclude /.rustup \
         --exclude /.cargo \
         --exclude /.local/share/Steam/steamapps/common \
         --exclude alarm-sysroot"

# Rsync files
rsync -Phav --delete /home/alarm/ /mnt/share/backup/minephonepro $exclude
