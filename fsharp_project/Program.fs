open System

// Функция для обработки списка чисел
let processNumbers numbers =
    numbers
    |> List.filter (fun x -> x > 0) // Оставить только положительные числа
    |> List.map (fun x -> x * x)    // Возвести в квадрат
    |> List.sort                   // Отсортировать по возрастанию

[<EntryPoint>]
let main argv =
    let originalList = [ -2; 4; -1; 5; 0; 3; -8; 7 ]
    printfn "Original list: %A" originalList

    let processedList = processNumbers originalList
    printfn "Processed list (positive, squared, sorted): %A" processedList

    // Сохранить результат в файл со случайным именем
    let fileName = sprintf "output_%d.txt" (DateTime.Now.Ticks % 1000000L)
    System.IO.File.WriteAllText(fileName, (String.concat "\n" (List.map string processedList)))
    printfn "Result saved to %s" fileName

    0 // Возврат кода выхода