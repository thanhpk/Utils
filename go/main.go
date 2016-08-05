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
	//"time"
	"github.com/davecheney/profile"
)

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
//	time.Sleep(500 * time.Millisecond)
	return fibonacci(20)
}

func test2() int{
	var r int = GetRandom(0, 10000);
	if _, err := os.Stat("./tmp/tmp" + strconv.Itoa(r)); os.IsNotExist(err){
		var f int = fibonacci(20)
		data := strings.Repeat(strconv.Itoa(f), r)
		//fmt.Printf(data)
		err = ioutil.WriteFile("./tmp/tmp" + strconv.Itoa(r), []byte(data), 0777);
		if err != nil{
			log.Fatal(err);
		}
		return len(data);
	}else
	{
		var data, err = ioutil.ReadFile("./tmp/tmp" + strconv.Itoa(r))
		if err != nil {
			log.Fatal(err)
		}
		return len(data);
	}
}

func GetRandom(min int, max int) int{
	return rand.Intn(max - min) + min;
}

func initTest2(){
	os.RemoveAll("./tmp")
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
	config := profile.Config{
		CPUProfile: true,
		MemProfile: true,
		BlockProfile: true,
	}
	defer profile.Start(&config).Stop()
	initTest2()
	http.HandleFunc("/", handler)
	fmt.Printf("listing on 8081");
	http.ListenAndServe(":8081", nil)
}
