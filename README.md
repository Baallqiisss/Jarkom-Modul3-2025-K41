# Jarkom-Modul-3-2025-K41

|Nama kelompok                | nrp         |
|-----------------------------|-------------|
| Balqis Sani Sabillah        |  5027241002 |   

## Modul 3
Topology Jaringan 

<img width="1919" height="1146" alt="Image" src="https://github.com/user-attachments/assets/07816f39-7f72-4e7a-8b56-4fd3c27f16d9" />

## No 1
Di awal Zaman Kedua, setelah kehancuran Beleriand, para Valar menugaskan untuk membangun kembali jaringan komunikasi antar kerajaan. Para Valar menyalakan Minastir, Aldarion, Erendis, Amdir, Palantir, Narvi, Elros, Pharazon, Elendil, Isildur, Anarion, Galadriel, Celeborn, Oropher, Miriel, Amandil, Gilgalad, Celebrimbor, Khamul, dan pastikan setiap node (selain Durin sang penghubung antar dunia) dapat sementara berkomunikasi dengan Valinor/Internet (nameserver 192.168.122.1) untuk menerima instruksi awal.

## Jawaban
### Node Durin 
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
###  Node Elendil
```bash
auto eth0
iface eth0 inet static
    address 10.84.1.2
    netmask 255.255.255.0
    gateway 10.84.1.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```
### Node Isildur
```bash
auto eth0
iface eth0 inet static
    address 10.84.1.3
    netmask 255.255.255.0
    gateway 10.84.1.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```
### Node Anarion
```bash
auto eth0
iface eth0 inet static
    address 10.84.1.4
    netmask 255.255.255.0
    gateway 10.84.1.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```
### Node Miriel
```bash
auto eth0
iface eth0 inet static
    address 10.84.1.5
    netmask 255.255.255.0
    gateway 10.84.1.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```
### Node Amandil (Client DHCP)
```bash
auto eth0
iface eth0 inet dhcp
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```
### Node Elros (Load Balancer Laravel)
```
auto eth0
iface eth0 inet static
    address 10.84.1.7
    netmask 255.255.255.0
    gateway 10.84.1.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```
### Node Gilgalad (DHCP Client)
```
auto eth0
iface eth0 inet dhcp
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```
### Node Celebrimbor
```
auto eth0
iface eth0 inet static
    address 10.84.2.3
    netmask 255.255.255.0
    gateway 10.84.2.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```
### Node Pharazon
```bash
auto eth0
iface eth0 inet static
    address 10.84.2.4
    netmask 255.255.255.0
    gateway 10.84.2.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```
### Node Galadriel
```bash
auto eth0
iface eth0 inet static
    address 10.84.2.5
    netmask 255.255.255.0
    gateway 10.84.2.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```
### Node Celeborn
```bash
auto eth0
iface eth0 inet static
    address 10.84.2.6
    netmask 255.255.255.0
    gateway 10.84.2.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```
### Node Oropher
```bash
auto eth0
iface eth0 inet static
    address 10.84.2.7
    netmask 255.255.255.0
    gateway 10.84.2.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```
### Node Khamul (Client Fixed Address)
```bash
auto eth0
iface eth0 inet dhcp
    hwaddress ether 02:42:dc:08:82:00
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```
### Node Erendis (DNS Master)
```bash
auto eth0
iface eth0 inet static
    address 10.84.3.3
    netmask 255.255.255.0
    gateway 10.84.3.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```
### Node Amdir (DNS Slave)
```bash
auto eth0
iface eth0 inet static
    address 10.84.3.4
    netmask 255.255.255.0
    gateway 10.84.3.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```
### Node Aldarion (DHCP Server)
```bash
auto eth0
iface eth0 inet static
    address 10.84.4.2
    netmask 255.255.255.0
    gateway 10.84.4.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```
### Node Palantir (Database Server)
```bash
auto eth0
iface eth0 inet static
    address 10.84.4.3
    netmask 255.255.255.0
    gateway 10.84.4.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```
### Node Narvi (Database Slave)
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
### Cek & Tes (Node Manapun)
<img width="1070" height="213" alt="Image" src="https://github.com/user-attachments/assets/4e668f0d-1b6d-4bc4-9d5e-f2e8e7ca5f95" />

