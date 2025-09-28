' Function to calculate the sum of a range of cells
Function SumCells(rng As Range) As Double
    SumCells = Application.WorksheetFunction.Sum(rng)
End Function