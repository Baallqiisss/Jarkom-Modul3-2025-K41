# NODE ERENDIS (telnet 10.15.43.32 5899)

apt-get update && apt-get install -y bind9 bind9utils bind9-doc dnsutils

# nano /etc/bind/named.conf.local
zone "k41.com" {
    type master;
    file "/etc/bind/db.k41.com";
    allow-transfer { 10.84.3.4; };  // Amdir diizinkan menyalin
};

# nano /etc/bind/db.k41.com
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

service named restart

# NODE AMDIR (telnet 10.15.43.32 5899)
apt-get update && apt-get install -y bind9 bind9utils bind9-doc dnsutils

# nano /etc/bind/named.conf.local
zone "k41.com" {
    type slave;
    masters { 10.84.3.3; };
    file "/var/lib/bind/db.k41.com";
};

# nano /etc/bind/named.conf.options
options {
    directory "/var/cache/bind";
    allow-query { any; };
    auth-nxdomain no;
    listen-on-v6 { any; };
};

service named restart

# Testing dari client ( Anarion telnet 10.15.43.32 5894)
nano /etc/resolv.conf

nameserver 10.84.3.3
nameserver 10.84.3.4

# Tes ping client ) 
ping palantir.k41.com
ping galadriel.k41.com
ping oropher.k41.com

# Tes nslookup dari client
nslookup elendil.k41.com 10.84.3.3    # Cek ke DNS Master
nslookup elendil.k41.com 10.84.3.4    # Cek ke DNS Slave


