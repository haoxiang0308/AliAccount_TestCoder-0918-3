Sub FormatExcelSheet()
    ' Declare variables
    Dim ws As Worksheet
    Set ws = ActiveSheet ' You can change this to reference a specific sheet

    ' Format headers in row 1
    With ws.Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(200, 200, 200) ' Light grey background
        .HorizontalAlignment = xlCenter
    End With

    ' Auto-fit all columns
    ws.Columns.AutoFit

    ' Format the first column (A) as text
    ws.Columns(1).NumberFormat = "@"

    ' Add borders to the used range
    ws.UsedRange.Borders.LineStyle = xlContinuous
    ws.UsedRange.Borders.Weight = xlThin

    ' Format any cell containing "Total" in bold
    Dim cell As Range
    For Each cell In ws.UsedRange
        If InStr(UCase(cell.Value), "TOTAL") > 0 Then
            cell.Font.Bold = True
        End If
    Next cell

    MsgBox "Formatting Complete!"
End Sub