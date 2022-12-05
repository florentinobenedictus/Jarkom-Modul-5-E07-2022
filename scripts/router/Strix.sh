iptables -t nat -A POSTROUTING -o eth0 -j SNAT -s 10.25.0.0/21 --to-source 192.168.122.2

route add -net 10.25.0.8 netmask 255.255.255.248 gw 10.25.0.2
route add -net 10.25.0.128 netmask 255.255.255.128 gw 10.25.0.2
route add -net 10.25.4.0 netmask 255.255.252.0 gw 10.25.0.2

route add -net 10.25.2.0 netmask 255.255.254.0 gw 10.25.0.6
route add -net 10.25.1.0 netmask 255.255.255.0 gw 10.25.0.6
route add -net 10.25.0.16 netmask 255.255.255.248 gw 10.25.0.6


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