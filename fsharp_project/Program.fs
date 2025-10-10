open System

// Пример обработки списка чисел: вычисление суммы и фильтрация четных чисел
let processNumbers numbers =
    let sum = List.sum numbers
    let evens = List.filter (fun x -> x % 2 = 0) numbers
    (sum, evens)

[<EntryPoint>]
let main argv =
    let numbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]
    let total, evenNumbers = processNumbers numbers

    printfn "Original list: %A" numbers
    printfn "Sum: %d" total
    printfn "Even numbers: %A" evenNumbers

    // Сохранение результата в файл со случайным именем
    let fileName = "output_" + Guid.NewGuid().ToString("N").Substring(0, 8) + ".txt"
    let content = sprintf "Original list: %A\nSum: %d\nEven numbers: %A" numbers total evenNumbers
    System.IO.File.WriteAllText(fileName, content)
    printfn "Results saved to %s" fileName

    0