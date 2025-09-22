// Программа на F# для обработки списка чисел
// Файл: u74pKGLGPr.fs

// Функция для фильтрации четных чисел
let filterEvenNumbers (numbers: int list) : int list =
    List.filter (fun x -> x % 2 = 0) numbers

// Функция для вычисления квадратов чисел
let squareNumbers (numbers: int list) : int list =
    List.map (fun x -> x * x) numbers

// Функция для нахождения суммы элементов списка
let sumNumbers (numbers: int list) : int =
    List.sum numbers

// Основная функция
[<EntryPoint>]
let main argv =
    // Исходный список чисел
    let numbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]
    
    printfn "Исходный список чисел: %A" numbers
    
    // Фильтрация четных чисел
    let evenNumbers = filterEvenNumbers numbers
    printfn "Четные числа: %A" evenNumbers
    
    // Вычисление квадратов чисел
    let squaredNumbers = squareNumbers numbers
    printfn "Квадраты чисел: %A" squaredNumbers
    
    // Нахождение суммы всех чисел
    let totalSum = sumNumbers numbers
    printfn "Сумма всех чисел: %d" totalSum
    
    // Нахождение суммы четных чисел
    let evenSum = sumNumbers evenNumbers
    printfn "Сумма четных чисел: %d" evenSum
    
    0 // Возвращаемое значение программы