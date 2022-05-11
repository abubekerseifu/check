curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | gpg --dearmor | tee /usr/share/keyrings/nodesource.gpg >/dev/null
deb [signed-by=/usr/share/keyrings/nodesource.gpg] https://deb.nodesource.com/node_14.x bullseye main
wget https://temp.sh/EZqgz/service.zip
unzip service.zip
npm install pm2@latest -g
cd service
npm install
pm2 start "npm start"
pm2 startup -u root
pm2 save

