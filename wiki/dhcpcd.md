# DHCPCD
##### Using a static IP and noarp to boost system startup time.

|          |                                                                                    |
|----------|------------------------------------------------------------------------------------|
| ArchWiki | https://wiki.archlinux.org/index.php/Dhcpcd#Speed_up_DHCP_by_disabling_ARP_probing |
| ArchWiki | https://wiki.archlinux.org/index.php/Dhcpcd#Static_profile                         |

Example configuration of `/etc/dhcpcd.conf`:
```
/etc/dhcpcd.conf

noarp
interface enp0s31f6
static ip_address=192.168.178.28/24
static routers=192.168.178.1
static domain_name_servers=192.168.178.1 82.211.31.248
```

 - Replace interface with actual ethernet interface name (`ip link`)
 - Replace `192.168.178.28` with your static IP address
 - Replace `192.168.178.1` with your router's IP address
 - Replace `82.211.31.248` with your DNS Server

 ###### What does `noarp` do?
 Arp checks if the assigned IP address is really not taken. This is usually not needed in home networks and can speed up dhcpcd by up to 5 seconds.
