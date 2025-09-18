package main

import (
	"fmt"
)

func printNumber(num int, ch chan bool) {
	fmt.Println(num)
	ch <- true
}

func main() {
	// rand.Seed(time.Now().UnixNano())
	// filename := fmt.Sprintf("output_%d.txt", rand.Intn(10000))
	
	channels := make([]chan bool, 10)
	for i := 0; i < 10; i++ {
		channels[i] = make(chan bool)
		go printNumber(i+1, channels[i])
	}
	
	for _, ch := range channels {
		<-ch
	}
}