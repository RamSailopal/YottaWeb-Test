#!/bin/bash
apt-get update
apt-get install -y apache2 gcc git make php php-dev
cd /usr/local
git clone https://github.com/chrisemunt/mg_php.git
cd mg_php
cd src
phpize
./configure
make install
echo "extension=/usr/local/mg_php/src/modules/mg_php.so" >> /etc/php/7.4/apache2/php.ini
echo "extension=/usr/local/mg_php/src/modules/mg_php.so" >> /etc/php/7.4/cli/php.ini
mkdir -p /var/www/html/api/patients
cp /home/mg_php/index.php /var/www/html/api/patients
/opt/yottadb/current/ydb <<< 'H'
cp /home/mg_php/*.m /data/r1.34_x86_64/r
/opt/yottadb/current/ydb <<< 'H'
/opt/yottadb/current/ydb <<< 'ZL "_zmgsis1.m"'
/opt/yottadb/current/ydb <<< 'ZL "_zmgsi1.m"'
/opt/yottadb/current/ydb <<< "do ylink^%zmgsi1"
/opt/yottadb/current/ydb <<< "do start^%zmgsi1(0)"

(echo "D ^%GI";echo "/home/global/patients.go";echo "") | /opt/yottadb/current/ydb
service apache2 start
tail -f /dev/null
