Sub FormatSheet()
    ' Disable screen updating for faster macro execution
    Application.ScreenUpdating = False

    ' Format headers in row 1
    With Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(200, 200, 200) ' Light gray background
        .HorizontalAlignment = xlCenter
    End With

    ' Auto-fit all columns
    Columns.AutoFit

    ' Format the first column as text (e.g., for ID or labels)
    Columns(1).NumberFormat = "@"

    ' Add borders to the used range
    Dim ws As Worksheet
    Set ws = ActiveSheet
    With ws.UsedRange.Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = 1 ' Black
    End With

    ' Re-enable screen updating
    Application.ScreenUpdating = True

    MsgBox "Worksheet formatting complete!"
End Sub