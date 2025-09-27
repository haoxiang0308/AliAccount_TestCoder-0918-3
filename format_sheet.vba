Sub FormatSheet()
    '
    ' FormatSheet Macro
    ' Formats the active sheet with bold headers, borders, and auto-fit columns.
    '

    '
    ' Select the range A1 to the last used cell
    Dim ws As Worksheet
    Set ws = ActiveSheet
    Dim rng As Range
    Set rng = ws.Range("A1", ws.Cells(ws.Rows.Count, "A").End(xlUp).Offset(0, ws.Columns.Count - 1).End(xlToLeft))

    '
    ' Format headers (first row of the range)
    With rng.Rows(1).Font
        .Bold = True
        .Size = 12
    End With

    '
    ' Add borders to the entire range
    With rng.Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
    End With

    '
    ' Auto-fit columns
    rng.Columns.AutoFit

End Sub