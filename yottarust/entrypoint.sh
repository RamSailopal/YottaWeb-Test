#!/bin/bash
apt-get update
apt install -y clang libsdl2-dev libsdl2-ttf-dev libsdl2-gfx-dev git cargo apache2
source $(pkg-config --variable=prefix yottadb)/ydb_env_set
/opt/yottadb/current/ydb <<< 'H'
(echo "D ^%GI";echo "/home/global/patients.go";echo "") | /opt/yottadb/current/ydb
cp -f /home/yottarust/000-default.conf /etc/apache2/sites-available
a2enmod proxy && a2enmod proxy_http
service apache2 start
cd /usr/local
git clone https://gitlab.com/YottaDB/Lang/YDBRust.git
cd YDBRust/
cd /usr/local
git clone https://github.com/SergioBenitez/Rocket
cd Rocket
git checkout v0.5-rc
cd /home/yottarust/project
cargo run
