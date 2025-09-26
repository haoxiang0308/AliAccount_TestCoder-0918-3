open System

// Функция для обработки списка чисел
let processNumbers numbers =
    numbers
    |> List.filter (fun x -> x > 0) // Оставить только положительные числа
    |> List.map (fun x -> x * x)    // Возвести в квадрат
    |> List.sort                   // Отсортировать по возрастанию

let numbers = [ -2; 5; -1; 3; 8; 0; 4 ]
let processedNumbers = processNumbers numbers

printfn "Исходный список: %A" numbers
printfn "Обработанный список: %A" processedNumbers

// Сохранение результата в файл со случайным именем
let randomFileName = "processed_numbers_" + (Guid.NewGuid().ToString()) + ".txt"
use file = new System.IO.StreamWriter(randomFileName)
file.WriteLine("Исходный список: {0}", String.Join(", ", numbers))
file.WriteLine("Обработанный список: {0}", String.Join(", ", processedNumbers))

printfn "Результаты сохранены в файл: %s" randomFileName
