#!/bin/bash
/opt/yottadb/current/ydb << EOF
D ^%GI
/home/global/patients.go
Yes
EOF
apt-get update
apt-get install -y curl gcc make npm apache2
curl -sL https://deb.nodesource.com/setup_16.x | bash -
apt-get install -y nodejs 
cp /home/entrypoint/*.m /data/r1.34_x86_64/r
/opt/yottadb/current/ydb <<< 'H'
/opt/yottadb/current/ydb <<< 'ZL "_zmgsis1.m"'
/opt/yottadb/current/ydb <<< 'ZL "_zmgsi1.m"'
/opt/yottadb/current/ydb <<< "do ylink^%zmgsi1"
/opt/yottadb/current/ydb <<< "do start^%zmgsi1(0)"
(echo "D ^%GI";echo "/home/global/patients.go";echo "") | /opt/yottadb/current/ydb
cp -f /home/entrypoint/000-default.conf /etc/apache2/sites-available
a2enmod proxy && a2enmod proxy_http
service apache2 start
mkdir /home/yotta-back
cd /home/yotta-back
/usr/lib/node_modules/corepack/shims/yarn add mg-dbx
npm install express
cp /home/entrypoint/index.js index.js
source /opt/yottadb/current/ydb_env_set
node index.js
