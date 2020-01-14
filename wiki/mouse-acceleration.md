## Disabling Mouse Acceleration

```
/etc/X11/xorg.conf.d/50-mouse-acceleration.conf

Section "InputClass"
    Identifier "My Mouse"
    Driver "libinput"
    MatchIsPointer "yes"
    Option "AccelProfile" "flat"
    Option "AccelSpeed" "0"
EndSection
```

### Sources:
- https://wiki.archlinux.org/index.php/Mouse_acceleration#Disabling_mouse_acceleration

[Table of Contents](README.md)
