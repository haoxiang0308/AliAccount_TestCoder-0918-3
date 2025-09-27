package main

import (
	"fmt"
)

func printNumbers(start, end int) {
	for i := start; i <= end; i++ {
		fmt.Println(i)
	}
}

func main() {
	// 使用通道来同步goroutine
	done := make(chan bool)

	// 启动一个goroutine来打印数字1到10
	go func() {
		printNumbers(1, 10)
		done <- true // 完成后发送信号
	}()

	<-done // 等待goroutine完成
}