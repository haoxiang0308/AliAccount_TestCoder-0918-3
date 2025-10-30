' VBA code to fill Excel cells using loops
Sub FillCellsUsingLoops()
    Dim i As Integer
    Dim j As Integer
    
    ' Fill cells in a 10x10 grid with numbers
    For i = 1 To 10
        For j = 1 To 10
            ' Fill cells with a pattern: row number * column number
            Cells(i, j).Value = i * j
        Next j
    Next i
    
    ' Add some text labels
    Cells(12, 1).Value = "Filled using nested loops"
    Cells(13, 1).Value = "Rows: 1 to 10, Columns: 1 to 10"
    
    ' Fill a column with sequential numbers
    For i = 15 To 25
        Cells(i, 1).Value = "Item " & (i - 14)
        Cells(i, 2).Value = i - 14
    Next i
    
    MsgBox "Cells have been filled using loops!", vbInformation
End Sub

' Alternative example with different loop patterns
Sub FillWithDifferentPatterns()
    Dim i As Integer
    
    ' Fill row 30 with incrementing numbers
    For i = 1 To 20
        Cells(30, i).Value = i
    Next i
    
    ' Fill column 5 with dates starting from today
    For i = 1 To 15
        Cells(i, 5).Value = Date + i - 1
        Cells(i, 5).NumberFormat = "mm/dd/yyyy"
    Next i
    
    ' Fill a triangular pattern
    Dim row As Integer, col As Integer
    row = 35
    For i = 1 To 8
        For j = 1 To i
            Cells(row, j).Value = "*"
        Next j
        row = row + 1
    Next i
    
    MsgBox "Additional patterns filled!", vbInformation
End Sub