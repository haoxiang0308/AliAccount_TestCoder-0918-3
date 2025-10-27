// F#记录类型定义表示图书信息 - 另一种实现
type BookInfo = {
    BookId: int
    Name: string
    Writer: string
    ISBNCode: string
    PublishYear: int
    Category: string
    Cost: float
    Available: bool
    Publisher: string
    PageCount: int
}

// 示例：创建一个图书实例
let exampleBook = {
    BookId = 101
    Name = "函数式编程入门"
    Writer = "李四"
    ISBNCode = "978-0987654321"
    PublishYear = 2022
    Category = "计算机科学"
    Cost = 45.50
    Available = true
    Publisher = "技术出版社"
    PageCount = 320
}

// 显示图书详情的函数
let displayBookDetails (book: BookInfo) =
    printfn "图书ID: %d" book.BookId
    printfn "书名: %s" book.Name
    printfn "作者: %s" book.Writer
    printfn "ISBN: %s" book.ISBNCode
    printfn "出版年份: %d" book.PublishYear
    printfn "分类: %s" book.Category
    printfn "价格: %.2f" book.Cost
    printfn "是否可用: %b" book.Available
    printfn "出版社: %s" book.Publisher
    printfn "页数: %d" book.PageCount