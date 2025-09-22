package main

import (
	"fmt"
	"math/rand"
	"time"
)

func printNumber(num int, ch chan bool) {
	fmt.Println(num)
	ch <- true
}

func main() {
	rand.Seed(time.Now().UnixNano())
	channels := make([]chan bool, 10)

	for i := 0; i < 10; i++ {
		channels[i] = make(chan bool)
		go printNumber(i+1, channels[i])
	}

	// 等待所有协程完成
	for _, ch := range channels {
		<-ch
	}
}