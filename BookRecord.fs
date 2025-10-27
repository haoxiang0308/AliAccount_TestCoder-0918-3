// F#记录类型定义表示图书信息
type Book = {
    Id: int
    Title: string
    Author: string
    ISBN: string
    PublicationYear: int
    Genre: string
    Price: decimal
    InStock: bool
}

// 示例：创建一个图书实例
let sampleBook = {
    Id = 1
    Title = "F#编程指南"
    Author = "张三"
    ISBN = "978-1234567890"
    PublicationYear = 2023
    Genre = "编程"
    Price = 59.99m
    InStock = true
}

// 打印图书信息的函数
let printBook (book: Book) =
    printfn "书名: %s" book.Title
    printfn "作者: %s" book.Author
    printfn "ISBN: %s" book.ISBN
    printfn "出版年份: %d" book.PublicationYear
    printfn "类型: %s" book.Genre
    printfn "价格: %.2f" book.Price
    printfn "是否有库存: %b" book.InStock