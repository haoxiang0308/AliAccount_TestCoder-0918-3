Sub FormatSheet()
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format the header row
    With ws.Range("A1:D1")
        .Font.Bold = True
        .Font.Size = 12
        .Interior.Color = RGB(200, 200, 200)
        .Borders.LineStyle = xlContinuous
    End With
    
    ' Auto-fit columns
    ws.Columns("A:D").AutoFit
    
    ' Add a title
    ws.Range("A1").Value = "Sales Data"
    ws.Range("A1:D1").Merge
    ws.Range("A1").HorizontalAlignment = xlCenter
    
    ' Format data rows
    Dim lastRow As Long
    lastRow = ws.Cells(ws.Rows.Count, "A").End(xlUp).Row
    
    Dim i As Long
    For i = 2 To lastRow
        If i Mod 2 = 0 Then
            ws.Range("A" & i & ":D" & i).Interior.Color = RGB(240, 240, 240)
        End If
        ws.Range("A" & i & ":D" & i).Borders.LineStyle = xlContinuous
    Next i
    
    ' Apply number formatting to the "Amount" column (D)
    ws.Range("D2:D" & lastRow).NumberFormat = "$#,##0.00"
    
    MsgBox "Sheet formatting complete!"
End Sub