// F# record type to represent book information
type Book = {
    Title: string
    Author: string
    ISBN: string
    PublicationYear: int
    Genre: string
    Price: decimal
    Pages: int
}

// Example usage
let sampleBook = {
    Title = "The F# Programming Language"
    Author = "Microsoft"
    ISBN = "978-1234567890"
    PublicationYear = 2023
    Genre = "Programming"
    Price = 29.99m
    Pages = 350
}

printfn "Sample book: %A" sampleBook