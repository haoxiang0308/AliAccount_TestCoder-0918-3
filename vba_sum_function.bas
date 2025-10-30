' Функция для вычисления суммы ячеек
Function SumCells(rng As Range) As Double
    Dim cell As Range
    Dim total As Double
    
    total = 0
    For Each cell In rng
        If IsNumeric(cell.Value) Then
            total = total + cell.Value
        End If
    Next cell
    
    SumCells = total
End Function

' Альтернативная функция для использования как макрос (субпроцедура)
Sub CalculateSum()
    Dim selectedRange As Range
    Dim result As Double
    Dim cell As Range
    
    ' Используем выделенный диапазон
    Set selectedRange = Selection
    
    result = 0
    For Each cell In selectedRange
        If IsNumeric(cell.Value) Then
            result = result + cell.Value
        End If
    Next cell
    
    ' Выводим результат в ячейку A1 активного листа
    ActiveSheet.Range("A1").Value = "Сумма: " & result
End Sub