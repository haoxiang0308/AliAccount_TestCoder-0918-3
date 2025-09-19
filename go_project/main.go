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
	filename := fmt.Sprintf("output_%d.txt", rand.Intn(10000))
	fmt.Printf("Printing numbers to file: %s\n", filename)

	ch := make(chan bool, 1)

	for i := 1; i <= 10; i++ {
		go printNumber(i, ch)
		<-ch // Wait for the goroutine to finish
	}

	// Give a moment for all output to flush
	time.Sleep(100 * time.Millisecond)
	fmt.Println("Finished printing numbers 1 to 10 using goroutines.")
}