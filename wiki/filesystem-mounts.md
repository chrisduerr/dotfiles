## Removing the root partition from fstab

Removing the root partition from fstab can improve boot performance significantly if `fsck` is a bottleneck. First make sure that your bootloader is accessing the root partition using `rw` instead of `ro`. If this is the case, you can just remove the partition from `/etc/fstab` and it will work.

## Sources:
- https://wiki.archlinux.org/index.php/Improving_performance/Boot_process#Filesystem_mounts

[Table of Contents](README.md)
