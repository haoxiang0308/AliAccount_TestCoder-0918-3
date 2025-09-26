package main

import (
	"fmt"
	"sync"
)

func printNumber(wg *sync.WaitGroup, num int) {
	defer wg.Done()
	fmt.Println(num)
}

func main() {
	var wg sync.WaitGroup

	for i := 1; i <= 10; i++ {
		wg.Add(1)
		go printNumber(&wg, i)
	}

	wg.Wait()
}