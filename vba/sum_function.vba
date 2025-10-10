Function CalculateSum(rng As Range) As Double
    ' Вычисляет сумму ячеек в заданном диапазоне
    CalculateSum = Application.WorksheetFunction.Sum(rng)
End Function