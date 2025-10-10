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
	// 启动一个goroutine来打印数字1到10
	go printNumbers(1, 10)

	// 主goroutine需要等待一段时间，以确保其他goroutine有时间执行
	// 在实际应用中，应使用sync.WaitGroup等同步机制
	fmt.Scanln() // 等待用户输入，以便在演示中看到输出
}