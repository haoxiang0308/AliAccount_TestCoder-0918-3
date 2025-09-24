open System

// Функция для обработки списка чисел
let processNumbers numbers =
    numbers
    |> List.filter (fun x -> x > 0) // Оставить только положительные числа
    |> List.map (fun x -> x * x)     // Возвести в квадрат
    |> List.sort                     // Отсортировать по возрастанию

[<EntryPoint>]
let main argv =
    let originalList = [ -2; 5; -1; 3; 8; 0; 4 ]
    let processedList = processNumbers originalList

    printfn "Оригинальный список: %A" originalList
    printfn "Обработанный список: %A" processedList

    // Сохранение результата в файл со случайным именем
    let fileName = sprintf "output_%d.txt" (DateTime.Now.Ticks % 1000000L)
    let filePath = Path.Combine("/workspace", fileName)
    File.WriteAllText(filePath, (sprintf "%A" processedList))
    printfn "Результаты сохранены в файл: %s" filePath

    0 // Возврат кода выхода