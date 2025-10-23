// F# record type for book information
type Book = {
    Title: string
    Author: string
    ISBN: string
    PublicationYear: int
    Genre: string
    Price: decimal
    PageCount: int
}

// Example of creating a book record
let sampleBook = {
    Title = "The F# Programming Language"
    Author = "Microsoft"
    ISBN = "978-1234567890"
    PublicationYear = 2023
    Genre = "Technical"
    Price = 49.99m
    PageCount = 350
}

// Print the sample book
printfn "Sample book: %A" sampleBook