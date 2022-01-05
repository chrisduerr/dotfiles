## Removing the root partition from fstab

Removing the root partition from fstab can improve boot performance
significantly if `fsck` is a bottleneck. First make sure that your bootloader is
accessing the root partition using `rw` instead of `ro`. If this is the case,
you can just remove the partition from `/etc/fstab` and it will work.

## NFS Shares

| Option                   | Purpose                          |
| ------------------------ | -------------------------------- |
| `noauto`                 | Don't mount at boot              |
| `_netdev`                | Tell systemd we need our network |
| `xsystemd.automount`     | Mount on access                  |
| `xsystemd.mount-timeout` | Maximum time before failure      |

```
/etc/fstab

backup:/mnt/backup/nfsbackup /mnt/backup nfs noauto,x-systemd.automount,x-systemd.mount-timeout=1s,_netdev 0 0
backup:/mnt/backup/nfsshare  /mnt/share  nfs noauto,x-systemd.automount,x-systemd.mount-timeout=1s,_netdev 0 0
```

## Sources:
- https://wiki.archlinux.org/index.php/Improving_performance/Boot_process#Filesystem_mounts
- https://wiki.archlinux.org/title/Fstab#Remote_file_system
- SYSTEMD.MOUNT(5)

[Table of Contents](README.md)
