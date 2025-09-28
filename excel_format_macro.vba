Attribute VB_Name = "ExcelFormatMacro"
Sub FormatExcelSheet()
    '
    ' FormatExcelSheet Macro
    ' This macro formats the active Excel sheet with bold headers, borders, and auto-fit columns.
    '

    ' Set the header row (assuming row 1)
    Dim headerRange As Range
    Set headerRange = Rows(1)

    ' Format headers: Bold and background color
    With headerRange
        .Font.Bold = True
        .Interior.Color = RGB(200, 200, 200) ' Light grey background
        .HorizontalAlignment = xlCenter
    End With

    ' Add borders to the used range of the sheet
    With ActiveSheet.UsedRange.Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = 0 ' Black
    End With

    ' Auto-fit column widths
    Columns.AutoFit

    ' Optionally, freeze the top row
    With ActiveWindow
        .SplitRow = 1
        .FreezePanes = True
    End With

    MsgBox "Excel sheet formatting complete!"
End Sub