' VBA function to calculate the sum of cells
Function SumCells(rng As Range) As Double
    ' This function takes a range of cells and returns their sum
    SumCells = Application.WorksheetFunction.Sum(rng)
End Function

' Alternative implementation with error handling
Function SumCellsSafe(rng As Range) As Variant
    On Error GoTo ErrorHandler
    SumCellsSafe = Application.WorksheetFunction.Sum(rng)
    Exit Function
    
ErrorHandler:
    SumCellsSafe = "Error: " & Err.Description
End Function

' Subroutine to demonstrate usage
Sub ExampleUsage()
    ' Example of how to use the function
    Dim result As Double
    result = SumCells(Range("A1:A10"))
    MsgBox "Sum of A1:A10 is: " & result
End Sub