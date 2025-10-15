package main

import (
	"fmt"
	"sync"
)

func main() {
	var wg sync.WaitGroup

	// 打印数字1到10的协程
	for i := 1; i <= 10; i++ {
		wg.Add(1)
		go func(num int) {
			defer wg.Done()
			fmt.Println(num)
		}(i)
	}

	// 等待所有协程完成
	wg.Wait()
}