## Disable the PC Speaker

Running the following command will blacklist the `pcspkr` module and prevent it from getting loaded by `udev` at boot.

```
echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf
```

### Sources:
- https://wiki.archlinux.org/index.php/PC_speaker

[Table of Contents](README.md)
