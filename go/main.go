package main

import (
	"fmt"
	"os"
	"io/ioutil"
	"net/http"
	"math/rand"
	"strings"
	"strconv"
	"log"
)

type Page struct {
	Title string
	Body []byte
}

func fibonacci(x int) int {
	if x==0 {
		return 0;
	}

	if x == 1 {
		return 1;
	}

	return fibonacci(x-1) + fibonacci(x-2);
}

func test1() int{
	return fibonacci(20);
}

func test2() int{
	var r int = GetRandom(0,1000);
	if _, err := os.Stat("./tmp/tmp" + strconv.Itoa(r)); os.IsNotExist(err){
		var f int = fibonacci(20);
		err = ioutil.WriteFile("./tmp/tmp" + strconv.Itoa(r), []byte(strings.Repeat(strconv.Itoa(f), 200000)), 0777);
		if err != nil{
			log.Fatal(err);
		}
	}else
	{
		var data, err = ioutil.ReadFile("./tmp/tmp" + strconv.Itoa(r))
		if data == nil {}
		if err != nil {
			log.Fatal(err)
		}
	}

	return fibonacci(20);
}

func GetRandom(min int, max int) int{
	return rand.Intn(max - min) + min;
}

func initTest2(){
	os.Remove("./tmp")
	os.Mkdir("./tmp", 0700)
}

func handler(w http.ResponseWriter, r *http.Request){
//	fmt.Fprintf(w, "Hi there, I love %s!", r.URL.Path[1:])
	if strings.Compare(r.URL.Path[1:], "1") == 0 {
		fmt.Fprintf(w, "%d", test1())
	} else
	{
		fmt.Fprintf(w, "%d", test2())
	}
}

func main(){
	initTest2()
	http.HandleFunc("/", handler)
	http.ListenAndServe(":8081", nil)
}
