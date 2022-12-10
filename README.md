# Jarkom-Modul-5-E07-2022


| Nama                        | NRP        |
|:---------------------------:|:----------:|
| Arya Nur Razzaq             | 5025201102 |
| Florentino Benedictus       | 5025201222 |
| Muhammad Zufarrifqi Prakoso | 5025201276 |

[Link Miro Kelompok](https://miro.com/app/board/uXjVP8hn0Es=/?share_link_id=641116066491)

## Soal Modul 5
- [Soal](https://docs.google.com/document/d/1b-tRRx2BLu1RxCgXxnoI2lYJbG9E0C08adRppePfHxk/edit)

### Konfigurasi GNS3
<img width="772" alt="Screen Shot 2022-12-10 at 10 22 44" src="https://user-images.githubusercontent.com/103361498/206827017-cd85f7a0-d566-4a6c-bcc7-e01b707ec5b6.png">
<img width="552" alt="Screen Shot 2022-12-10 at 10 30 33" src="https://user-images.githubusercontent.com/103361498/206827073-05d5d5ef-c573-48cf-926a-da84dabc98cd.png">

### SETTING INTERFACE
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
