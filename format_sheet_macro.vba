Sub FormatSheet()
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format Header Row
    With ws.Range("A1:D1")
        .Value = Array("Product", "Q1 Sales", "Q2 Sales", "Total Sales")
        .Font.Bold = True
        .Font.Size = 12
        .Interior.Color = RGB(200, 200, 200)
        .Borders(xlEdgeBottom).LineStyle = xlContinuous
    End With
    
    ' Add Sample Data
    ws.Range("A2").Value = "Widgets"
    ws.Range("B2").Value = 100
    ws.Range("C2").Value = 150
    ws.Range("A3").Value = "Gadgets"
    ws.Range("B3").Value = 200
    ws.Range("C3").Value = 180
    
    ' Calculate Total Sales
    ws.Range("D2").Formula = "=B2+C2"
    ws.Range("D3").Formula = "=B3+C3"
    
    ' Format Data Range
    With ws.Range("A1:D3")
        .Borders.LineStyle = xlContinuous
        .HorizontalAlignment = xlCenter
    End With
    
    ' Auto-fit Columns
    ws.Columns("A:D").AutoFit
    
    MsgBox "Sheet formatted successfully!"
End Sub