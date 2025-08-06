<p align="center">
<img src="https://readme-typing-svg.herokuapp.com?color=%2336BCF7&center=true&vCenter=true&lines=A+L+R+E+L+S+H+O+P++A+U+T+O+S+C+R+I+P+T++V+4.0" />
</p>

## UPGRADE FOR DEBIAN  
Masukkan perintah dibawah jika anda menggunakan OS Debian Version 9, 10, 11, atau 12
```
apt update -y && apt upgrade -y && apt dist-upgrade -y && reboot
```

##  UPGRADE FOR UBUNTU
Masukkan perintah dibawah jika anda menggunakan OS Ubuntu Version 18, 20, 22, 24, atau 25
```
apt update && apt upgrade -y && update-grub && sleep 2 && reboot
```


## INSTALL SCRIPT v4.0 !!!!!
Masukkan perintah dibawah untuk instalasi AutoScript v4.0:
```
apt install -y wget && apt update -y && apt upgrade -y && wget -q https://raw.githubusercontent.com/alrel1408/NewAutoScript/main/install.sh && chmod +x install.sh && ./install.sh
```
## UPDATE SCRIPT
Masukkan perintah dibawah jika terdapat informasi pembaruan Script untuk versi yang akan datang
```
wget -q https://raw.githubusercontent.com/alrel1408/NewAutoScript/main/update.sh && chmod +x update.sh && ./update.sh
```
## FIX BUG ATASI HAPROXY EROR
Masukkan perintah dibawah jika terdapat eror pada satus haproxy
```
cat /etc/xray/xray.key /etc/xray/xray.crt > /etc/haproxy/hap.pem
```
Setelah sertifikat dan kunci ssl berhasil dipindahkan, restart haproxynya
```
sudo systemctl restart haproxy
```
Kembali ke menu utama dan cek apakah haproxy sudah berjalan dengan normal

## TESTED ON OS
- UBUNTU Version 18, 20, 22, 24, 25 (Recommended)
- DEBIAN Version 9, 10, 11, 12

## FITUR TAMBAHAN v4.0
- Pemasangan yang Dinamis & Otomatis
- Multi OS Support (Ubuntu 18-25, Debian 9-12)
- User Details Akun
- Auto Delete Expired
- Auto Reboot VPS Server
- Backup And Restore
- Bot Telegram Access
- Autokill SSH
- Lock Unlock SSH
- Setting Limit SSH
- Bandwidth Information
- Auto Menu Entry (Tanpa Input Manual)
- Modern UI Display
- Enhanced Security Features

## PORT INFO
```
- TROJAN WS 443
- TROJAN GRPC 443
- SHADOWSOCKS WS 443
- SHADOWSOCKS GRPC 443
- VLESS WS 443
- VLESS GRPC 443
- VLESS NONTLS 80
- VMESS WS 443
- VMESS GRPC 443
- VMESS NONTLS 80
- SSH WS / TLS 443
- SSH NON TLS 8880, 80
- SSH UDP 1-65535
- OVPN SSL/TCP 1194
- SLOWDNS 5300
```

## CLOUDFLARE SETTING
```
- SSL/TLS : FULL
- SSL/TLS Recommender : OFF
- GRPC : ON
- WEBSOCKET : ON
- Always Use HTTPS : OFF
- UNDER ATTACK MODE : OFF
