# YottaWeb-Test

A test of different web frameworks with different YottaDB connectors

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/RamSailopal/YottaWeb-Test)

Single containers are provisioned for each stack with the YottaDB layer, web proxy layer and application/YottaDB connector layer all enclosed.

The different stacks extract the same data from their embedded YottaDB databases:

    ^PATIENTS(1,"address")="234,Timbucktwo Road, Fantasy City"
    ^PATIENTS(1,"age")=52
    ^PATIENTS(1,"name")="Bob Taylor"
    ^PATIENTS(1,"sex")="Male"
    
    
 This data is then exposed as a REST API, JSON based endpoint:
 
    [{ "id": "1", "name": "Bob Taylor", "age: "52", "sex": "Male", "address: "234,Timbucktwo Road, Fantasy City" }]



# Python Stacks

**Stack 1 - yottapython**

Flask - https://flask.palletsprojects.com/en/2.1.x/

Apache - https://httpd.apache.org/

YottaDB-Python - https://docs.yottadb.com/MultiLangProgGuide/pythonprogram.html

**Stack  2 - yottamg_python**

Flask

Apache

mg_python - https://github.com/chrisemunt/mg_python


# Node Stacks

**Stack 1 - nodem**

Express - https://expressjs.com/

Apache

nodem - https://www.npmjs.com/package/nodem

**Stack 2 - mgdbx**

Express

Apache

mgdbx - https://github.com/chrisemunt/mg-dbx


# Native M Stack 

**Stack 1 - yottamgweb**

mgweb-server - https://github.com/robtweed/mgweb-server

**Stack 2 - yottaweb**

Apache

M-Web-Server - https://github.com/shabiel/M-Web-Server

# Go Stacks 

**Stack 1 - yottago**

Gin - https://github.com/gin-gonic/gin

Apache

YottaDB-Go - https://docs.yottadb.com/MultiLangProgGuide/goprogram.html

**Stack 2 - mg_go**

Gin - https://github.com/gin-gonic/gin

Apache

MG_Go - https://github.com/chrisemunt/mg_go 

# C++ Stack - yottac

Crow - https://github.com/CrowCpp/Crow

Apache

CPP Access for YottaDB - https://github.com/informatik-aalen/CPP-Access-for-YottaDB

# Rust Stack - yottarust

Rocket - https://rocket.rs/

Apache

YottaDB-Rust - https://yottadb.gitlab.io/Lang/YDBRust/yottadb/

# Lua Stack - yottalua

Pegasus - https://github.com/EvandroLG/pegasus.lua

Apache

YottaDB-Lua - https://docs.yottadb.com/MultiLangProgGuide/luaprogram.html

# API endpoints

To view the endpoints:

https://gitpod-address:8080/api/patients - **yottamgweb**

https://gitpod-address:5001/api/patients - **yottamg_python**
    
https://gitpod-address:3002/api/patients - **nodem**
    
https://gitpod-address:3003/api/patients - **mgdbx**
    
https://gitpod-address:5000/api/patients - **yottapython**
    
https://gitpod-address:8081/api/patients - **yottago**

https://gitpod-address:8082/api/patients - **yottaweb**

https://gitpod-address:8083/api/patients - **yottac**

https://gitpod-address:8084/api/patients - **yottarust**

https://gitpod-address:8085/api/patients - **yottalua**

https://gitpod-address:8086/api/patients - **mg_go**

# Running Tests

![Alt text](locust.JPG?raw=true "Locust")

Each stack is tested using Locust - https://docs.locust.io/en/stable/what-is-locust.html

To run test navigate to:

https://gitpod-address:8089 - **yottamgweb**
    
https://gitpod-address:8090 - **yottamg_python**
    
https://gitpod-address:8091 - **nodem**
    
https://gitpod-address:8092 - **mgdbx**
    
https://gitpod-address:8093 - **yottapython**
    
https://gitpod-address:8094 - **yottago**

https://gitpod-address:8095 - **yottaweb**

https://gitpod-address:8096 - **yottac**

https://gitpod-address:8097 - **yottarust**

https://gitpod-address:8098 - **yottalua**

https://gitpod-address:8099 - **mg_go**

# Actual Test runs

1000 users were tested against each stack. The number of requests were allowed to reach approxamately 100000 requests.

The results for each stack can be found here:

**yottamgweb** - https://htmlpreview.github.io/?https://github.com/RamSailopal/YottaWeb-Test/blob/main/locust_reports/yottamgweb.html

**yottamg_python** - https://htmlpreview.github.io/?https://github.com/RamSailopal/YottaWeb-Test/blob/main/locust_reports/yottamg_python.html

**nodem** - https://htmlpreview.github.io/?https://github.com/RamSailopal/YottaWeb-Test/blob/main/locust_reports/nodem.html

**mgdbx** - https://htmlpreview.github.io/?https://github.com/RamSailopal/YottaWeb-Test/blob/main/locust_reports/mgdbx.html

**yottapython** - https://htmlpreview.github.io/?https://github.com/RamSailopal/YottaWeb-Test/blob/main/locust_reports/yottapython.html

**yottago** - https://htmlpreview.github.io/?https://github.com/RamSailopal/YottaWeb-Test/blob/main/locust_reports/yottago.html

**yottaweb** - https://htmlpreview.github.io/?https://github.com/RamSailopal/YottaWeb-Test/blob/main/locust_reports/yottaweb.html

**yottac** - https://htmlpreview.github.io/?https://github.com/RamSailopal/YottaWeb-Test/blob/main/locust_reports/yottac.html

**yottarust** - https://htmlpreview.github.io/?https://github.com/RamSailopal/YottaWeb-Test/blob/main/locust_reports/yottarust.html

**yottalua** - https://htmlpreview.github.io/?https://github.com/RamSailopal/YottaWeb-Test/blob/main/locust_reports/yottalua.html

# Overall Comparison of performance

https://htmlpreview.github.io/?https://github.com/RamSailopal/YottaWeb-Test/blob/main/locust_reports/overallstats.html

# Further Details

The application code relating to each framwork is within each framework directory i.e.

https://github.com/RamSailopal/YottaWeb-Test/blob/main/yottaweb/patientapi.m

The provisioning detail can also be attained from the **entrypoint.sh** script within each respective framework directory i.e.

https://github.com/RamSailopal/YottaWeb-Test/blob/main/yottaweb/entrypoint.sh

