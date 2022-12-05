apt-get update &
wait
apt-get install bind9 -y &
wait

echo '
options {
        directory "/var/cache/bind";
        forwarders {
                192.168.122.1;
        };
        // dnssec-validation auto;
        allow-query{any;};
        auth-nxdomain no;    # conform to RFC1035
        listen-on-v6 { any; };
};
' > /etc/bind/named.conf.options

service bind9 restart
service bind9 restart

iptables -N LOGGING
iptables -A INPUT -p icmp -m connlimit --connlimit-above 2 --connlimit-mask 0 -j LOGGING
iptables -A LOGGING -j LOG --log-prefix "IPTables-Dropped: "
iptables -A LOGGING -j DROP