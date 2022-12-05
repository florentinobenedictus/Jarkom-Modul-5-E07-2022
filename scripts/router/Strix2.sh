# Dijalankan setelah script WISE (DHCP Server) karena WISE tidak akan bisa ping google/apt karena seluruh transport layer didrop

iptables -N LOGGING
iptables -A FORWARD -i eth0 -p tcp -d 10.25.0.11 -j LOGGING
iptables -A FORWARD -i eth0 -p udp -d 10.25.0.11 -j LOGGING
iptables -A LOGGING -j LOG --log-prefix "IPTables-Dropped: "
iptables -A LOGGING -j DROP

service rsyslog restart