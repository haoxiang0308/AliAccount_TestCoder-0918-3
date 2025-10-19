// Программа на F# для обработки списка чисел
open System

// Функция для обработки списка чисел
let processNumbers numbers =
    if List.isEmpty numbers then
        printfn "Список пуст"
        (0.0, 0.0, 0.0, 0.0)  // возвращаем нули, если список пуст
    else
        let sum = List.sum numbers
        let avg = sum / float (List.length numbers)
        let min = List.min numbers
        let max = List.max numbers
        
        printfn "Сумма: %f" sum
        printfn "Среднее: %f" avg
        printfn "Минимум: %f" min
        printfn "Максимум: %f" max
        
        (sum, avg, min, max)

// Пример использования
let numbers = [1.0; 2.0; 3.0; 4.0; 5.0; 6.0; 7.0; 8.0; 9.0; 10.0]
printfn "Обработка списка чисел: %A" numbers
let (sum, avg, min, max) = processNumbers numbers

printfn "\nРезультаты:"
printfn "Сумма: %f" sum
printfn "Среднее: %f" avg
printfn "Минимум: %f" min
printfn "Максимум: %f" max

// Ждем нажатия клавиши перед закрытием
Console.WriteLine("\nНажмите любую клавишу для выхода...")
Console.ReadKey() |> ignore