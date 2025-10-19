// F# Record Type for Book Information
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

// Example usage:
let sampleBook = {
    Id = 1
    Title = "The F# Programming Language"
    Author = "Microsoft"
    ISBN = "978-1234567890"
    PublicationYear = 2023
    Genre = "Technical"
    Price = 29.99m
    InStock = true
}

printfn "Sample book: %A" sampleBook