Sub FormatExcelSheet()
    ' Get the active worksheet
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format the header row
    With ws.Range("A1:E1")
        .Font.Bold = True
        .Font.Size = 12
        .Interior.Color = RGB(79, 129, 189) ' Blue background
        .Font.Color = RGB(255, 255, 255) ' White text
        .HorizontalAlignment = xlCenter
    End With
    
    ' Add some sample data
    ws.Cells(1, 1).Value = "Name"
    ws.Cells(1, 2).Value = "Department"
    ws.Cells(1, 3).Value = "Salary"
    ws.Cells(1, 4).Value = "Start Date"
    ws.Cells(1, 5).Value = "Performance"
    
    ws.Cells(2, 1).Value = "John Smith"
    ws.Cells(2, 2).Value = "Marketing"
    ws.Cells(2, 3).Value = 50000
    ws.Cells(2, 4).Value = "1/15/2020"
    ws.Cells(2, 5).Value = "Good"
    
    ws.Cells(3, 1).Value = "Jane Doe"
    ws.Cells(3, 2).Value = "Engineering"
    ws.Cells(3, 3).Value = 75000
    ws.Cells(3, 4).Value = "3/1/2019"
    ws.Cells(3, 5).Value = "Excellent"
    
    ' Format currency column
    ws.Range("C2:C3").NumberFormat = "$#,##0.00"
    
    ' Format date column
    ws.Range("D2:D3").NumberFormat = "mm/dd/yyyy"
    
    ' Auto-fit columns
    ws.Columns("A:E").AutoFit
    
    ' Add border to all cells
    ws.Range("A1:E3").Borders.LineStyle = xlContinuous
    
    MsgBox "Sheet formatting complete!"
End Sub