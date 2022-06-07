SET;
    S ^%web(17.6001,8,0)="GET"
    S ^%web(17.6001,8,1)="api/patients"
    S ^%web(17.6001,8,2)="PATIENTS^patientapi"
    S ^%web(17.6001,"B","GET","api/patients","PATIENTS^patientapi",8)=""
    q
PATIENTS(result,args);
    s %fcgi("o","header","Content-Type")="text/plain"
    S PAT=""
    F  S PAT=$O(^PATIENTS(PAT)) Q:PAT=""  D
    .S ID=PAT
    .S NAME=^PATIENTS(ID,"name")
    .S SEX=^PATIENTS(ID,"sex")
    .S ADD=^PATIENTS(ID,"address")
    .S AGE=^PATIENTS(ID,"age")
    .S result("mime")="text/plain; charset=utf-8"
    .S result="[ { ""id"": """_ID_""", ""name"": """_NAME_""", ""address"": """_ADD_""", ""sex"": """_SEX_""", ""age"": """_AGE_""" } ]"
    q

