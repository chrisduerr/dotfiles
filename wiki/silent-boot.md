## Silent Boot

Enabling silent boot will remove all text from the bootup process. This can improve boot performance on fast machines using SSDs. It might also come with aesthetic benefits.

To enable silent boot use `quiet vga=current` as kernel parameter. This will reduce the output to a minimum. If you are still getting a lot of text during boot, you can further decrease the amount of messages sent using `quiet loglevel=0 vga=current`. You can try setting a loglevel between 0 and 7, where 0 is the most critical, and 7 is for debug messages.

## Sources:
- https://wiki.archlinux.org/index.php/Silent_boot

[Table of Contents](README.md)
