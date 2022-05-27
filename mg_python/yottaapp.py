import mg_python
from flask import Flask, request, jsonify
from flask_cors import CORS
from flask_compress import Compress

compress = Compress()
app = Flask(__name__)
CORS(app, resources={r"*": {"origins": "*"}})
compress.init_app(app)
mg_python.m_set_host(0, 'localhost', 7042, "", "")

@app.route('/api/patients')
def get_patients():  
   result = []   
   pat = mg_python.m_order(0, "^PATIENTS", "")
   while (pat != ""):
       patient_data = {}
       patient_data["id"] = pat
       patient_data["age"] = mg_python.m_get(0, "^PATIENTS", pat, "age")
       patient_data["sex"] = mg_python.m_get(0, "^PATIENTS", pat, "sex")
       patient_data["name"] = mg_python.m_get(0, "^PATIENTS", pat, "name")
       patient_data["address"] = mg_python.m_get(0, "^PATIENTS", pat, "address")
       result.append(patient_data)
       pat = mg_python.m_order(0, "^PATIENTS", pat)
   return str(result).replace("'",'"')
