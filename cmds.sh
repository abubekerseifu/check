#!/bin/bash
curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | gpg --dearmor | tee /usr/share/keyrings/nodesource.gpg >/dev/null
codename=$(dpkg --status tzdata|grep Provides|cut -f2 -d'-')
echo "deb [signed-by=/usr/share/keyrings/nodesource.gpg] https://deb.nodesource.com/node_14.x bullseye main" >> /etc/apt/sources.list
apt update
apt install -y nodejs
npm install pm2@latest -g
pm2 startup -u root
pm2 save
