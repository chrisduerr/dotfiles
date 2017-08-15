## Set the Xorg keyboard layout

```
/etc/X11/xorg.conf.d/00-keyboard.conf

Section "InputClass"
    Identifier      "system-keyboard"
    MatchIsKeyboard "on"
    Option          "XkbLayout"       "dvorak"
    Option          "XkbModel"        "pc104"
    Option          "XkbOptions"      "caps:backspace"
EndSection
```

### Sources:
- https://wiki.archlinux.org/index.php/Keyboard_configuration_in_Xorg

[Table of Contents](README.md)
