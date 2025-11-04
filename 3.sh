# === NODE MINASTIR === telnet 10.15.43.32 5905
apt-get update && apt-get install -y bind9 bind9utils bind9-doc dnsutils

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

# service named restart

# NODE LAIN (kecuali Durin & Minastir) 

# nano /etc/resolv.conf 
nameserver 10.84.5.2 ( minastir)

# === TEST === (contoh elros telnet 10.15.43.32 5896)
ping google.com