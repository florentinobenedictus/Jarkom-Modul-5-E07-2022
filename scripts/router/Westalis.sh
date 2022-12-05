route add -net 0.0.0.0 netmask 0.0.0.0 gw 10.25.0.1

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