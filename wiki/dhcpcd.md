## Use a static IP and noarp to boost boot time

### Using a static IP

A static IP can improve boot time performance, it will also make sure your computer always has the same address in the local network.

```
/etc/dhcpcd.conf

interface enp0s31f6
static ip_address=192.168.178.28/24
static routers=192.168.178.1
static domain_name_servers=192.168.178.1 82.211.31.248
```

The following variables will probably need to be replaced:

|                  |               |
|------------------|---------------|
| `enp0s31f6`      | Interface     |
| `192.168.178.28` | Static IP     |
| `192.168.178.1`  | Router IP     |
| `82.211.31.248`  | DNS Server IP |

### Adding noarp

Arp checks if the assigned IP address is not taken. This is usually not needed in home networks and can speed up dhcpcd by up to 5 seconds.

```
/etc/dhcpcd.conf

noarp
```

### Sources
- https://wiki.archlinux.org/index.php/Dhcpcd#Speed_up_DHCP_by_disabling_ARP_probing
- https://wiki.archlinux.org/index.php/Dhcpcd#Static_profile

[Table of Contents](README.md)
