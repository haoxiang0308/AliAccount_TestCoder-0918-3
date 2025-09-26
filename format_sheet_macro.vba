Sub FormatExcelSheet()
    '
    ' FormatExcelSheet Macro
    ' This macro formats the active Excel sheet with a title, headers, and basic styling.
    '

    ' Set the title in cell A1 and merge cells A1 to D1
    Range("A1:D1").Select
    Selection.Merge
    Range("A1").Select
    Selection.Value = "Monthly Sales Report"
    Selection.Font.Bold = True
    Selection.Font.Size = 14
    Selection.HorizontalAlignment = xlCenter

    ' Set the headers in row 3
    Range("A3").Value = "Product"
    Range("B3").Value = "Q1 Sales"
    Range("C3").Value = "Q2 Sales"
    Range("D3").Value = "Total"

    ' Format the header row (row 3)
    Range("A3:D3").Select
    Selection.Font.Bold = True
    Selection.Interior.Color = RGB(200, 200, 200) ' Light gray background
    Selection.Borders.LineStyle = xlContinuous

    ' Auto-fit the columns
    Columns("A:D").Select
    Selection.Columns.AutoFit

    ' Format the numbers in the sales columns (B and C) as currency
    Range("B4:C100").Select ' Assuming data goes down to row 100
    Selection.NumberFormat = "$#,##0.00"

    ' Format the total column (D) as currency
    Range("D4:D100").Select
    Selection.NumberFormat = "$#,##0.00"

    ' Add borders to the data range
    Range("A3:D100").Select
    Selection.Borders.LineStyle = xlContinuous

    ' Return selection to A1
    Range("A1").Select

End Sub