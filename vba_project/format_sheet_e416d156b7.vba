Sub FormatExcelSheet()
    ' This macro formats the active Excel sheet
    
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format the header row
    With ws.Range("A1:E1")
        .Font.Bold = True
        .Font.Size = 12
        .Interior.Color = RGB(200, 200, 200)
        .Borders.LineStyle = xlContinuous
    End With
    
    ' Auto-fit columns
    ws.Columns("A:E").AutoFit
    
    ' Format data range
    With ws.Range("A2:E100")
        .Borders.LineStyle = xlContinuous
        .Borders.Weight = xlThin
    End With
    
    ' Center align all cells
    ws.Range("A1:E100").HorizontalAlignment = xlCenter
    
    MsgBox "Sheet formatting complete!"
End Sub