apt-get install apache2 -y &
wait
echo 'Garden' > '/var/www/html/index.html'

echo 'Listen 80
Listen 443' > '/etc/apache2/ports.conf'

service apache2 restart
service apache2 restart

iptables -A INPUT -m time --timestart 07:00 --timestop 16:00 --weekdays Mon,Tue,Wed,Thu,Fri -j ACCEPT

iptables -N LOGGING
iptables -A INPUT -j LOGGING
iptables -A LOGGING -j LOG --log-prefix "IPTables-Rejected: "
iptables -A LOGGING -j REJECT