Sub FormatReportSheet()
    ' Declare variables
    Dim ws As Worksheet
    Set ws = ActiveSheet ' Or specify a sheet, e.g., Worksheets("Report")

    ' Format the header row (Row 1)
    With ws.Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(0, 100, 200) ' Blue background
        .Font.Color = RGB(255, 255, 255)   ' White text
        .HorizontalAlignment = xlCenter
    End With

    ' Auto-fit all columns
    ws.Columns.AutoFit

    ' Add borders to the used range
    ws.UsedRange.Borders.LineStyle = xlContinuous

    ' Format the last column (e.g., Total) with a different color
    Dim lastCol As Long
    lastCol = ws.Cells(1, Columns.Count).End(xlToLeft).Column
    ws.Columns(lastCol).Interior.Color = RGB(200, 200, 200) ' Light grey

    MsgBox "Formatting Complete!"
End Sub