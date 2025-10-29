package main

import (
	"fmt"
	"sync"
	"time"
)

func main() {
	var wg sync.WaitGroup
	
	for i := 1; i <= 10; i++ {
		wg.Add(1)
		go func(num int) {
			defer wg.Done()
			time.Sleep(time.Millisecond * 10) // 小延迟以确保顺序输出
			fmt.Println(num)
		}(i)
	}
	
	wg.Wait() // 等待所有协程完成
}