#!/bin/bash
efibootmgr -d /dev/sda -p 1 -c -L "Arch Linux" -l /vmlinuz-linux -u "root=/dev/sda2 rw initrd=/intel-ucode.img initrd=/initramfs-linux.img quiet loglevel=0 vga=current libahci.ignore_sss=1"
