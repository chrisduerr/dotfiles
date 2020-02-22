## Automated Btrfs Snapshots

You can automatically generate snapshots usinge the [`snapshot`](../files/bin/snapshot)
script.

To automate this process, place the script into the `/usr/bin` directory and
add the following systemd service:

```
/etc/systemd/system/btrfs-snapshot.service

[Unit]
Description=Daily Btrfs Snapshot

[Service]
Type=oneshot
ExecStart=/usr/bin/snapshot /snapshots/daily 7

[Install]
WantedBy=multi-user.target
```

Add the following timer to run this systemd service on a daily basis:

```
/etc/systemd/system/btrfs-snapshot.timer

[Unit]
Description=Daily Btrfs Snapshot

[Timer]
OnCalendar=daily
Persistent=true

[Install]
WantedBy=timers.target
```

The same can then also be done for weekly/monthly/yearly snapshots.
