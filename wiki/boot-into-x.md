## Automatically login

To automatically log into tty1 add this file:
```
/etc/systemd/system/getty@tty1.service.d/override.conf

[Service]
Type=simple
ExecStart=
ExecStart=-/usr/bin/agetty --autologin undeadleech --noclear %I $TERM
```

This will login without waiting for systemd services that might pollute the logi prompt with boot-up messages. If you do not wish to login to X automatically, removing `Type=simple` will wait for a clear console. You will also need to replace `undeadleech` with the user that you want to login with.


## Automatically Start X

```
~/.zprofile

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
    [[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1 &> /dev/null
fi
```

Adding this to your `.zprofile` or `.bash_profile` will automatically start X when logging into tty1. It will surpress all debug messages that might be printed by `startx`.

## Sources:
- https://wiki.archlinux.org/index.php/Getty#Automatic_login_to_virtual_console
- https://wiki.archlinux.org/index.php/Xinit#Autostart_X_at_login

[Table of Contents](README.md)
