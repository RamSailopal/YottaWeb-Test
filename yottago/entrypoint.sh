#!/bin/bash
apt-get update
apt-get install -y apache2 gcc git
cd /tmp
wget https://go.dev/dl/go1.18.2.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.18.2.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
source /opt/yottadb/current/ydb_env_set
cd /home/yottago
go get lang.yottadb.com/go/yottadb
source $(pkg-config --variable=prefix yottadb)/ydb_env_set
go get -t lang.yottadb.com/go/yottadb
go get -u github.com/gin-gonic/gin
go build
go test lang.yottadb.com/go/yottadb
/opt/yottadb/current/ydb <<< 'H'
(echo "D ^%GI";echo "/home/global/patients.go";echo "") | /opt/yottadb/current/ydb
cp -f /home/yottago/000-default.conf /etc/apache2/sites-available
a2enmod proxy && a2enmod proxy_http
service apache2 start
cd /home/yottago
go build
go run yottago
