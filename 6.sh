# Aldarion 

nano /etc/dhcp/dhcpd.conf

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

service isc-dhcp-server restart

