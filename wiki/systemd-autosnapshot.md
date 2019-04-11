## Automated Btrfs Snapshots

You can automatically generate snapshots usinge the [`snapshot`](../files/bin/snapshot)
script.

To automate this process, place the script into the `/usr/bin` directory and
add the following systemd service:

```
/etc/systemd/system/btrfs-snapshot.service

[Unit]
Description=Btrfs Snapshot Creation

[Service]
Type=oneshot
ExecStart=/usr/bin/snapshot

[Install]
WantedBy=multi-user.target
```

Add the following timer to run this systemd service on a daily basis:

```
/etc/systemd/system/btrfs-snapshot.timer

[Unit]
Description=Daily Btrfs Snapshot Task

[Timer]
OnCalendar=daily
Persistent=true

[Install]
WantedBy=timers.target
```
