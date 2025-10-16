package main

import (
	"fmt"
	"time"
)

func printNumbers(ch chan int) {
	for i := 1; i <= 10; i++ {
		ch <- i
	}
	close(ch)
}

func main() {
	ch := make(chan int)
	
	go printNumbers(ch)
	
	for num := range ch {
		fmt.Println(num)
		time.Sleep(100 * time.Millisecond) // 添加短暂延迟以观察输出
	}
}