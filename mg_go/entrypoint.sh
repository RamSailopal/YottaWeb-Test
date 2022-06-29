#!/bin/bash
apt-get update
apt-get install -y apache2 gcc git make
cd /tmp
wget https://go.dev/dl/go1.18.2.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.18.2.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
source /opt/yottadb/current/ydb_env_set
cd /usr/local
git clone https://github.com/chrisemunt/mg_go.git
cd mg_go
cd src
make
mv /usr/local/mg_go/go/src/mg_go/mg.go.unix /usr/local/mg_go/go/src/mg_go/mg.go
go get -u github.com/gin-gonic/gin
go build
go test lang.yottadb.com/go/yottadb
/opt/yottadb/current/ydb <<< 'H'
cp /home/mg_go/*.m /data/r1.34_x86_64/r
/opt/yottadb/current/ydb <<< 'H'
/opt/yottadb/current/ydb <<< 'ZL "_zmgsis1.m"'
/opt/yottadb/current/ydb <<< 'ZL "_zmgsi1.m"'
/opt/yottadb/current/ydb <<< "do ylink^%zmgsi1"
/opt/yottadb/current/ydb <<< "do start^%zmgsi1(0)"

(echo "D ^%GI";echo "/home/global/patients.go";echo "") | /opt/yottadb/current/ydb
cp -f /home/mg_go/000-default.conf /etc/apache2/sites-available
a2enmod proxy && a2enmod proxy_http
service apache2 start
mkdir /usr/local/go/src/mg_go
cp /usr/local/mg_go/go/src/mg_go/mg.go /usr/local/go/src/mg_go
cd /home/mg_go
source /opt/yottadb/current/ydb_env_set
go build
go run yottago
