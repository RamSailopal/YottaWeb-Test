#!/bin/bash
/opt/yottadb/current/ydb << EOF
D ^%GI
/home/global/patients.go
Yes
EOF
apt-get update
apt-get install -y curl npm apache2
curl -sL https://deb.nodesource.com/setup_14.x | bash -
apt-get install -y nodejs 
cp -f /home/entrypoint/000-default.conf /etc/apache2/sites-available
a2enmod proxy && a2enmod proxy_http
service apache2 start
source /opt/yottadb/current/ydb_env_set
source /home/app/node_modules/nodem/resources/environ
export ydb_routines="/data/r1.34_x86_64/r(/home/app/node_modules/nodem/src /data/r1.34_x86_64/r /data/r) /opt/yottadb/current/utf8/libyottadbutil.so"
export gtmroutines="/data/r1.34_x86_64/r(/home/app/node_modules/nodem/src /data/r1.34_x86_64/r /data/r) /opt/yottadb/current/utf8/libyottadbutil.so"
mkdir /home/yotta-back
cd /home/yotta-back
npm install nodem
npm install express
cp /home/entrypoint/index.js index.js
source /opt/yottadb/current/ydb_env_set
node index.js
