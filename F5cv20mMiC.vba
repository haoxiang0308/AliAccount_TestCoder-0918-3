Attribute VB_Name = "FormatExcelSheet"
Sub FormatExcelSheet()
    ' This macro formats an Excel sheet with various formatting options
    
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format headers (row 1)
    With ws.Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(54, 96, 146) ' Dark blue background
        .Font.Color = RGB(255, 255, 255)   ' White text
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
    
    ' Format the first column as a special column (light gray background)
    With ws.Columns(1)
        .Interior.Color = RGB(217, 217, 217) ' Light gray
        .Font.Bold = True
    End With
    
    ' Format any cells with numbers to have 2 decimal places
    Dim cell As Range
    For Each cell In ws.UsedRange
        If IsNumeric(cell.Value) And cell.Value <> "" Then
            If cell.Value <> Int(cell.Value) Then
                cell.NumberFormat = "#,##0.00"
            Else
                cell.NumberFormat = "#,##0"
            End If
        End If
    Next cell
    
    ' Add a title to the sheet at A1
    ws.Range("A1").Value = "FORMATTED DATA"
    
    MsgBox "Excel sheet has been formatted successfully!", vbInformation
End Sub