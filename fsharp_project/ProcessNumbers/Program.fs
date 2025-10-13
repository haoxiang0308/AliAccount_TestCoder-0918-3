open System

// Пример обработки списка чисел: нахождение суммы, максимального и минимального элементов
let processNumbers numbers =
    match numbers with
    | [] -> printfn "Список пуст"
    | _ ->
        let sum = List.sum numbers
        let max = List.max numbers
        let min = List.min numbers
        printfn "Список: %A" numbers
        printfn "Сумма: %d" sum
        printfn "Максимум: %d" max
        printfn "Минимум: %d" min

[<EntryPoint>]
let main argv =
    let numbers = [1; 5; -3; 8; 2; 10; -1]
    processNumbers numbers
    0