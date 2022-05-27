#!/bin/bash
apt-get update
apt-get install -y apache2 gcc g++ cmake make libjsoncpp-dev uuid-dev openssl libssl-dev zlib1g-dev git
cd /usr/local
git clone https://github.com/an-tao/drogon.git
git clone https://github.com/informatik-aalen/CPP-Access-for-YottaDB.git
cd CPP-Access-for-YottaDB/examples
mkdir bin
make
make install
export LD_LIBRARY_PATH=/opt/yottadb/current
cd bin
./test1
cd /usr/local/drogon
git submodule update --init
mkdir build
cd build
#cmake ..
#make
#make install
source $(pkg-config --variable=prefix yottadb)/ydb_env_set
/opt/yottadb/current/ydb <<< 'H'
(echo "D ^%GI";echo "/home/global/patients.go";echo "") | /opt/yottadb/current/ydb
cp -f /home/yottac++/000-default.conf /etc/apache2/sites-available
a2enmod proxy && a2enmod proxy_http
service apache2 start
tail -f /dev/null
