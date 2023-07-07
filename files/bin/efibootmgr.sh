#!/bin/bash
efibootmgr -d /dev/disk/by-id/nvme-eui.0025385c9150334e -p 1 -c -L "Arch Linux" -l "\vmlinuz-linux" -u "root=/dev/disk/by-id/nvme-eui.0025385c9150334e-part2 rw initrd=\amd-ucode.img initrd=\initramfs-linux.img init=/usr/lib/systemd/systemd quiet libahci.ignore_sss=1 random.trust_cpu=on"

