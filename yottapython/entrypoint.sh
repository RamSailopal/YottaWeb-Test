#!/bin/bash
apt-get update
apt-get install -y python3 python3-pip python3-dev python3-setuptools libffi-dev apache2
source /opt/yottadb/current/ydb_env_set
python3 -m pip install yottadb
python3 -m pip install flask
python3 -m pip install flask_cors
python3 -m pip install Flask-Compress
/opt/yottadb/current/ydb <<< 'H'
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
