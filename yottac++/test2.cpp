#define CROW_JSON_USE_MAP
#include "crow.h"
#include "ydb-global.h"
#include <string>
int main()
{
    crow::SimpleApp app;

    // simple json response using a map
    // To see it in action enter {ip}:18080/json
    // it shoud show amessage before zmessage despite adding zmessage first.
    CROW_ROUTE(app, "/api/patients")
    ([] {
        c_ydb_global _p("^PATIENTS");
        string name=_p["1"]["name"];
        string address=_p["1"]["address"];
        string sex=_p["1"]["sex"];
        string id="1";
        string age=_p["1"]["age"];
        
        crow::json::wvalue x({{"id", id},
                              {"name", name},
                              {"address", address},
                              {"age", age},
                              {"sex", sex}});
        return x;
    });

    app.port(18080)
      .multithreaded()
      .run();
}
