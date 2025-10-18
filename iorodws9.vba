' VBA Macro to format an Excel sheet
Sub FormatExcelSheet()
    ' Declare variables
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format headers (row 1)
    With ws.Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(54, 95, 145) ' Blue background
        .Font.Color = RGB(255, 255, 255) ' White text
        .HorizontalAlignment = xlCenter
    End With
    
    ' Auto-fit columns
    ws.Columns.AutoFit
    
    ' Format alternating rows
    Dim i As Long
    For i = 2 To ws.UsedRange.Rows.Count
        If i Mod 2 = 0 Then
            ws.Rows(i).Interior.Color = RGB(242, 242, 242) ' Light gray
        End If
    Next i
    
    ' Add borders to used range
    With ws.UsedRange.Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
    End With
    
    ' Format date columns if any (assuming dates might be in columns with "date" in header)
    Dim col As Long
    For col = 1 To ws.UsedRange.Columns.Count
        If InStr(LCase(ws.Cells(1, col).Value), "date") > 0 Then
            ws.Columns(col).NumberFormat = "mm/dd/yyyy"
        End If
    Next col
    
    ' Adjust row height
    ws.Rows.RowHeight = 15
    
    MsgBox "Excel sheet formatting completed!", vbInformation
End Sub