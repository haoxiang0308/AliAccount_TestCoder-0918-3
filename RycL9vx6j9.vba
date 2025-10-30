Sub FormatExcelSheet()
    ' Format the active worksheet with common formatting options
    
    ' Set the worksheet to work with (current active sheet)
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format headers (first row)
    With ws.Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(79, 129, 189)  ' Blue background
        .Font.Color = RGB(255, 255, 255)     ' White text
        .HorizontalAlignment = xlCenter
    End With
    
    ' Auto-fit all columns
    ws.Columns.AutoFit
    
    ' Add borders to the used range
    With ws.UsedRange.Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = 1  ' Black color
    End With
    
    ' Format date columns (if any) - assuming possible date columns
    Dim cell As Range
    For Each cell In ws.UsedRange
        If IsDate(cell.Value) Then
            cell.NumberFormat = "mm/dd/yyyy"
        End If
    Next cell
    
    ' Format the first column as an example
    If ws.UsedRange.Columns.Count >= 1 Then
        ws.Columns(1).HorizontalAlignment = xlLeft
    End If
    
    ' Format numeric columns (add comma formatting for numbers)
    Dim col As Range
    For Each col In ws.UsedRange.Columns
        If col.Column > 1 Then  ' Skip first column if needed
            With col
                .Replace What:=" ", Replacement:="", LookAt:=xlPart, SearchOrder:=xlByRows
                If IsNumeric(WorksheetFunction.Substitute(.Value, ",", "")) Then
                    .NumberFormat = "#,##0.00"
                End If
            End With
        End If
    Next col
    
    MsgBox "Worksheet formatting completed!", vbInformation
End Sub