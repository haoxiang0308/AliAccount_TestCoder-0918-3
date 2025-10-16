// F# record type to represent book information
type Book = {
    Id: int
    Title: string
    Author: string
    ISBN: string
    PublicationYear: int
    Genre: string
    Price: decimal
}

// Example of creating a book record
let sampleBook = {
    Id = 1
    Title = "The F# Programming Language"
    Author = "Microsoft Press"
    ISBN = "978-1234567890"
    PublicationYear = 2023
    Genre = "Programming"
    Price = 49.99m
}

// Function to display book information
let displayBook (book: Book) =
    printfn "Book ID: %d" book.Id
    printfn "Title: %s" book.Title
    printfn "Author: %s" book.Author
    printfn "ISBN: %s" book.ISBN
    printfn "Publication Year: %d" book.PublicationYear
    printfn "Genre: %s" book.Genre
    printfn "Price: $%.2f" book.Price

// Example usage
displayBook sampleBook