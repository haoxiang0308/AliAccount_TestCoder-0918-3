// Список чисел для обработки
let numbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]

// Функция для обработки списка: находит квадраты четных чисел
let processNumbers lst =
    lst
    |> List.filter (fun x -> x % 2 = 0)  // Фильтруем четные числа
    |> List.map (fun x -> x * x)         // Находим их квадраты

// Применяем функцию к списку
let result = processNumbers numbers

// Выводим результат
printfn "Оригинальный список: %A" numbers
printfn "Квадраты четных чисел: %A" result

// Сохраняем результат в файл
let fileName = System.IO.Path.GetRandomFileName() + ".txt"
System.IO.File.WriteAllText(fileName, sprintf "Квадраты четных чисел: %A" result)
printfn "Результат сохранен в файл: %s" fileName