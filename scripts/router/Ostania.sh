route add -net 0.0.0.0 netmask 0.0.0.0 gw 10.25.0.5

echo '
nameserver 192.168.122.1
' > /etc/resolv.conf

apt-get update &
wait
apt-get install isc-dhcp-relay -y &
wait

echo '
SERVERS="10.25.0.11"
INTERFACES="eth0 eth1 eth2 eth3"
OPTIONS=
' > /etc/default/isc-dhcp-relay

service isc-dhcp-relay restart
service isc-dhcp-relay restart

iptables -A PREROUTING -t nat -p tcp -d 10.25.0.19 --dport 80 -m statistic --mode nth --every 2 --packet 0 -j DNAT --to-destination 10.25.0.19:80
iptables -A PREROUTING -t nat -p tcp -d 10.25.0.19 --dport 80 -j DNAT --to-destination 10.25.0.18:80
iptables -A PREROUTING -t nat -p tcp -d 10.25.0.18 --dport 443 -m statistic --mode nth --every 2 --packet 0 -j DNAT --to-destination 10.25.0.18:443
iptables -A PREROUTING -t nat -p tcp -d 10.25.0.18 --dport 443 -j DNAT --to-destination 10.25.0.19:443