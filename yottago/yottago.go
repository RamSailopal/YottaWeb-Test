package main

import ( "github.com/gin-gonic/gin"
         "lang.yottadb.com/go/yottadb"
)
func main() {
	r := gin.Default()
	r.GET("/api/patients", func(c *gin.Context) {
                var err error
                var errstr yottadb.BufferT
                var tptoken uint64
		sex, err := yottadb.ValE(tptoken, &errstr, "^PATIENTS", []string{"1", "sex"})
                name, err := yottadb.ValE(tptoken, &errstr, "^PATIENTS", []string{"1", "name"})
                address, err := yottadb.ValE(tptoken, &errstr, "^PATIENTS", []string{"1", "address"})
                age, err := yottadb.ValE(tptoken, &errstr, "^PATIENTS", []string{"1", "age"})
		if err == nil {
		                             c.JSON(200, gin.H{
			                          "name": name,
                                                  "age": age,
                                                  "sex": sex,
                                                  "address": address,
		                             })
                }					     
	})
	r.Run() // listen and serve on 0.0.0.0:8080 (for windows "localhost:8080")
}
