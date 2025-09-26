open System

// Пример списка чисел
let numbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]

// Функция для обработки списка: вычисление квадратов чисел
let processNumbers lst =
    lst
    |> List.map (fun x -> x * x)

// Обработка списка
let processedNumbers = processNumbers numbers

// Вывод результата в консоль
printfn "Исходный список: %A" numbers
printfn "Обработанный список (квадраты): %A" processedNumbers

// Генерация случайного имени файла
let random = Random()
let fileName = sprintf "/workspace/output_%d.txt" (random.Next(1000, 9999))

// Сохранение результата в файл
use file = new System.IO.StreamWriter(fileName)
file.WriteLine("Исходный список:")
file.WriteLine(sprintf "%A" numbers)
file.WriteLine("Обработанный список (квадраты):")
file.WriteLine(sprintf "%A" processedNumbers)

printfn "Результаты сохранены в файл: %s" fileName