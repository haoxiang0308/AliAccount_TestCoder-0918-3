open System
open System.IO

// Функция для обработки списка чисел
let processNumbers numbers =
    numbers
    |> List.map (fun x -> x * x) // Возведем каждое число в квадрат
    |> List.filter (fun x -> x > 10) // Оставим только те, что больше 10

let numbers = [1; 2; 3; 4; 5; 6]
let processedNumbers = processNumbers numbers

let output = sprintf "Original: %A\nProcessed: %A" numbers processedNumbers

// Генерируем случайное имя файла
let randomFileName = Path.GetRandomFileName() + ".txt"
let filePath = Path.Combine(Directory.GetCurrentDirectory(), randomFileName)

File.WriteAllText(filePath, output)

printfn "Результаты записаны в файл: %s" filePath
