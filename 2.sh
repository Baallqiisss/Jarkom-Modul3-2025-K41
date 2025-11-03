# Aldarion
apt-get update && apt-get install -y isc-dhcp-server

# Konfigurasi interface DHCP hanya IPv4 { /etc/default/isc-dhcp-server }
echo 'INTERFACESv4="eth0"' > /etc/default/isc-dhcp-server
echo 'INTERFACESv6=""' >> /etc/default/isc-dhcp-server

# Konfigurasi /etc/dhcp/dhcpd.conf

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
EOF

# Restart DHCP service
service isc-dhcp-server restart

# Durin
apt-get update && apt-get install -y isc-dhcp-relay

# Konfigurasi /etc/default/isc-dhcp-relay
echo 'SERVERS="10.84.4.2"' > /etc/default/isc-dhcp-relay
echo 'INTERFACES="eth1 eth2 eth3 eth4"' >> /etc/default/isc-dhcp-relay
echo 'OPTIONS=""' >> /etc/default/isc-dhcp-relay

echo 'net.ipv4.ip_forward=1' > /etc/sysctl.conf
sysctl -p

# Restart relay
service isc-dhcp-relay restart

#Testing DHCP Client 
# Node Gilgalad (Client Keluarga Peri)
ip a 

# Node Amandil (Client Keluarga Manusia)
ip a

# Node Khamul (Fixed Address)
ip a

# IP HARUS muncul 10.84.3.95
