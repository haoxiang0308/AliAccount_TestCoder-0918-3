Sub FormatExcelSheet()
    ' Declare variables
    Dim ws As Worksheet
    Dim lastRow As Long
    Dim lastCol As Long
    
    ' Set the active worksheet
    Set ws = ActiveSheet
    
    ' Find the last row and column with data
    lastRow = ws.Cells(ws.Rows.Count, 1).End(xlUp).Row
    lastCol = ws.Cells(1, ws.Columns.Count).End(xlToLeft).Column
    
    ' Format the header row (assuming first row is header)
    With ws.Range(ws.Cells(1, 1), ws.Cells(1, lastCol))
        .Font.Bold = True
        .Font.Size = 12
        .Interior.Color = RGB(79, 129, 189) ' Blue background
        .Font.Color = RGB(255, 255, 255) ' White text
        .HorizontalAlignment = xlCenter
    End With
    
    ' Add borders to all cells with data
    With ws.Range(ws.Cells(1, 1), ws.Cells(lastRow, lastCol))
        .Borders.LineStyle = xlContinuous
        .Borders.Weight = xlThin
    End With
    
    ' Auto-fit columns
    ws.Columns.AutoFit
    
    ' Center align all data cells
    ws.Range(ws.Cells(2, 1), ws.Cells(lastRow, lastCol)).HorizontalAlignment = xlCenter
    
    ' Apply alternating row colors
    Dim i As Long
    For i = 2 To lastRow
        If i Mod 2 = 0 Then
            ws.Range(ws.Cells(i, 1), ws.Cells(i, lastCol)).Interior.Color = RGB(217, 225, 242) ' Light blue
        Else
            ws.Range(ws.Cells(i, 1), ws.Cells(i, lastCol)).Interior.Color = RGB(255, 255, 255) ' White
        End If
    Next i
    
    ' Add a title above the data (optional)
    ' ws.Range("A1").EntireRow.Insert
    ' ws.Range("A1").Value = "Formatted Data"
    ' ws.Range("A1").Font.Bold = True
    ' ws.Range("A1").Font.Size = 14
    
    MsgBox "Sheet formatting complete!"
End Sub