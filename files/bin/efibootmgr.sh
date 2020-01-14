#!/bin/bash
efibootmgr --timeout 0 -d /dev/sda -p 1 -c -L "Arch Linux" -l /vmlinuz-linux -u "root=/dev/sda2 rw initrd=/initramfs-linux.img init=/usr/lib/systemd/systemd quiet libahci.ignore_sss=1 amdgpu.cik_support=1 radeon.cik_support=0 mce=off"
