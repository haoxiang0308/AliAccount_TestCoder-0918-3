Sub FormatSheet()
    '
    ' FormatSheet Macro
    ' This macro formats the active sheet by setting column widths, row heights, and applying basic styles.
    '

    ' Set column widths
    Columns("A:A").ColumnWidth = 15
    Columns("B:B").ColumnWidth = 20
    Columns("C:C").ColumnWidth = 25

    ' Set row height for header
    Rows("1:1").RowHeight = 25

    ' Format header row
    With Rows("1:1")
        .Font.Bold = True
        .Interior.Color = RGB(200, 200, 200) ' Light grey background
        .HorizontalAlignment = xlCenter
    End With

    ' Auto-fit the rest of the data in the used range, if any
    ActiveSheet.UsedRange.Columns.AutoFit

End Sub