```bash
ping -c 3 8.8.8.8
ping -c 3 google.com
```
## No 2
Raja Pelaut Aldarion, penguasa wilayah Númenor, memutuskan cara pembagian tanah client secara dinamis. Ia menetapkan:
- Client Dinamis Keluarga Manusia: Mendapatkan tanah di rentang [prefix ip].1.6 - [prefix ip].1.34 dan [prefix ip].1.68 - [prefix ip].1.94.
- Client Dinamis Keluarga Peri: Mendapatkan tanah di rentang [prefix ip].2.35 - [prefix ip].2.67 dan [prefix ip].2.96 - [prefix ip].2.121.
- Khamul yang misterius: Diberikan tanah tetap di [prefix ip].3.95, agar keberadaannya selalu diketahui.
Pastikan Durin dapat menyampaikan dekrit ini ke semua wilayah yang terhubung dengannya.

## Jawaban 
### Aldarion (telnet 10.15.43.32 5810) 
```bash
apt-get update && apt-get install -y isc-dhcp-server
```

### nano /etc/default/isc-dhcp-server 
```bash
echo 'INTERFACESv4="eth0"' > /etc/default/isc-dhcp-server
echo 'INTERFACESv6=""' >> /etc/default/isc-dhcp-server
```
### nano /etc/dhcp/dhcpd.conf
```bash
# Manusia
subnet 10.84.1.0 netmask 255.255.255.0 {
    range 10.84.1.6 10.84.1.34;
    range 10.84.1.68 10.84.1.94;
    option routers 10.84.1.1;
    option broadcast-address 10.84.1.255;
    option domain-name-servers 10.84.3.3;
    default-lease-time 1800;  # 30 menit
    max-lease-time 3600;      # 1 jam
}

# Peri
subnet 10.84.2.0 netmask 255.255.255.0 {
    range 10.84.2.35 10.84.2.67;
    range 10.84.2.96 10.84.2.121;
    option routers 10.84.2.1;
    option broadcast-address 10.84.2.255;
    option domain-name-servers 10.84.3.3;
    default-lease-time 600;   # 10 menit
    max-lease-time 3600;      # 1 jam
}

# Fixed Address (Khamul dan subnet lain) 
subnet 10.84.3.0 netmask 255.255.255.0 {
    option routers 10.84.3.1;
    option broadcast-address 10.84.3.255;
    option domain-name-servers 10.84.3.3;
}

# Aldarion 
subnet 10.84.4.0 netmask 255.255.255.0 {
    option routers 10.84.4.1;
    option broadcast-address 10.84.4.255;
    option domain-name-servers 10.84.3.3;
}

# Khamul 
host Khamul {
    hardware ethernet 02:42:dc:08:82:00;
    fixed-address 10.84.3.95;
}

```
### Restart DHCP service
```bash
service isc-dhcp-server restart
```
### Durin (telnet 10.15.43.32 5814)
```bash
apt-get update && apt-get install -y isc-dhcp-relay
```
### nano /etc/default/isc-dhcp-relay
```bash
echo 'SERVERS="10.84.4.2"' > /etc/default/isc-dhcp-relay
echo 'INTERFACES="eth1 eth2 eth3 eth4"' >> /etc/default/isc-dhcp-relay
echo 'OPTIONS=""' >> /etc/default/isc-dhcp-relay

echo 'net.ipv4.ip_forward=1' > /etc/sysctl.conf
sysctl -p
```
### Restart relay
```bash
service isc-dhcp-relay restart
```
### Testing DHCP Client 
### Node Gilgalad (Client Keluarga Peri) telnet 10.15.43.32 5907

<img width="1374" height="228" alt="Image" src="https://github.com/user-attachments/assets/2166098d-b250-4b03-9c4f-17f24996351e" />

```bash
ip a (10.84.2.35 - 10.84.2.67)
```

### Node Amandil (Client Keluarga Manusia) telnet 10.15.43.32 5895

<img width="1430" height="230" alt="Image" src="https://github.com/user-attachments/assets/3fc705a7-14cf-4b1c-aed1-cb87e4d93c45" />

```bash
ip a (10.84.1.68 - 10.84.1.94)
```
### Node Khamul (Fixed Address) telnet 10.15.43.32 5898 

<img width="1387" height="240" alt="Image" src="https://github.com/user-attachments/assets/35d451bc-0ce7-4104-ac60-c23a26e73819" />

