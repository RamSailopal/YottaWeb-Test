#!/bin/bash
apt-get update
apt-get install -y apache2 gcc g++ cmake make libboost1.71 git libasio-dev
source $(pkg-config --variable=prefix yottadb)/ydb_env_set
/opt/yottadb/current/ydb <<< 'H'
(echo "D ^%GI";echo "/home/global/patients.go";echo "") | /opt/yottadb/current/ydb
cp -f /home/yottac++/000-default.conf /etc/apache2/sites-available
a2enmod proxy && a2enmod proxy_http
service apache2 start
cd /usr/local
git clone https://github.com/CrowCpp/Crow.git
cd Crow
mkdir build
cd build
cmake .. -DCROW_BUILD_EXAMPLES=OFF -DCROW_BUILD_TESTS=OFF
make install
cd /usr/local
git clone https://github.com/informatik-aalen/CPP-Access-for-YottaDB.git
cp /home/yottac++/test1.cpp CPP-Access-for-YottaDB/examples
cp /home/yottac++/test2.cpp CPP-Access-for-YottaDB/examples
cp /home/yottac++/Makefile CPP-Access-for-YottaDB/examples
cp -R /usr/local/Crow/include/* /usr/local/CPP-Access-for-YottaDB/src
cd CPP-Access-for-YottaDB/examples
mkdir bin
make
make install
export LD_LIBRARY_PATH=/opt/yottadb/current
cd bin
source $(pkg-config --variable=prefix yottadb)/ydb_env_set
./test2
