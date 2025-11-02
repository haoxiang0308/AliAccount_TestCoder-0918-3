' VBA Macro to format an Excel sheet
Sub FormatExcelSheet()
    ' Declare variables
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format headers (first row)
    With ws.Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(54, 95, 145) ' Blue background
        .Font.Color = RGB(255, 255, 255) ' White text
        .HorizontalAlignment = xlCenter
    End With
    
    ' Auto-fit column widths
    ws.Columns.AutoFit
    
    ' Add borders to used range
    With ws.UsedRange.Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = 1 ' Black
    End With
    
    ' Format numbers in the sheet
    Dim cell As Range
    For Each cell In ws.UsedRange
        If IsNumeric(cell.Value) And cell.Value <> "" Then
            ' Format numbers with 2 decimal places
            cell.NumberFormat = "#,##0.00"
        End If
    Next cell
    
    ' Apply alternating row colors
    Dim i As Integer
    For i = 2 To ws.UsedRange.Rows.Count Step 2
        ws.Rows(i).Interior.Color = RGB(240, 240, 240) ' Light gray
    Next i
    
    MsgBox "Excel sheet has been formatted successfully!", vbInformation
End Sub