## Disable Mouse Acceleration

https://wiki.archlinux.org/index.php/Mouse_acceleration#Disabling_mouse_acceleration

```
/etc/X11/xorg.conf.d/50-mouse-acceleration.conf

Section "InputClass"
    Identifier "My Mouse"
    Driver "libinput"
    MatchIsPointer "yes"
    Option "AccelProfile" "flat"
EndSection
```
