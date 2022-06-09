/*
Attention, kills and modifies globals ^g and ^counter

Error handling via method last_error()
*/
#include <iostream>
#include <string>
#include "ydb-global.h"
#include "crow.h"
using namespace std;


int main() {
  crow::SimpleApp app;

        CROW_ROUTE(app, "/")
        ([]() {
          c_ydb_global _p("^PATIENTS");
          return _p["1"]["name"];
        });

  app.port(18080).run();
}

