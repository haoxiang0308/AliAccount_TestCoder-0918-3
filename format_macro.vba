Sub FormatExcelSheet()
    '
    ' FormatExcelSheet Macro
    ' This macro formats the active Excel sheet by applying bold headers, borders, and auto-fitting columns.
    '

    ' Apply bold formatting to the first row (headers)
    Rows("1:1").Select
    Selection.Font.Bold = True

    ' Add borders to the used range of the sheet
    Cells.Select
    Selection.Borders.LineStyle = xlContinuous
    Selection.Borders.Weight = xlThin

    ' Auto-fit all columns to the data
    Cells.EntireColumn.AutoFit

    ' Optional: Set the width of column A to 20
    Columns("A:A").ColumnWidth = 20

    ' Optional: Format the first cell (A1) with a background color
    Range("A1").Select
    With Selection.Interior
        .Pattern = xlSolid
        .PatternColorIndex = xlAutomatic
        .Color = 12632256 ' Light grey
        .TintAndShade = 0
        .PatternTintAndShade = 0
    End With

    MsgBox "Excel sheet formatted successfully!", vbInformation
End Sub