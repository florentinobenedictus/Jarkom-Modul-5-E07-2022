apt-get update &
wait
apt-get install isc-dhcp-server -y &
wait

echo 'INTERFACES="eth0"' > '/etc/default/isc-dhcp-server'

echo '
# Subnet A1
subnet 10.25.0.8 netmask 255.255.255.248 {
}

# Subnet A2
subnet 10.25.0.128 netmask 255.255.255.128 {
    range 10.25.0.130 10.25.0.255;
    option routers 10.25.0.129;
    option broadcast-address 10.25.0.255;

    option domain-name-servers 10.25.0.10;

    default-lease-time 360;
    max-lease-time 7200;
}

# Subnet A3
subnet 10.25.4.0 netmask 255.255.252.0 {
    range 10.25.4.2 10.25.7.255;
    option routers 10.25.4.1;
    option broadcast-address 10.25.7.255;

    option domain-name-servers 10.25.0.10;

    default-lease-time 360;
    max-lease-time 7200;
}

# Subnet A6
subnet 10.25.2.0 netmask 255.255.254.0 {
    range 10.25.2.2 10.25.3.255;
    option routers 10.25.2.1;
    option broadcast-address 10.25.3.255;

    option domain-name-servers 10.25.0.10;

    default-lease-time 360;
    max-lease-time 7200;
}

# Subnet A7
subnet 10.25.1.0 netmask 255.255.255.0 {
    range 10.25.1.2 10.25.1.255;
    option routers 10.25.1.1;
    option broadcast-address 10.25.1.255;

    option domain-name-servers 10.25.0.10;

    default-lease-time 360;
    max-lease-time 7200;
}' > /etc/dhcp/dhcpd.conf

service isc-dhcp-server restart
service isc-dhcp-server restart

iptables -N LOGGING
iptables -A INPUT -p icmp -m connlimit --connlimit-above 2 --connlimit-mask 0 -j LOGGING
iptables -A LOGGING -j LOG --log-prefix "IPTables-Dropped: "
iptables -A LOGGING -j DROP