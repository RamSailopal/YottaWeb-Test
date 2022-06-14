#[macro_use] extern crate rocket;
use yottadb::{Context, KeyContext as Key, YDBError};
use std::str;

#[get("/api/patients")]
fn patient() -> String {
        let ctx = Context::new();
            let id = "1";
            format!("{}{}\"id\":{:?}","[","{",id);
            let name = Key::new(&ctx, "^PATIENTS", &["1","name"]);
            let name1 = match name.get() {
              Ok(description) => {
                 let s = String::from_utf8(description).expect("Found invalid UTF-8");
                 s
              },
              Err(err) => format!("Error: {}", err),
            };
            let age = Key::new(&ctx, "^PATIENTS", &["1","age"]);
            let age1 = match age.get() {
              Ok(description) => {
                 let s = String::from_utf8(description).expect("Found invalid UTF-8");
                 s
              },
              Err(err) => format!("Error: {}", err),
            };
            let address = Key::new(&ctx, "^PATIENTS", &["1","address"]);
            let address1 = match address.get() {
              Ok(description) => {
                 let s = String::from_utf8(description).expect("Found invalid UTF-8");
                 s
              },
              Err(err) => format!("Error: {}", err),
            };
            let sex = Key::new(&ctx, "^PATIENTS", &["1","sex"]);
            let sex1 = match sex.get() {
              Ok(description) => {
                 let s = String::from_utf8(description).expect("Found invalid UTF-8");
                 s
              },
              Err(err) => format!("Error: {}", err),
            };
            format!("{}{}\"id\":\"{}\",\"name\":\"{}\",\"address\":\"{}\",\"age\":\"{}\",\"sex\":\"{}\"{}{}","[","{",id,name1,address1,age1,sex1,"}","]")

}
#[launch]
fn rocket() -> _ {
    rocket::build().mount("/", routes![patient])
}
