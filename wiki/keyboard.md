## Set the Xorg keyboard layout

```
/etc/X11/xorg.conf.d/00-keyboard.conf

Section "InputClass"
    Identifier      "system-keyboard"
    MatchIsKeyboard "on"
    Option          "XkbOptions"      "compose:ralt"
EndSection
```

### Sources:
- https://wiki.archlinux.org/index.php/Keyboard_configuration_in_Xorg

[Table of Contents](README.md)
