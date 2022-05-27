const url = require('url');
const ydb = require('nodem').Ydb();
function getmjson(glbal) {
  let cnt=0;
  var pat=ydb.order({global: glbal, subscripts: ['']});
  var id=pat.result
  var sex=ydb.get({global: glbal, subscripts: [pat.result, 'sex']});
  var age=ydb.get({global: glbal, subscripts: [pat.result, 'age']});
  var name=ydb.get({global: glbal, subscripts: [pat.result, 'name']});
  var address=ydb.get({global: glbal, subscripts: [pat.result, 'address']});
  var jsonstr='[{ "id": "' + id + '", "name": "' + name.data + '", "age: "' + age.data + '", "sex":  "' + sex.data + '", "address: "' + address.data + '" }]'
  pat=ydb.order({global: glbal, subscripts: [pat.result]});
  console.log(jsonstr);
  return jsonstr;
}

ydb.open();
const express = require('express')
const app = express()
const port = 3002

app.get('/api/patients', (req, res) => {
	  const queryObject = url.parse(req.url, true).query;
	  var jsonstr=getmjson('PATIENTS');
	  console.log(jsonstr);
	  res.send(jsonstr)
})

app.listen(port, () => {
	  console.log(`Example app listening on port ${port}`)
})
