## ZFS Monitoring

ZFS pool health can be easily monitored using `zpool status -x`. A simple script
to report this to Kuma can be found at [../files/bin/report_pool_health.sh].

These are the corresponding systemd service and timer:

```
[Unit]
Description=Report ZFS pool health

[Service]
Nice=19
IOSchedulingClass=idle
KillSignal=SIGINT
ExecStart=/root/bin/report_pool_health.sh
```

```
[Unit]
Description=Minutely report ZFS pool health

[Timer]
OnCalendar=Minutely
AccuracySec=1s
Persistent=true

[Install]
WantedBy=multi-user.target
```
