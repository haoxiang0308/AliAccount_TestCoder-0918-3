' VBA Macro to format an Excel sheet
Sub FormatExcelSheet()
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format headers (row 1)
    With ws.Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(55, 96, 146) ' Blue background
        .Font.Color = RGB(255, 255, 255)   ' White text
        .HorizontalAlignment = xlCenter
    End With
    
    ' Auto-fit all columns
    ws.Columns.AutoFit
    
    ' Format alternate rows
    Dim lastRow As Long
    Dim i As Long
    lastRow = ws.Cells(ws.Rows.Count, 1).End(xlUp).Row
    
    For i = 2 To lastRow Step 2
        ws.Rows(i).Interior.Color = RGB(242, 242, 242) ' Light gray for alternate rows
    Next i
    
    ' Add borders to the used range
    ws.UsedRange.Borders.LineStyle = xlContinuous
    ws.UsedRange.Borders.Weight = xlThin
    
    ' Format date columns (assuming column with dates is column C)
    On Error Resume Next
    ws.Columns("C:C").NumberFormat = "mm/dd/yyyy"
    On Error GoTo 0
    
    MsgBox "Excel sheet formatting completed!", vbInformation
End Sub