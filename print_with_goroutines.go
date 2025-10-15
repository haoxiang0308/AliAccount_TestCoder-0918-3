package main

import (
	"fmt"
	"time"
)

func printNumber(num int) {
	fmt.Println(num)
}

func main() {
	// Start goroutines to print numbers 1 to 10
	for i := 1; i <= 10; i++ {
		go printNumber(i)
	}
	
	// Give goroutines time to execute
	time.Sleep(100 * time.Millisecond)
}