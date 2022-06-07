#!/bin/bash
apt-get update
apt-get install -y apache2
source /opt/yottadb/current/ydb_env_set
/opt/yottadb/current/ydb <<< 'H'
(echo "D ^%GI";echo "/home/global/patients.go";echo "") | /opt/yottadb/current/ydb
cd /tmp
wget https://github.com/shabiel/M-Web-Server/releases/download/1.1.2/webinit.rsa --no-check-certificate
wget https://github.com/shabiel/M-Web-Server/releases/download/1.1.2/mws.rsa --no-check-certificate
(echo "D ^%RI";echo "";echo "/tmp/webinit.rsa";echo "") | /opt/yottadb/current/ydb
cp /tmp/webinit.m /data/r1.34_x86_64/r
/opt/yottadb/current/ydb <<< 'ZL "webinit"'
(echo "D ^webinit";echo "";echo "8080") | /opt/yottadb/current/ydb
cp /home/entrypoint/*.m /data/r1.34_x86_64/r
/opt/yottadb/current/ydb <<< 'ZL "patientapi.m"'
/opt/yottadb/current/ydb <<< 'D SET^patientapi'
cp -f /home/entrypoint/000-default.conf /etc/apache2/sites-available
a2enmod proxy && a2enmod proxy_http
service apache2 start
tail -f /dev/null
