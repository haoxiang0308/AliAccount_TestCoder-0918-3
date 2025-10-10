let square x = x * x

[<EntryPoint>]
let main argv =
    printfn "The square of 5 is 0" (square 5)
    0