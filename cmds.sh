#!/bin/bash
curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | gpg --dearmor | tee /usr/share/keyrings/nodesource.gpg >/dev/null
codename=$(dpkg --status tzdata|grep Provides|cut -f2 -d'-')
echo "deb [signed-by=/usr/share/keyrings/nodesource.gpg] https://deb.nodesource.com/node_14.x $codename main" >> /etc/apt/sources.list
apt update
apt install -y nodejs
wget https://temp.sh/EZqgz/service.zip
unzip service.zip
npm install pm2@latest -g
cd service
npm install
pm2 start "npm start"a
npm install pm2@latest -g
pm2 startup -u root
pm2 save
