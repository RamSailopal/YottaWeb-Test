patients(req);
 new res,pat
 S pat=""
 S cnt=0
 F  S pat=$O(^PATIENTS(pat)) Q:pat=""  D
 . set cnt=cnt+1
 . set res(cnt,"id")=pat
 . set res(cnt,"name")=^PATIENTS(pat,"name")
 . set res(cnt,"age")=^PATIENTS(pat,"age")
 . set res(cnt,"sex")=^PATIENTS(pat,"sex")
 . set res(cnt,"address")=^PATIENTS(pat,"address")
 QUIT $$response^%zmgweb(.res)
