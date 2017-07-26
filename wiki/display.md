## Monitor layout and disabling DPMS

```
/etc/X11/xorg.conf.d/10-monitor.conf

#                 (1920,0)--------------+
# (0,360)--------+|                     |
# |              ||     2560 x 1440     |
# | 1920 x 1080  ||        DP-1         |
# |   DVI-D-2    ||                     |
# +--------------++---------------------+

Section "Monitor"
        Identifier      "DVI-D-2"
        Option          "PreferredMode" "1920x1080"
        Option          "Position"      "0 360"
        Option          "DPMS"          "false"
Endsection

Section "Monitor"
        Identifier      "DP-1"
        Option          "Primary"       "true"
        Option          "PreferredMode" "2560x1440"
        Option          "Position"      "1920 0"
        Option          "DPMS"          "false"
Endsection

Section "ServerLayout"
        Identifier      "ServerLayout0"
        Option          "StandbyTime"   "0"
        Option          "SuspendTime"   "0"
        Option          "OffTime"       "0"
        Option          "BlankTime"     "0"
EndSection
```

`Option "DPMS" "false"` and the `SeverLayout` section will make sure that the screen doesn't go black after a certain amount of time.

### Sources
- https://wiki.archlinux.org/index.php/Display_Power_Management_Signaling#Setting_up_DPMS_in_X

[Table of Contents](README.md)
