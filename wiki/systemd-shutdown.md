## Systemd Shutdown Jobs

Running a systemd job every time the system shuts down allows for easy backup of files. The following systemd service will run the `backup.sh` script before every system shutdown.

```
[Unit]
Description=Backup home directory

[Service]
Type=oneshot
RemainAfterExit=true
TimeoutStopSec=infinity
ExecStop=/bin/bash /home/undeadleech/bin/backup.sh

[Install]
WantedBy=multi-user.target
```
