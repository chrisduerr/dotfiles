## Pacman paccache hook

Using pacman hooks it is possible to execute an operation after certain pacman tasks. Because people often forget to clear pacman's package cache this is the prime target for setting up a hook for it. Using this hook pacman will make sure it only keeps two old version `-rk2` and removes all versions of uninstalled packages `-ruk0` whenever a package is installed, updated or removed.

```
/etc/pacman.d/hooks/paccache.hook

[Trigger]
Operation = Install
Operation = Upgrade
Operation = Remove
Type = Package
Target = *

[Action]
Description = Cleaning package cache…
When = PostTransaction
Exec = /usr/bin/sh -c "paccache -rk2 && paccache -ruk0"
```

## Sources:
- https://www.archlinux.org/pacman/alpm-hooks.5.html

[Table of Contents](README.md)
