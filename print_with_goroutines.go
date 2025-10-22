package main

import (
	"fmt"
	"sync"
	"time"
)

func main() {
	var wg sync.WaitGroup

	// 设置要打印的数字范围
	for i := 1; i <= 10; i++ {
		wg.Add(1)
		go func(num int) {
			defer wg.Done()
			// 添加一个小延迟以展示并发效果
			time.Sleep(time.Millisecond * 100)
			fmt.Println(num)
		}(i)
	}

	// 等待所有goroutine完成
	wg.Wait()
	fmt.Println("所有数字已打印完成")
}