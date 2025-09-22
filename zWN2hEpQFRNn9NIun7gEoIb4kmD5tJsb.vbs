' Функция VBA для вычисления суммы диапазона ячеек в Excel
Function SumRange(rng As Range) As Double
    SumRange = Application.WorksheetFunction.Sum(rng)
End Function

' Пример использования функции
Sub ExampleUsage()
    Dim result As Double
    result = SumRange(Range("A1:A10"))
    MsgBox "Сумма ячеек A1:A10 равна: " & result
End Sub