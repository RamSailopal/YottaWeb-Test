import yottadb
from flask import Flask, request, jsonify
from flask_cors import CORS
from flask_compress import Compress

compress = Compress()
app = Flask(__name__)
CORS(app, resources={r"*": {"origins": "*"}})
compress.init_app(app)

@app.route('/api/patients')
def get_patients():  
   result = []   
   patient_data = {}
   patient_data["id"] = "1"
   key=yottadb.Key("^PATIENTS")["1"]["age"]
   patient_data["age"] = key.get().decode()
   key=yottadb.Key("^PATIENTS")["1"]["sex"]
   patient_data["sex"] = key.get().decode()
   key=yottadb.Key("^PATIENTS")["1"]["name"]
   patient_data["name"] = key.get().decode()
   key=yottadb.Key("^PATIENTS")["1"]["address"]
   patient_data["address"] = key.get().decode()
   result.append(patient_data)
   return str(result).replace("'",'"')
