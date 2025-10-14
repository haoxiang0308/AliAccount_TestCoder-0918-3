' Функция для вычисления суммы ячеек в заданном диапазоне
Function SumRange(rng As Range) As Double
    ' Объявление переменной для хранения суммы
    Dim total As Double
    ' Инициализация переменной
    total = 0
    
    ' Перебор каждой ячейки в диапазоне
    Dim cell As Range
    For Each cell In rng
        ' Проверка, является ли значение в ячейке числом
        If IsNumeric(cell.Value) Then
            ' Добавление значения ячейки к общей сумме
            total = total + cell.Value
        End If
    Next cell
    
    ' Возврат вычисленной суммы
    SumRange = total
End Function