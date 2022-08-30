# YottaWeb-Test

A test of different web frameworks with different YottaDB connectors.

This is a fork of [YottaWeb-Test](https://github.com/RamSailopal/YottaWeb-Test) with a few changes:

1. You can still [open it in Gitpod](https://gitpod.io/#https://github.com/berwynhoyt/MLuaWeb-Test) as per the original project, but that is no longer my recommendation because gitpod loading varies producing inconsistent results. Better to run it with docker on your local machine. See Quickstart below.
2. At the time of writing the results published the the original project were incorrect. They did not compare apples with apples. The tests for some languages started with 1000 users immediately for other languages only increased the number of users gradually to about 100. This has been fixed to have 1000 users consistently for all languages. It make a big difference to the results.



Single docker containers are provisioned for each stack with the YottaDB layer, web proxy layer and application/YottaDB connector layer all enclosed.

The different stacks extract the same data from their embedded YottaDB databases:

    ^PATIENTS(1,"address")="234,Timbucktwo Road, Fantasy City"
    ^PATIENTS(1,"age")=52
    ^PATIENTS(1,"name")="Bob Taylor"
    ^PATIENTS(1,"sex")="Male"


 This data is then exposed as a REST API, JSON based endpoint:

    [{ "id": "1", "name": "Bob Taylor", "age: "52", "sex": "Male", "address: "234,Timbucktwo Road, Fantasy City" }]

# Quickstart

You need the latest docker (I have 20.10.17) installed so that it runs without sudo. Then:

```shell
git clone https://github.com/berwynhoyt/YottaWeb-Test.git
cd YottaWeb-Test
docker rm $(docker ps -a -f status=exited -q)
docker compose down  # remove any containers this project previously started
docker compose up
# now wait for it to build and run all the docker images
```

Finally, run the tests in a new terminal:

```shell
./runlocal
```

This should generate your new test results in the locust_reports folder. You can see [my results here](https://htmlpreview.github.io/?https://github.com/berwynhoyt/YottaWeb-Test/blob/main/locust_reports/overallstats.html). 1000 users were tested against each stack. The automation script ./runlocal.sh runs each stack for 30 seconds (you can alter it there). 

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

# Go Stack - yottago

Gin - https://github.com/gin-gonic/gin

Apache

YottaDB-Go - https://docs.yottadb.com/MultiLangProgGuide/goprogram.html


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

# PHP Stack - mgphp

Apache/mod_php

mg_php - https://github.com/chrisemunt/mg_php

# Ruby Stack - mgruby

Ramaze - http://ramaze.net/

Apache

mg_ruby - https://github.com/chrisemunt/mg_ruby


# API endpoints

To view the endpoints:

https://8080-gitpod-address/api/patients - **yottamgweb**

https://5001-gitpod-address/api/patients - **yottamg_python**
    
https://3002-gitpod-address/api/patients - **nodem**
    
https://3003-gitpod-address/api/patients - **mgdbx**
    
https://5000-gitpod-address/api/patients - **yottapython**
    
https://8081-gitpod-address/api/patients - **yottago**

https://8082-gitpod-address/api/patients - **yottaweb**

https://8083-gitpod-address/api/patients - **yottac**

https://8084-gitpod-address/api/patients - **yottarust**

https://8085-gitpod-address/api/patients - **yottalua**

https://8086-gitpod-address/api/patients - **mgphp**

https://8087-gitpod-address/api/patients - **mgruby**


# Running Tests

![Alt text](locust.JPG?raw=true "Locust")

Each stack is tested using Locust - https://docs.locust.io/en/stable/what-is-locust.html

To run test navigate to:

https://8089-gitpod-address - **yottamgweb**
    
https://8090-gitpod-address - **yottamg_python**
    
https://8091-gitpod-address - **nodem**
    
https://8092-gitpod-address - **mgdbx**
    
https://8093-gitpod-address - **yottapython**
    
https://8094-gitpod-address - **yottago**

https://8095-gitpod-address - **yottaweb**

https://8096-gitpod-address - **yottac**

https://8097-gitpod-address - **yottarust**

https://8098-gitpod-address - **yottalua**

https://8099-gitpod-address - **mgphp**

https://8100-gitpod-address - **mgruby**

# Results

Here are the [test results for each stack](https://htmlpreview.github.io/?https://github.com/berwynhoyt/YottaWeb-Test/blob/main/locust_reports/overallstats.html).

# Further Details

The application code relating to each framwork is within each framework directory i.e.

https://github.com/RamSailopal/YottaWeb-Test/blob/main/yottaweb/patientapi.m

The provisioning detail can also be attained from the **entrypoint.sh** script within each respective framework directory i.e.

https://github.com/RamSailopal/YottaWeb-Test/blob/main/yottaweb/entrypoint.sh

