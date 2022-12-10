# Jarkom-Modul-5-E07-2022


| Nama                        | NRP        |
|:---------------------------:|:----------:|
| Arya Nur Razzaq             | 5025201102 |
| Florentino Benedictus       | 5025201222 |
| Muhammad Zufarrifqi Prakoso | 5025201276 |

[Link Miro Kelompok (VLSM Tree, Tabel, Subnetting)](https://miro.com/app/board/uXjVP8hn0Es=/)

## Soal Modul 5
- [Soal](https://docs.google.com/document/d/1b-tRRx2BLu1RxCgXxnoI2lYJbG9E0C08adRppePfHxk/edit)


### Soal A
Tugas pertama kalian yaitu membuat topologi jaringan sesuai dengan rancangan yang diberikan Loid dibawah ini:<br>
#### Konfigurasi GNS3
![messageImage_1670661553403](https://user-images.githubusercontent.com/85059763/206843387-455a0ece-c09b-474f-b57b-47b6aaf2fb44.jpg)

### Soal B
Untuk menjaga perdamaian dunia, Loid ingin meminta kalian untuk membuat topologi tersebut menggunakan teknik CIDR atau VLSM setelah melakukan subnetting.<br>
#### Tabel VLSM
![messageImage_1670661525990](https://user-images.githubusercontent.com/85059763/206843521-62435281-1959-47c8-83c5-8c98e049f501.jpg)
#### VLSM
![messageImage_1670661542724](https://user-images.githubusercontent.com/85059763/206843442-ebd3609b-4de8-4d5a-b741-96b1d1b170bf.jpg)

### Soal C
Anya, putri pertama Loid, juga berpesan kepada anda agar melakukan Routing agar setiap perangkat pada jaringan tersebut dapat terhubung.<br><br>
Konfigurasi pada tiap node:
#### Strix
```
auto eth0
iface eth0 inet static
       address 192.168.122.2
       netmask 255.255.255.252
       gateway 192.168.122.1
       up echo nameserver 192.168.122.1 > /etc/resolv.conf

auto eth1
iface eth1 inet static
        address 10.25.0.5
        netmask 255.255.255.252

auto eth2
iface eth2 inet static
         address 10.25.0.1
         netmask 255.255.255.252
```

#### Westalis
```
auto eth0
iface eth0 inet static
        address 10.25.0.2
        netmask 255.255.255.252
        gateway 10.25.0.1

auto eth1
iface eth1 inet static
        address 10.25.0.9
        netmask 255.255.255.248

auto eth2
iface eth2 inet static
         address 10.25.0.129
         netmask 255.255.255.128

auto eth3
iface eth3 inet static
         address 10.25.4.1
         netmask 255.255.252.0
```

#### Ostania
```
auto eth0
iface eth0 inet static
          address 10.25.0.6
          netmask 255.255.255.252
          gateway 10.25.0.5

auto eth1
iface eth1 inet static
          address 10.25.0.17
          netmask 255.255.255.248

auto eth2
iface eth2 inet static
          address 10.25.2.1
          netmask 255.255.254.0

auto eth3
iface eth3 inet static
          address 10.25.1.1
          netmask 255.255.255.0
```

#### Desmond, Forger, Blackbell, Briar
```
auto eth0
iface eth0 inet dhcp
```

#### Eden
```
auto eth0
iface eth0 inet static
       address 10.25.0.10
       netmask 255.255.255.248
       gateway 10.25.0.9
       up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

#### Wise
```
auto eth0
iface eth0 inet static
       address 10.25.0.11
       netmask 255.255.255.248
       gateway 10.25.0.9
       up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

#### Garden
```
auto eth0
iface eth0 inet static
       address 10.25.0.18
       netmask 255.255.255.248
       gateway 10.25.0.17
       up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

#### SSS
```
auto eth0
iface eth0 inet static
       address 10.25.0.18
       netmask 255.255.255.248
       gateway 10.25.0.17
       up echo nameserver 192.168.122.1 > /etc/resolv.conf
```
#### Static Routing
```
# Pada Strix
route add -net 10.25.0.8 netmask 255.255.255.248 gw 10.25.0.2
route add -net 10.25.0.128 netmask 255.255.255.128 gw 10.25.0.2
route add -net 10.25.4.0 netmask 255.255.252.0 gw 10.25.0.2

route add -net 10.25.2.0 netmask 255.255.254.0 gw 10.25.0.6
route add -net 10.25.1.0 netmask 255.255.255.0 gw 10.25.0.6
route add -net 10.25.0.16 netmask 255.255.255.248 gw 10.25.0.6
```
#### Default Routing
```
# Pada Ostania
route add -net 0.0.0.0 netmask 0.0.0.0 gw 10.25.0.5
# Pada Westalis
route add -net 0.0.0.0 netmask 0.0.0.0 gw 10.25.0.1
```
#### Testing
Dilakukan dengan ping antar node seperti contoh berikut<br>
![image](https://user-images.githubusercontent.com/85059763/206848695-33d02d13-404d-412b-9399-84536f6975ea.png)<br>

### Soal D
Tugas berikutnya adalah memberikan ip pada subnet Forger, Desmond, Blackbell, dan Briar secara dinamis menggunakan bantuan DHCP server. Kemudian kalian ingat bahwa kalian harus setting DHCP Relay pada router yang menghubungkannya.
#### Setup DHCP Server di WISE
```
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
```
#### Setup DHCP Relay di Ostania, Strix, Westalis
```
echo '
SERVERS="10.25.0.11"
INTERFACES="eth0 eth1 eth2 eth3"
OPTIONS=
' > /etc/default/isc-dhcp-relay

service isc-dhcp-relay restart
service isc-dhcp-relay restart
```
Testing dapat dilakukan dengan start salah satu node client dan mengecek terminal<br>
![image](https://user-images.githubusercontent.com/85059763/206848494-13e90ae3-2572-4ece-94e5-65ff288e8d36.png)<br>

### Soal 1
Agar topologi yang kalian buat dapat mengakses keluar, kalian diminta untuk mengkonfigurasi Strix menggunakan iptables, tetapi Loid tidak ingin menggunakan MASQUERADE.
#### Konfigurasi network interface Strix
```
auto eth0
iface eth0 inet static
       address 192.168.122.2
       netmask 255.255.255.252
       gateway 192.168.122.1
       up echo nameserver 192.168.122.1 > /etc/resolv.conf
```
#### Konfigurasi iptables pada Strix
```
iptables -t nat -A POSTROUTING -o eth0 -j SNAT -s 10.25.0.0/21 --to-source 192.168.122.2
```
#### Konfigurasi DNS Server forwarding pada Eden
```
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
```
Testing pada seluruh node dengan `ping google.com`<br>
![image](https://user-images.githubusercontent.com/85059763/206848863-3e15fb8e-201d-4799-8d11-bf49de49ecc6.png)<br>
![image](https://user-images.githubusercontent.com/85059763/206848936-29622faf-0889-491f-8a69-2b7bfaed1e9e.png)<br>


### Soal 2
Kalian diminta untuk melakukan drop semua TCP dan UDP dari luar Topologi kalian pada server yang merupakan DHCP Server demi menjaga keamanan.
#### Setup iptables pada Strix
```
iptables -N LOGGING
iptables -A FORWARD -i eth0 -p tcp -d 10.25.0.11 -j LOGGING
iptables -A FORWARD -i eth0 -p udp -d 10.25.0.11 -j LOGGING
iptables -A LOGGING -j LOG --log-prefix "IPTables-Dropped: "
iptables -A LOGGING -j DROP
```
Testing dengan `ping google.com` dari DHCP Server (akan didrop karena dari luar topologi) dan `ping [IP DHCP Server]` dari salah satu node lain di dalam topologi (tidak akan didrop karena dari dalam topologi)<br>
![image](https://user-images.githubusercontent.com/85059763/206849015-37a77a61-a2a5-40f9-9e25-0db3078ba2ed.png)<br>
![image](https://user-images.githubusercontent.com/85059763/206849033-c702c102-49d5-47d7-9213-553b655954df.png)<br>


### Soal 3
Loid meminta kalian untuk membatasi DHCP dan DNS Server hanya boleh menerima maksimal 2 koneksi ICMP secara bersamaan menggunakan iptables, selebihnya didrop.
#### Setup iptables pada WISE & Eden
```
iptables -N LOGGING
iptables -A INPUT -p icmp -m connlimit --connlimit-above 2 --connlimit-mask 0 -j LOGGING
iptables -A LOGGING -j LOG --log-prefix "IPTables-Dropped: "
iptables -A LOGGING -j DROP
```
Testing dengan `ping [IP DHCP/DNS Server]` dari 3 node lain, node pertama dan kedua akan berhasil dan node ketiga akan didrop<br>
![image](https://user-images.githubusercontent.com/85059763/206849053-8d93c36f-ed2e-492c-979c-eaf4b310d95b.png)<br>
![image](https://user-images.githubusercontent.com/85059763/206849063-dec15da5-a3b9-4cd9-aac0-75689e3a6eb2.png)<br>
![image](https://user-images.githubusercontent.com/85059763/206849076-236d014b-39b7-443f-a0f0-834f8e13ecfb.png)<br>


### Soal 4
Akses menuju Web Server hanya diperbolehkan disaat jam kerja yaitu Senin sampai Jumat pada pukul 07.00 - 16.00.
#### Setup Web Server Apache & iptables pada SSS dan Garden
##### SSS
```
apt-get update -y &
wait
apt-get install apache2 -y &
wait
echo 'SSS' > '/var/www/html/index.html'

echo 'Listen 80
Listen 443' > '/etc/apache2/ports.conf'

service apache2 restart
service apache2 restart

iptables -A INPUT -m time --timestart 07:00 --timestop 16:00 --weekdays Mon,Tue,Wed,Thu,Fri -j ACCEPT
```
##### Garden
```
apt-get update -y &
wait
apt-get install apache2 -y &
wait
echo 'Garden' > '/var/www/html/index.html'

echo 'Listen 80
Listen 443' > '/etc/apache2/ports.conf'

service apache2 restart
service apache2 restart

iptables -A INPUT -m time --timestart 07:00 --timestop 16:00 --weekdays Mon,Tue,Wed,Thu,Fri -j ACCEPT
```
Testing dengan mengubah tanggal `date -s "DD MMM YYYY HH:MM:SS"` lalu `ping [IP Web Server]` dari salah satu node lain<br>
![image](https://user-images.githubusercontent.com/85059763/206849126-83298f5d-2df4-4546-906b-34450bf78ca8.png)


### Soal 5
Karena kita memiliki 2 Web Server, Loid ingin Ostania diatur sehingga setiap request dari client yang mengakses Garden dengan port 80 akan didistribusikan secara bergantian pada SSS dan Garden secara berurutan dan request dari client yang mengakses SSS dengan port 443 akan didistribusikan secara bergantian pada Garden dan SSS secara berurutan.
#### Setup pada Ostania (redirect)
```
iptables -A PREROUTING -t nat -p tcp -d 10.25.0.19 --dport 80 -m statistic --mode nth --every 2 --packet 0 -j DNAT --to-destination 10.25.0.19:80
iptables -A PREROUTING -t nat -p tcp -d 10.25.0.19 --dport 80 -j DNAT --to-destination 10.25.0.18:80
iptables -A PREROUTING -t nat -p tcp -d 10.25.0.18 --dport 443 -m statistic --mode nth --every 2 --packet 0 -j DNAT --to-destination 10.25.0.18:443
iptables -A PREROUTING -t nat -p tcp -d 10.25.0.18 --dport 443 -j DNAT --to-destination 10.25.0.19:443
```
Testing dengan `curl [IP Web Server]:[Port]` dari salah satu node lain<br>
![image](https://user-images.githubusercontent.com/85059763/206849178-8cc3c166-3d72-404f-a4a8-f1a599539341.png)


### Soal 6
Karena Loid ingin tau paket apa saja yang di-drop, maka di setiap node server dan router ditambahkan logging paket yang di-drop dengan standard syslog level.
#### Syslog
Jalankan `service rsyslog restart` pada seluruh node yang mengaktifkan firewall DROP (Strix, Eden, Garden, SSS, WISE), log dapat dicek pada path `/var/log/syslog`<br>
![image](https://user-images.githubusercontent.com/85059763/206849221-07ec3045-68a9-4064-b0a0-64a960ebddd7.png)

## Menjalankan Script
**Strix (script 1) -> Ostania & Westalis -> DHCP Server, DNS Server, Web Server -> Strix (script 2)<br>**
* tiap script di path /root/script.sh atau /root/script2.sh
* script 2 **Strix** berisi firewall yang mendrop transport layer ke DHCP Server


## Pembagian Tugas
| Nama                        | Nomor      |
|:---------------------------:|:----------:|
| Arya Nur Razzaq             | A-D        |
| Florentino Benedictus       | 1-6        |
| Muhammad Zufarrifqi Prakoso | VLSM       |

## Kendala
Tidak ada

## Revisi
Tidak ada
