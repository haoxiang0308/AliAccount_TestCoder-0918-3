' VBA Function to calculate sum of cells
Function SumCells(rng As Range) As Double
    ' This function takes a range and returns the sum of all numeric values in that range
    Dim cell As Range
    Dim total As Double
    
    total = 0
    
    ' Loop through each cell in the range and add the value to total
    For Each cell In rng
        If IsNumeric(cell.Value) Then
            total = total + cell.Value
        End If
    Next cell
    
    ' Return the calculated sum
    SumCells = total
End Function

' Alternative simpler version using Excel's built-in SUM function
Function SimpleSum(rng As Range) As Double
    SimpleSum = Application.WorksheetFunction.Sum(rng)
End Function

' Subroutine to demonstrate usage of the function
Sub ExampleUsage()
    ' Example of how to use the SumCells function
    Dim result As Double
    result = SumCells(Range("A1:A10"))
    MsgBox "Sum of A1:A10 is: " & result
End Sub