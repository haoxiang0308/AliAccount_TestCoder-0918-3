// F#记录类型定义 - 图书信息
type Book = {
    Id: int
    Title: string
    Author: string
    ISBN: string
    PublishYear: int
    Price: decimal
    Genre: string
}

// 示例：创建一本图书
let sampleBook = {
    Id = 1
    Title = "F#编程指南"
    Author = "张三"
    ISBN = "978-1234567890"
    PublishYear = 2023
    Price = 49.99m
    Genre = "计算机编程"
}

// 打印图书信息的辅助函数
let printBook (book: Book) =
    printfn "ID: %d" book.Id
    printfn "书名: %s" book.Title
    printfn "作者: %s" book.Author
    printfn "ISBN: %s" book.ISBN
    printfn "出版年份: %d" book.PublishYear
    printfn "价格: %.2f" book.Price
    printfn "类型: %s" book.Genre