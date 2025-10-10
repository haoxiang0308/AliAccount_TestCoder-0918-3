' VBA Macro to format an Excel sheet
Sub FormatExcelSheet()
    ' Set the worksheet object (change "Sheet1" to your sheet's name if needed)
    Dim ws As Worksheet
    Set ws = ActiveSheet ' Or use Worksheets("Sheet1")

    ' Format headers in row 1
    With ws.Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(79, 129, 189) ' Blue background
        .Font.Color = RGB(255, 255, 255)     ' White font
        .HorizontalAlignment = xlCenter
    End With

    ' Auto-fit all columns
    ws.Columns.AutoFit

    ' Format any cells with numbers in Currency format (example for column B)
    ' Uncomment the next lines if you want to format a specific column as currency
    ' ws.Columns("B:B").NumberFormat = "$#,##0.00"
    ' ws.Columns("B:B").HorizontalAlignment = xlRight

    ' Add borders to the used range
    ws.UsedRange.Borders.LineStyle = xlContinuous

    MsgBox "Formatting complete!"
End Sub