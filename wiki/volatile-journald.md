## Volatile Journald

`systemd-journal-flush.service` can take quite some time. One way to improve this is by discarding logs on reboot. Setting `Storage=volatile` inside of `/etc/systemd/journald.conf` will make journald store logs in memory. This might not be worth the small gain you can get out of it, however it is an option when the service takes too much time.

## Sources:
- https://www.freedesktop.org/software/systemd/man/journald.conf.html

[Table of Contents](README.md)
