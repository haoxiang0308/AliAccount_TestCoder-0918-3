package main

import (
	"fmt"
	"sync"
)

func printNumbers(wg *sync.WaitGroup) {
	defer wg.Done() // 函数退出时调用 Done()
	for i := 1; i <= 10; i++ {
		fmt.Println(i)
	}
}

func main() {
	var wg sync.WaitGroup
	wg.Add(1) // 增加一个待等待的协程
	go printNumbers(&wg)
	// 等待协程完成
	wg.Wait()
}