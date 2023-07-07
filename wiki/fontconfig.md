## Font Configuration

Creating the following symlinks will do the job for every distro using X. This will create reasonable defaults for font rendering.

Settings required on latest Archlinux:
- `ln -s /usr/share/fontconfig/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d`

Previously required settings:
- `ln -s /usr/share/fontconfig/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d`
- `ln -s /usr/share/fontconfig/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d`
- `ln -s /usr/share/fontconfig/conf.avail/10-hinting-slight.conf /etc/fonts/conf.d`

[Table of Contents](README.md)
