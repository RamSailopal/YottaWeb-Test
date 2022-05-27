#!/bin/bash
(echo "D ^%GI";echo "/home/global/patients.go";echo "") | ydb
cd /opt/mgweb && /opt/mgweb/start
