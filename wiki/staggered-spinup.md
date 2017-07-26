## Disabling staggered spin-up

Staggered spin-up causes the OS to propbe ATA interfaces serially to reduce peak power usage. This is unacceptable, to check if it is enabled, run `dmesg | grep SSS`. If there is any output, staggered spin-up is enabled.

To disable it, add `libahci.ignore_sss=1` to your kernel parameters.

## Sources:
- https://wiki.archlinux.org/index.php/Improving_performance/Boot_process#Staggered_spin-up

[Table of Contents](README.md)
