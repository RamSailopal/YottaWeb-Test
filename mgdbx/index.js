const url = require('url');
var dbx = require('mg-dbx').dbx;
var db = new dbx();
function getmjson() {
  var open = db.open({
           type: "YottaDB",
           host: "127.0.0.1",
           tcp_port: 7042,
         });
  let cnt=0;
  var pat="";
  var patient=db.mglobal("PATIENTS");
  pat=patient.next(pat);
  var id=pat
  var sex=patient.get(id, 'sex');
  var age=patient.get(id, 'age');
  var name=patient.get(id, 'name');
  var address=patient.get(id, 'address');
  var jsonstr='[{ "id": "' + id + '", "name": "' + name.data + '", "age: "' + age.data + '", "sex":  "' + sex.data + '", "address: "' + address.data + '" }]'
  pat=ydb.order({global: glbal, subscripts: [pat.result]});
  console.log(jsonstr);
  db.close();
  return jsonstr;
}

const express = require('express')
const app = express()
const port = 3002

app.get('/api/patients', (req, res) => {
	  const queryObject = url.parse(req.url, true).query;
	  var jsonstr=getmjson();
	  console.log(jsonstr);
	  res.send(jsonstr)
})

app.listen(port, () => {
	  console.log(`Example app listening on port ${port}`)
})
