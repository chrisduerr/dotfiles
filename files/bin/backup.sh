#!/bin/bash

exclude="--exclude /programming/*/*/target \
         --exclude /programming/*/*/build \
         --exclude /programming/massive \
         --exclude /downloads \
         --exclude /music \
         --exclude /.cache \
         --exclude /.debug \
         --exclude /.config/nvim/plugins \
         --exclude /.rustup \
         --exclude /.cargo \
         --exclude /.local/share/Steam/steamapps/compatdata/*/pfx/drive_c/Program* \
         --exclude /.local/share/Steam/steamapps/shadercache \
         --exclude /.local/share/Steam/steamapps/common \
         --exclude alarm-sysroot"

# Rsync files
rsync -Phav --delete /home/undeadleech/ /mnt/zfast/backup/archhq $exclude
