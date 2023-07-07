## ZFS snapshots

Snapshots on ZFS can be automated using `zrepl`.

The following configuration file will automatically create and manage staggered
zfs snapshots with the prefix `zrepl_`:

```
/etc/zrepl/zrepl.yml

global:
  logging:
    # use syslog instead of stdout because it makes journald happy
    - type: syslog
      format: human
      level: warn

jobs:
  - name: frequent_snapshot
    type: snap
    filesystems: {
      "zfs<": true,
    }
    snapshotting:
      type: periodic
      interval: 15m
      prefix: zrepl_
    pruning:
      keep:
        # fade-out scheme for snapshots starting with `zrepl_`
        # - keep all created in the last two hours
        # - then destroy snapshots such that we keep 24 each 1 hour apart
        # - then destroy snapshots such that we keep 31 each 1 day apart
        # - then destroy snapshots such that we keep 12 each 1 month apart
        # - then destroy snapshots such that we keep 99 each 1 year apart
        # - then destroy all other snapshots
        - type: grid
          grid: 1x2h(keep=all) | 24x1h | 31x1d | 12x31d | 99x365d
          regex: "^zrepl_.*"
```
