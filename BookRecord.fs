// F# Record Type for Book Information
type Book = {
    Title: string
    Author: string
    ISBN: string
    PublicationYear: int
    Genre: string
    Price: decimal option  // Optional field for price
}

// Example of creating a book instance
let sampleBook = {
    Title = "The F# Programming Language"
    Author = "Microsoft"
    ISBN = "978-1234567890"
    PublicationYear = 2023
    Genre = "Technical"
    Price = Some 29.99m
}

// Function to display book information
let displayBook (book: Book) =
    printfn "Title: %s" book.Title
    printfn "Author: %s" book.Author
    printfn "ISBN: %s" book.ISBN
    printfn "Publication Year: %d" book.PublicationYear
    printfn "Genre: %s" book.Genre
    match book.Price with
    | Some price -> printfn "Price: $%.2f" price
    | None -> printfn "Price: Not specified"