#!/bin/bash
efibootmgr --timeout 0 -d /dev/sda -p 1 -c -L "Arch Linux" -l /vmlinuz-linux -u "root=/dev/sda2 rw initrd=/intel-ucode.img initrd=/initramfs-linux.img quiet loglevel=0 libahci.ignore_sss=1 amdgpu.cik_support=1 radeon.cix_support=0"
