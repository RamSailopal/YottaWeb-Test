package main

import ( "github.com/gin-gonic/gin"
         "mg_go"
)
func main() {
	r := gin.Default()
	r.GET("/api/patients", func(c *gin.Context) {
		db := mg_go.New("YottaDB")
                  db.APImodule = "/usr/local/mg_go/src/mg_dba.so"
	          db.Path = "/opt/yottadb/current"
	          db.EnvVars = db.EnvVars + "ydb_dir=/data\n"
	          db.EnvVars = db.EnvVars + "ydb_rel=r1.34_x86_64\n"
	          db.EnvVars = db.EnvVars + "ydb_gbldir=/data/r1.34_x86_64/g/yottadb.gld\n"
	          db.EnvVars = db.EnvVars + "ydb_routines=/data/r1.34_x86_64/o*(/data/r1.34_x86_64/r /data/r)\n"
	          db.EnvVars = db.EnvVars + "\n"
		db.Open()
		patients := db.Global("PATIENTS")
		pat := ""
		id := ""
		sex := ""
		address:= ""
                name := ""
		age := ""
		for r := patients.Next(pat); r.OK; r = patients.Next(pat) {
        	      pat = r.Data.(string)
		      id = pat
		      sex = patients.Get(pat,"sex").Data.(string)
		      address = patients.Get(pat,"address").Data.(string)
		      name = patients.Get(pat,"name").Data.(string)
		      age = patients.Get(pat,"age").Data.(string)
		}
	        c.JSON(200, gin.H{
	          "id": id,
	          "name": name,
                  "age": age,
                  "sex": sex,
                  "address": address,
	        })
	})
	r.Run() // listen and serve on 0.0.0.0:8080 (for windows "localhost:8080")
}
