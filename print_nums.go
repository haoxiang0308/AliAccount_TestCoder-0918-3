package main

import (
	"fmt"
)

func printNumbers(start, end int, done chan bool) {
	for i := start; i <= end; i++ {
		fmt.Println(i)
	}
	done <- true
}

func main() {
	done := make(chan bool)
	go printNumbers(1, 10, done)
	<-done
}