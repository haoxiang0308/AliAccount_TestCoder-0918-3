Sub FormatExcelSheet()
    ' This macro formats an Excel sheet with common formatting options
    
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format the header row
    With ws.Range("A1:E1")
        .Font.Bold = True
        .Font.Size = 12
        .Interior.Color = RGB(79, 129, 189)
        .Font.Color = RGB(255, 255, 255)
        .HorizontalAlignment = xlCenter
    End With
    
    ' Add borders to all cells in the used range
    ws.UsedRange.Borders.LineStyle = xlContinuous
    ws.UsedRange.Borders.Weight = xlThin
    
    ' Auto-fit columns
    ws.Columns.AutoFit
    
    ' Center align all data
    ws.UsedRange.HorizontalAlignment = xlCenter
    
    ' Add alternating row colors
    Dim i As Long
    For i = 2 To ws.UsedRange.Rows.Count
        If i Mod 2 = 0 Then
            ws.Rows(i).Interior.Color = RGB(217, 225, 242)
        Else
            ws.Rows(i).Interior.Color = xlNone
        End If
    Next i
    
    ' Add a title
    ws.Range("A1").EntireRow.Insert
    ws.Range("A1:E1").Merge
    ws.Range("A1").Value = "Formatted Data Report"
    ws.Range("A1").Font.Bold = True
    ws.Range("A1").Font.Size = 16
    ws.Range("A1").HorizontalAlignment = xlCenter
    
    MsgBox "Sheet formatting complete!"
End Sub