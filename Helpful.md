# Helpful Links Collection
A collection of Links and Information I use to make sure I didn't miss anything when setting up a new Linux machine.  
Not all of this is useful for every install but some things just get missed too often.

## Table of Content
**[1.0 DNSCrypt](#dnscrypt)**

#### DNSCrypt
Setting up encrypted and authenticated DNS traffic.
|             |                                              |
|-------------|----------------------------------------------|
| DNS Servers | https://www.opennicproject.org               |
| Archwiki    | https://wiki.archlinux.org/index.php/DNSCrypt|
###### TL;DR (Archlinux):
 - Select a DNS Server that supports DNSCrypt from http://servers.opennicproject.org
 - Select a Resolver from https://github.com/jedisct1/dnscrypt-proxy/blob/master/dnscrypt-resolvers.csv
 - Install `dnscrypt-proxy`
 - Open `/usr/lib/systemd/system/dnscrypt-proxy.service` and add your resolver and user
 - Set content of `/etc/resolv.conf` to `nameserver 127.0.0.1`
 - `systemctl enable dnscrypt-proxy.service`
