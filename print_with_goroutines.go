package main

import (
	"fmt"
	"time"
)

func printNumber(num int) {
	fmt.Println(num)
}

func main() {
	// 使用协程打印数字1到10
	for i := 1; i <= 10; i++ {
		go printNumber(i)
	}
	
	// 等待所有协程完成
	time.Sleep(100 * time.Millisecond)
}