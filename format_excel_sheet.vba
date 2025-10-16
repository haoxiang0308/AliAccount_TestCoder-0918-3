' VBA Macro to format an Excel sheet
Sub FormatExcelSheet()
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format headers (Row 1)
    With ws.Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(55, 96, 140) ' Blue background
        .Font.Color = RGB(255, 255, 255) ' White text
        .HorizontalAlignment = xlCenter
    End With
    
    ' Auto-fit columns
    ws.Columns.AutoFit
    
    ' Add borders to the used range
    With ws.UsedRange.Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = 1 ' Black
    End With
    
    ' Format date columns (if any) - assuming dates might be in columns with headers containing "Date"
    Dim cell As Range
    For Each cell In ws.Rows(1).UsedRange
        If InStr(LCase(cell.Value), "date") > 0 Then
            ws.Columns(cell.Column).NumberFormat = "mm/dd/yyyy"
        End If
    Next cell
    
    ' Format numeric columns (if any) - assuming numbers in columns with headers containing "Amount", "Price", "Cost", etc.
    For Each cell In ws.Rows(1).UsedRange
        If InStr(LCase(cell.Value), "amount") > 0 Or _
           InStr(LCase(cell.Value), "price") > 0 Or _
           InStr(LCase(cell.Value), "cost") > 0 Or _
           InStr(LCase(cell.Value), "total") > 0 Then
            ws.Columns(cell.Column).NumberFormat = "#,##0.00"
        End If
    Next cell
    
    MsgBox "Excel sheet formatting completed!", vbInformation
End Sub