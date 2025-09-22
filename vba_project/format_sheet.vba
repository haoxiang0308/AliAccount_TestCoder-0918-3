Sub FormatExcelSheet()
    ' This macro formats the active Excel sheet
    
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format headers (assuming first row is headers)
    With ws.Rows(1)
        .Font.Bold = True
        .Font.Size = 12
        .Font.Color = RGB(255, 255, 255) ' White text
        .Interior.Color = RGB(50, 50, 50) ' Dark gray background
        .HorizontalAlignment = xlCenter
    End With
    
    ' Auto-fit columns
    ws.Columns.AutoFit
    
    ' Add borders to all cells with data
    ws.UsedRange.Borders.LineStyle = xlContinuous
    ws.UsedRange.Borders.Weight = xlThin
    
    ' Format alternating rows with light gray background
    Dim lastRow As Long
    lastRow = ws.Cells(ws.Rows.Count, 1).End(xlUp).Row
    
    Dim i As Long
    For i = 2 To lastRow
        If i Mod 2 = 0 Then
            ws.Rows(i).Interior.Color = RGB(240, 240, 240) ' Light gray
        Else
            ws.Rows(i).Interior.Color = RGB(255, 255, 255) ' White
        End If
    Next i
    
    ' Center the worksheet content
    ws.Activate
    ActiveWindow.ScrollRow = 1
    ActiveWindow.ScrollColumn = 1
    
    MsgBox "Sheet formatting complete!", vbInformation
End Sub