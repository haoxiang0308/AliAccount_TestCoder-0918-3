Function SumCells(rng As Range) As Double
    ' Функция для вычисления суммы ячеек в заданном диапазоне
    SumCells = Application.WorksheetFunction.Sum(rng)
End Function