```bash
ip a (10.84.3.95)
```

## No 3
Untuk mengontrol arus informasi ke dunia luar (Valinor/Internet), sebuah menara pengawas, Minastir didirikan. 
Minastir mengatur agar semua node (kecuali Durin) hanya dapat mengirim pesan ke luar Arda setelah melewati pemeriksaan di Minastir.

## Jawaban 
### Node Minastir ( telnet 10.15.43.32 5905 )
```bash
apt-get update && apt-get install -y bind9 bind9utils bind9-doc dnsutils
```
### nano /etc/bind/named.conf.options 
```bash
options {
    directory "/var/cache/bind";

    forwarders {
        8.8.8.8;
        8.8.4.4;
        1.1.1.1;
    };

    forward only;

    allow-query { 
        10.84.0.0/16;
        localhost;
    };

    listen-on { any; };
    listen-on-v6 { none; };

    dnssec-validation auto;
    auth-nxdomain no;
    recursion yes;
    allow-recursion { 
        10.84.0.0/16;
        localhost;
    };
};
```
```
service named restart
```
### Node Lain (kecuali Durin & Minastir) 

### nano /etc/resolv.conf 
```bash
nameserver 10.84.5.2 ( minastir)
```
### Test

<img width="1086" height="268" alt="Image" src="https://github.com/user-attachments/assets/295a7083-a15b-4ab6-a46f-14c11c0d9c74" />

```bash
ping google.com
```

## No 4
Ratu Erendis, sang pembuat peta, menetapkan nama resmi untuk wilayah utama (<xxxx>.com). Ia menunjuk dirinya (ns1.<xxxx>.com) dan muridnya Amdir (ns2.<xxxx>.com) sebagai penjaga peta resmi. 
Setiap lokasi penting (Palantir, Elros, Pharazon, Elendil, Isildur, Anarion, Galadriel, Celeborn, Oropher) diberikan nama domain unik yang menunjuk ke lokasi fisik tanah mereka. 
Pastikan Amdir selalu menyalin peta (master-slave) dari Erendis dengan setia.

### Jawaban
## Node Erendis (telnet 10.15.43.32 5899)
```bash
apt-get update && apt-get install -y bind9 bind9utils bind9-doc dnsutils
```

### nano /etc/bind/named.conf.local
```bash
zone "k41.com" {
    type master;
    file "/etc/bind/db.k41.com";
    allow-transfer { 10.84.3.4; };  // Amdir diizinkan menyalin
};
```

### nano /etc/bind/db.k41.com
```bash
$TTL    604800
@       IN      SOA     ns1.k41.com. root.k41.com. (
                        2025103001 ; Serial
                        604800     ; Refresh
                        86400      ; Retry
                        2419200    ; Expire
                        604800 )   ; Negative Cache TTL
;
@               IN      NS      ns1.k41.com.
@               IN      NS      ns2.k41.com.

ns1             IN      A       10.84.3.3
ns2             IN      A       10.84.3.4

; ---------- Lokasi penting ----------
palantir        IN      A       10.84.4.3
elros           IN      A       10.84.1.7
pharazon        IN      A       10.84.2.4
elendil         IN      A       10.84.1.2
isildur         IN      A       10.84.1.3
anarion         IN      A       10.84.1.4
galadriel       IN      A       10.84.2.5
celeborn        IN      A       10.84.2.6
oropher         IN      A       10.84.2.7
minastir        IN      A       10.84.5.2
```
```bash
service named restart
```

### Node Amdir
```bash
apt-get update && apt-get install -y bind9 bind9utils bind9-doc dnsutils
```
### nano /etc/bind/named.conf.local
```bash
zone "k41.com" {
    type slave;
    masters { 10.84.3.3; };
    file "/var/lib/bind/db.k41.com";
};
```
### nano /etc/bind/named.conf.options
```bash
options {
    directory "/var/cache/bind";
    allow-query { any; };
    auth-nxdomain no;
    listen-on-v6 { any; };
};
```
```bash
service named restart
```
### Testing dari client 

### nano /etc/resolv.conf
```bash
nameserver 10.84.3.3
nameserver 10.84.3.4
```
### Tes ping client

<img width="840" height="536" alt="Image" src="https://github.com/user-attachments/assets/0cb2e46b-64f9-4017-b766-4b088c8ef05c" />

