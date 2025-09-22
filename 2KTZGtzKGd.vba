Sub FormatExcelSheet()
    ' This macro formats an Excel sheet with common formatting options
    
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
    
    ' Center align all data
    ws.Range("A1:E100").HorizontalAlignment = xlCenter
    
    ' Add a title
    ws.Range("A1").EntireRow.Insert
    ws.Range("A1").Value = "Sales Data Report"
    ws.Range("A1").Font.Bold = True
    ws.Range("A1").Font.Size = 16
    ws.Range("A1:E1").Merge
    
    MsgBox "Sheet formatting complete!"
End Sub