#!/bin/bash
efibootmgr --timeout 0 -d /dev/disk/by-id/nvme-eui.0025385c9150334e -p 1 -c -L "Arch Linux" -l /vmlinuz-linux -u "root=UUID=29f1ac7c-8f27-492e-91c7-c4a9d8293aec rw initrd=/amd-ucode.img initrd=/initramfs-linux.img init=/usr/lib/systemd/systemd quiet libahci.ignore_sss=1 amdgpu.cik_support=1 radeon.cik_support=0"
