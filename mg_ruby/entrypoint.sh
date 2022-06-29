#!/bin/bash
apt-get update
apt-get install -y apache2 gcc git make ruby ruby-dev 
cd /usr/local
git clone https://github.com/chrisemunt/mg_ruby.git
cd mg_ruby
cd src
ruby extconf.rb
make
make install
cp /usr/local/mg_ruby/src/mg_ruby.so /usr/lib/x86_64-linux-gnu/ruby/2.7.0
/opt/yottadb/current/ydb <<< 'H'
cp /home/mg_ruby/*.m /data/r1.34_x86_64/r
/opt/yottadb/current/ydb <<< 'H'
/opt/yottadb/current/ydb <<< 'ZL "_zmgsis1.m"'
/opt/yottadb/current/ydb <<< 'ZL "_zmgsi1.m"'
/opt/yottadb/current/ydb <<< "do ylink^%zmgsi1"
/opt/yottadb/current/ydb <<< "do start^%zmgsi1(0)"
(echo "D ^%GI";echo "/home/global/patients.go";echo "") | /opt/yottadb/current/ydb
cp -f /home/mg_ruby/000-default.conf /etc/apache2/sites-available
a2enmod proxy && a2enmod proxy_http
service apache2 start
cd /home/mg_ruby
gem install ramaze
ruby index.rb
