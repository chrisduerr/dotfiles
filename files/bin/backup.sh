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

# Ensure the local network is available.
if ! ping -c 1 xcp-ng-1; then
    exit 1
fi

# Rsync files
systemd-inhibit --what sleep \
    rsync -Phav --delete /home/alarm/ /mnt/zfast/backup/lairphone $exclude
