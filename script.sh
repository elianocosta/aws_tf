#/bin/bash
sudo echo "nameserver 8.8.8.8" >> /etc/resolv.conf
sudo apt update && apt-get install -y nginx 