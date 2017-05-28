## Using a static IP and noarp to boost boot time

|          |                                                                                    |
|----------|------------------------------------------------------------------------------------|
| ArchWiki | https://wiki.archlinux.org/index.php/Dhcpcd#Speed_up_DHCP_by_disabling_ARP_probing |
| ArchWiki | https://wiki.archlinux.org/index.php/Dhcpcd#Static_profile                         |

```
/etc/dhcpcd.conf

noarp
interface enp0s31f6
static ip_address=192.168.178.28/24
static routers=192.168.178.1
static domain_name_servers=192.168.178.1 82.211.31.248
```

|                  |               |
|------------------|---------------|
| `enp0s31f6`      | Interface     |
| `192.168.178.28` | Static IP     |
| `192.168.178.1`  | Router IP     |
| `82.211.31.248`  | DNS Server IP |

 ##### What does `noarp` do?
 Arp checks if the assigned IP address is really not taken. This is usually not needed in home networks and can speed up dhcpcd by up to 5 seconds.
