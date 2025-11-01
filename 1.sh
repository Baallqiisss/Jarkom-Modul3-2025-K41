## Node Durin (Router + DHCP Relay)

```bash
auto lo
iface lo inet loopback
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
    address 10.84.1.1
    netmask 255.255.255.0

auto eth2
iface eth2 inet static
    address 10.84.2.1
    netmask 255.255.255.0

auto eth3
iface eth3 inet static
    address 10.84.3.1
    netmask 255.255.255.0

auto eth4
iface eth4 inet static
    address 10.84.4.1
    netmask 255.255.255.0

auto eth5
iface eth5 inet static
    address 10.84.5.1
    netmask 255.255.255.0

up echo 1 > /proc/sys/net/ipv4/ip_forward
up echo 'net.ipv4.ip_forward=1' > /etc/sysctl.conf

up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 10.84.0.0/16

up iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
up iptables -A FORWARD -i eth2 -o eth0 -j ACCEPT
up iptables -A FORWARD -i eth3 -o eth0 -j ACCEPT
up iptables -A FORWARD -i eth4 -o eth0 -j ACCEPT
up iptables -A FORWARD -i eth5 -o eth0 -j ACCEPT
up iptables -A FORWARD -i eth0 -o eth1 -m state --state RELATED,ESTABLISHED -j ACCEPT
up iptables -A FORWARD -i eth0 -o eth2 -m state --state RELATED,ESTABLISHED -j ACCEPT
up iptables -A FORWARD -i eth0 -o eth3 -m state --state RELATED,ESTABLISHED -j ACCEPT
up iptables -A FORWARD -i eth0 -o eth4 -m state --state RELATED,ESTABLISHED -j ACCEPT
up iptables -A FORWARD -i eth0 -o eth5 -m state --state RELATED,ESTABLISHED -j ACCEPT

```

##  Node Elendil

```bash
auto eth0
iface eth0 inet static
    address 10.84.1.2
    netmask 255.255.255.0
    gateway 10.84.1.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

## Node Isildur

```bash
auto eth0
iface eth0 inet static
    address 10.84.1.3
    netmask 255.255.255.0
    gateway 10.84.1.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

## Node Anarion

```bash
auto eth0
iface eth0 inet static
    address 10.84.1.4
    netmask 255.255.255.0
    gateway 10.84.1.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

## Node Miriel

```bash
auto eth0
iface eth0 inet static
    address 10.84.1.5
    netmask 255.255.255.0
    gateway 10.84.1.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

## Node Amandil (Client DHCP)

```bash
auto eth0
iface eth0 inet dhcp
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

## Node Elros (Load Balancer Laravel)

```bash
auto eth0
iface eth0 inet static
    address 10.84.1.7
    netmask 255.255.255.0
    gateway 10.84.1.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```
## Node Gilgalad (DHCP Client)

```bash
auto eth0
iface eth0 inet dhcp
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

## Node Celebrimbor

```bash
auto eth0
iface eth0 inet static
    address 10.84.2.3
    netmask 255.255.255.0
    gateway 10.84.2.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

## Node Pharazon

```bash
auto eth0
iface eth0 inet static
    address 10.84.2.4
    netmask 255.255.255.0
    gateway 10.84.2.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

## Node Galadriel

```bash
auto eth0
iface eth0 inet static
    address 10.84.2.5
    netmask 255.255.255.0
    gateway 10.84.2.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

## Node Celeborn

```bash
auto eth0
iface eth0 inet static
    address 10.84.2.6
    netmask 255.255.255.0
    gateway 10.84.2.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

## Node Oropher

```bash
auto eth0
iface eth0 inet static
    address 10.84.2.7
    netmask 255.255.255.0
    gateway 10.84.2.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

---

## Node Khamul (Client Fixed Address)

```bash
auto eth0
iface eth0 inet dhcp
    hwaddress ether 02:42:dc:08:82:00
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

---

## Node Erendis (DNS Master)

```bash
auto eth0
iface eth0 inet static
    address 10.84.3.3
    netmask 255.255.255.0
    gateway 10.84.3.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

## Node Amdir (DNS Slave)

```bash
auto eth0
iface eth0 inet static
    address 10.84.3.4
    netmask 255.255.255.0
    gateway 10.84.3.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

## Node Aldarion (DHCP Server)

```bash
auto eth0
iface eth0 inet static
    address 10.84.4.2
    netmask 255.255.255.0
    gateway 10.84.4.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

## Node Palantir (Database Server)

```bash
auto eth0
iface eth0 inet static
    address 10.84.4.3
    netmask 255.255.255.0
    gateway 10.84.4.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

## Node Narvi (Database Slave)

```bash
auto eth0
iface eth0 inet static
    address 10.84.4.4
    netmask 255.255.255.0
    gateway 10.84.4.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

## Node Minastir (Forward Proxy)

```bash
auto eth0
iface eth0 inet static
    address 10.84.5.2
    netmask 255.255.255.0
    gateway 10.84.5.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

---

## Cek & Tes

```bash
apt-get update && apt-get install -y nano dnsutils lynx htop curl apache2-utils

ping -c 3 8.8.8.8
ping -c 3 google.com
```
