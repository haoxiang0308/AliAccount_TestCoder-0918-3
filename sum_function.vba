' VBA function to calculate the sum of cells
Function SumCells(rng As Range) As Double
    ' This function takes a range of cells and returns their sum
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

' Alternative function that accepts a range as a parameter and sums all cells in that range
Function CalculateSum(inputRange As Range) As Double
    CalculateSum = Application.WorksheetFunction.Sum(inputRange)
End Function

' Subroutine to demonstrate usage
Sub ExampleUsage()
    ' Example: Use the function to sum cells A1:A10
    Dim result As Double
    result = SumCells(Range("A1:A10"))
    MsgBox "The sum of cells A1:A10 is: " & result
End Sub