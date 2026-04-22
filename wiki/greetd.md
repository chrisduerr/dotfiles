## GreetD - Automatically start Sway

To automatically log into VT 1 and start Sway, add this file:

```toml
#/etc/greetd/config.toml

[terminal]
# The VT to run the greeter on. Can be "next", "current" or a number
# designating the VT.
vt = 1

# The default session, also known as the greeter.
[default_session]
command = "zsh -l -c sway"
user = "undeadleech"
```

## Sources:
- https://wiki.archlinux.org/title/Greetd

[Table of Contents](README.md)
