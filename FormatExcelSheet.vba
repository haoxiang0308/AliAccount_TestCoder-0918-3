Sub FormatExcelSheet()
    '
    ' FormatExcelSheet Macro
    ' This macro formats the active Excel sheet by applying bold headers, borders, and auto-fitting columns.
    '

    ' Apply bold formatting to the first row (headers)
    Rows("1:1").Select
    Selection.Font.Bold = True

    ' Select the used range on the sheet
    ActiveSheet.UsedRange.Select

    ' Apply borders to the selected range
    With Selection.Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = xlAutomatic
    End With

    ' Auto-fit all columns in the used range
    ActiveSheet.UsedRange.Columns.AutoFit

    ' Optional: Add a title row at the top
    Rows("1:1").Select
    Selection.Insert Shift:=xlDown, CopyOrigin:=xlFormatFromLeftOrAbove
    Range("A1").Select
    ActiveCell.FormulaR1C1 = "Formatted Report"
    Selection.Font.Bold = True
    Selection.Font.Size = 14
    Selection.Interior.ColorIndex = 35 ' Light yellow background

End Sub