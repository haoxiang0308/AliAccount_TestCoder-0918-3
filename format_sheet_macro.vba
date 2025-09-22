Sub FormatExcelSheet()

    ' Select the entire used range in the active sheet
    Dim rng As Range
    Set rng = ActiveSheet.UsedRange

    ' Apply basic formatting
    With rng
        ' Bold the header row (assuming first row is header)
        .Rows(1).Font.Bold = True
        .Rows(1).Interior.Color = RGB(200, 200, 200) ' Light gray background

        ' Add borders to all cells
        .Borders.LineStyle = xlContinuous
        .Borders.Weight = xlThin

        ' Auto-fit columns and rows for better appearance
        .Columns.AutoFit
        .Rows.AutoFit
    End With

    ' Notify user
    MsgBox "Sheet formatted successfully!", vbInformation

End Sub