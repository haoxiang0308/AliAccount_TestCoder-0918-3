Attribute VB_Name = "Module1"
Option Explicit

' Функция для вычисления суммы ячеек в указанном диапазоне
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

' Подпрограмма для демонстрации использования функции и сохранения файла
Sub CalculateSumAndSave()
    Dim ws As Worksheet
    Dim sumRange As Range
    Dim result As Double
    Dim fileName As String
    Dim randomNum As Long
    
    ' Инициализация генератора случайных чисел
    Randomize
    
    ' Установка рабочего листа (активный лист)
    Set ws = ActiveSheet
    
    ' Определение диапазона для суммирования (например, A1:A10)
    Set sumRange = ws.Range("A1:A10")
    
    ' Вычисление суммы с помощью функции SumCells
    result = SumCells(sumRange)
    
    ' Генерация случайного имени файла
    randomNum = Int((999999 - 100000 + 1) * Rnd + 100000)
    fileName = "SumResult_" & CStr(randomNum) & ".txt"
    
    ' Сохранение результата в файл со случайным именем
    Open ThisWorkbook.Path & "\" & fileName For Output As #1
    Print #1, "Сумма ячеек: " & result
    Print #1, "Диапазон: " & sumRange.Address
    Print #1, "Дата вычисления: " & Now
    Close #1
    
    MsgBox "Сумма вычислена: " & result & vbCrLf & _
           "Результат сохранен в файл: " & fileName, vbInformation, "Готово"
End Sub
