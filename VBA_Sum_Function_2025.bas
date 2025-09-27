Function CalculateSum(rng As Range) As Double
    ' Вычисляет сумму значений в заданном диапазоне ячеек
    CalculateSum = Application.WorksheetFunction.Sum(rng)
End Function