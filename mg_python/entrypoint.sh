#!/bin/bash
apt-get update
apt-get install -y python3 python3-pip python3-dev git gcc make apache2
cd /usr/local && git clone https://github.com/chrisemunt/mg_python.git
cd /usr/local/mg_python/src && python3 setup.py install
python3 -m pip install flask
python3 -m pip install flask_cors
python3 -m pip install Flask-Compress
/opt/yottadb/current/ydb <<< 'H'
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
cd /home/entrypoint
export FLASK_APP="yottaapp"
export FLASK_ENV="development"
export LC_ALL=en_US.utf-8
export LANG=en_US.utf-8
flask run --host=0.0.0.0