- ping palantir.k41.com
- ping galadriel.k41.com
- ping oropher.k41.com

### Tes nslookup dari client

<img width="770" height="311" alt="Image" src="https://github.com/user-attachments/assets/8e54fbe9-289e-4984-91b9-b975efd5e017" />

- nslookup elendil.k41.com 10.84.3.3    # Cek ke DNS Master
- nslookup elendil.k41.com 10.84.3.4    # Cek ke DNS Slave

## No.5
Untuk memudahkan, nama alias www.<xxxx>.com dibuat untuk peta utama <xxxx>.com. Reverse PTR juga dibuat agar lokasi Erendis dan Amdir dapat dilacak dari alamat fisik tanahnya. Erendis juga menambahkan pesan rahasia (TXT record) pada petanya: "Cincin Sauron" yang menunjuk ke lokasi Elros, dan "Aliansi Terakhir" yang menunjuk ke lokasi Pharazon. Pastikan Amdir juga mengetahui pesan rahasia ini.

## Jawaban 
### Node Erendis

### nano /etc/bind/db.k41.com
```bash
$TTL    604800
@       IN      SOA     k41.com. root.k41.com. (
                        2025110301 ; Serial
                        604800     ; Refresh
                        86400      ; Retry
                        2419200    ; Expire
                        604800 )   ; Negative Cache TTL

@       IN      NS      ns1.k41.com.
@       IN      NS      ns2.k41.com.

; Address NS
ns1     IN      A       10.84.3.3
ns2     IN      A       10.84.3.4

; Alias

www       IN      CNAME   palantir.k41.com.

; Lokasi penting
palantir    IN  A   10.84.4.3
narvi       IN  A   10.84.4.4
elros       IN  A   10.84.1.7
pharazon    IN  A   10.84.2.4
elendil     IN  A   10.84.1.2
isildur     IN  A   10.84.1.3
anarion     IN  A   10.84.1.4
galadriel   IN  A   10.84.2.5
celeborn    IN  A   10.84.2.6
oropher     IN  A   10.84.2.7
elros.k41.com.     IN      TXT     "Cincin Sauron"
pharazon.k41.com.  IN      TXT     "Aliansi Terakhir"
```
### nano /etc/bind/named.conf.local
```bash
zone "k41.com" {
    type master;
    file "/etc/bind/db.k41.com";
    allow-transfer { 10.84.3.4; }; // Amdir (slave)
};

zone "3.84.10.in-addr.arpa" {
    type master;
    file "/etc/bind/3.84.10.in-addr.arpa";
    allow-transfer { 10.84.3.4; };
};
```
### nano /etc/bind/3.84.10.in-addr.arpa
```bash
$TTL    604800
@       IN      SOA     k41.com. root.k41.com. (
                        2025110301
                        604800
                        86400
                        2419200
                        604800 )
;
@       IN      NS      ns1.k41.com.
@       IN      NS      ns2.k41.com.

; PTR Records (reverse lookup)
3       IN      PTR     ns1.k41.com.   ; 10.84.3.3
4       IN      PTR     ns2.k41.com.   ; 10.84.3.4
```
### nano /etc/bind/named.conf.options
```bash
options {
    directory "/var/cache/bind";

    forwarders {
        8.8.8.8;
        8.8.4.4;
        1.1.1.1;
    };

    forward only;

    allow-query {
        10.84.0.0/16;
        localhost;
    };

    recursion yes;
    allow-recursion {
        10.84.0.0/16;
        localhost;
    };

    listen-on { any; };
    listen-on-v6 { none; };

    dnssec-validation no;
    auth-nxdomain no;
};
```
```bash
service named restart
```

## Node Amdir

### nano /etc/bind/named.conf.local
```bash
zone "k41.com" {
    type slave;
    masters { 10.84.3.3; };
    file "/var/lib/bind/k41.com";
};

zone "3.84.10.in-addr.arpa" {
    type slave;
    masters { 10.84.3.3; };
    file "/var/lib/bind/3.84.10.in-addr.arpa";
};
```
```bash
service named restart
```
### Client (misal Miriel / Celebrimbor )

### nano /etc/resolv.conf
```bash
nameserver 10.84.3.3
nameserver 10.84.3.4
```
### TES 
1. Alias (CNAME) Apakah www.k41.com bisa diarahkan ke domain utama k41.com

