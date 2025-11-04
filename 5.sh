# NODE ERENDIS (telnet 10.15.43.32 5899)

nano /etc/bind/db.k41.com
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

# nano /etc/bind/named.conf.local
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

# nano /etc/bind/3.84.10.in-addr.arpa

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

# nano /etc/bind/named.conf.options
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

service named restart

# Node Amdir (telnet 10.15.43.32 5869 )

# nano /etc/bind/named.conf.local

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

service named restart

# == Client (misal Miriel (telnet 10.15.43.32 5897) / Celebrimbor ())

# nano /etc/resolv.conf
nameserver 10.84.3.3
nameserver 10.84.3.4

# TES 
1. Alias (CNAME) Apakah www.k41.com bisa diarahkan ke domain utama k41.com

dig @10.84.3.3 www.k41.com 
nslookup www.k41.com

2. Reverse DNS (PTR) Apakah IP Erendis (10.84.3.3) dan Amdir (10.84.3.4) bisa di-resolve balik ke namanya (ns1.k41.com, ns2.k41.com)

dig -x 10.84.3.3 @10.84.3.3 
dig -x 10.84.3.4 @10.84.3.3

3. TXT Record (pesan rahasia) Apakah domain k41.com menyimpan TXT record berisi dua pesan rahasia
dig elros.k41.com TXT 
dig pharazon.txt.com TXT