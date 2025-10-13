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