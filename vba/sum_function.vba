Function SumCells(rng As Range) As Double
    ' Вычисляет сумму ячеек в заданном диапазоне
    SumCells = Application.WorksheetFunction.Sum(rng)
End Function