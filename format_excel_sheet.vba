' VBA Macro to format an Excel sheet
Sub FormatExcelSheet()
    ' Declare variables
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format headers (first row)
    With ws.Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(51, 102, 255) ' Blue background
        .Font.Color = RGB(255, 255, 255) ' White text
        .HorizontalAlignment = xlCenter
    End With
    
    ' Auto-fit columns
    ws.Columns.AutoFit
    
    ' Format alternate rows
    Dim i As Integer
    For i = 2 To ws.UsedRange.Rows.Count Step 2
        ws.Rows(i).Interior.Color = RGB(240, 240, 240) ' Light gray
    Next i
    
    ' Add borders to the used range
    With ws.UsedRange.Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
    End With
    
    ' Format numbers in the sheet
    ws.UsedRange.NumberFormat = "General"
    
    ' Adjust row height
    ws.Rows.RowHeight = 18
    
    MsgBox "Excel sheet formatting completed successfully!"
End Sub