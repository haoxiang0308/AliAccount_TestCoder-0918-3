package main

import (
	"fmt"
)

func printNumbers(ch chan int, start, end int) {
	for i := start; i <= end; i++ {
		ch <- i
	}
	close(ch)
}

func main() {
	ch := make(chan int)
	go printNumbers(ch, 1, 10)

	for num := range ch {
		fmt.Println(num)
	}
}