<img width="894" height="535" alt="Image" src="https://github.com/user-attachments/assets/ed94949a-7409-4f0d-bbab-ad7b55b0e0d8" />

```bash
dig @10.84.3.3 www.k41.com 
nslookup www.k41.com
```
2. Reverse DNS (PTR) Apakah IP Erendis (10.84.3.3) dan Amdir (10.84.3.4) bisa di-resolve balik ke namanya (ns1.k41.com, ns2.k41.com)

<img width="920" height="1004" alt="Image" src="https://github.com/user-attachments/assets/8051a377-a2c0-47cc-a2ce-fa4a87c8af9e" />

```bash
dig -x 10.84.3.3 @10.84.3.3 
dig -x 10.84.3.4 @10.84.3.3
```
3. TXT Record (pesan rahasia) Apakah domain k41.com menyimpan TXT record berisi dua pesan rahasia
   
<img width="972" height="1010" alt="Screenshot 2025-11-05 173412" src="https://github.com/user-attachments/assets/8afa7042-13e4-4f6b-9239-9e95143590f5" />

```bash
dig elros.k41.com TXT 
dig pharazon.k41.com TXT 
```
## No.6 
Aldarion menetapkan aturan waktu peminjaman tanah. Ia mengatur:
Client Dinamis Keluarga Manusia dapat meminjam tanah selama setengah jam.
Client Dinamis Keluarga Peri hanya seperenam jam.
Batas waktu maksimal peminjaman untuk semua adalah satu jam.

## Jawaban 
### Aldarion 

### nano /etc/dhcp/dhcpd.conf
```bash
subnet 10.84.4.2 netmask 255.255.255.0 {
}

# Manusia
subnet 10.84.1.0 netmask 255.255.255.0 {
    range 10.84.1.6 10.84.1.34;
    range 10.84.1.68 10.84.1.94;
    option routers 10.84.1.1;
    option broadcast-address 10.84.1.255;
    option domain-name "k41.com";
    option domain-name-servers 10.84.3.3;
    default-lease-time 1800;  # 30 menit
    max-lease-time 3600;      # 1 jam
}

# Peri
subnet 10.84.2.0 netmask 255.255.255.0 {
    range 10.84.2.35 10.84.2.67;
    range 10.84.2.96 10.84.2.121;
    option routers 10.84.2.1;
    option broadcast-address 10.84.2.255;
    option domain-name "k41.com";
    option domain-name-servers 10.84.3.3;
    default-lease-time 600;   # 10 menit
    max-lease-time 3600;      # 1 jam
}

# Fixed Address (Khamul dan subnet lain) 
subnet 10.84.3.0 netmask 255.255.255.0 {
    option routers 10.84.3.1;
    option broadcast-address 10.84.3.255;
    option domain-name "k41.com";
    option domain-name-servers 10.84.3.3;
    default-lease-time 600;   
    max-lease-time 3600; 
}

# Aldarion 
subnet 10.84.4.0 netmask 255.255.255.0 {
    option routers 10.84.4.1;
    option broadcast-address 10.84.4.255;
    option domain-name-servers 10.84.3.3;
}

# Khamul 
host Khamul {
    hardware ethernet 02:42:dc:08:82:00;
    fixed-address 10.84.3.95;
}
```
```bash
service isc-dhcp-server restart
```
### No 7
Para Ksatria Númenor (Elendil, Isildur, Anarion) mulai membangun benteng pertahanan digital mereka menggunakan teknologi Laravel. 
Instal semua tools yang dibutuhkan (php8.4, composer, nginx) dan dapatkan cetak biru benteng dari Resource-laravel di setiap node worker Laravel. 
Cek dengan lynx di client.

## Jawaban 
```bash
apt update
apt install -y lsb-release apt-transport-https ca-certificates wget
wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list

apt update
apt install php8.4-mbstring php8.4-xml php8.4-cli php8.4-common php8.4-intl php8.4-opcache php8.4-readline php8.4-mysql php8.4-fpm php8.4-curl unzip wget -y
apt install nginx -y
wget https://getcomposer.org/download/2.0.13/composer.phar
chmod +x composer.phar
mv composer.phar /usr/bin/composer

apt install git -y
cd /var/www/
git clone https://github.com/elshiraphine/laravel-simple-rest-api.git
cd laravel-simple-rest-api
composer install
```

