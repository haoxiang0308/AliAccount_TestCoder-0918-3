Attribute VB_Name = "FormatExcelSheet"
Sub FormatExcelSheet()
    ' Format an Excel sheet with various formatting options
    
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format headers (Row 1)
    With ws.Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(54, 96, 146) ' Dark blue background
        .Font.Color = RGB(255, 255, 255)   ' White text
        .HorizontalAlignment = xlCenter
    End With
    
    ' Auto-fit column widths
    ws.Columns.AutoFit
    
    ' Format alternate rows
    Dim i As Long
    For i = 2 To ws.UsedRange.Rows.Count Step 2
        ws.Rows(i).Interior.Color = RGB(242, 242, 242) ' Light gray
    Next i
    
    ' Add borders to the used range
    With ws.UsedRange.Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
    End With
    
    ' Format date columns if any (assuming dates might be in columns with "date" in header)
    Dim col As Long
    For col = 1 To ws.UsedRange.Columns.Count
        If InStr(LCase(Cells(1, col).Value), "date") > 0 Then
            ws.Columns(col).NumberFormat = "mm/dd/yyyy"
        End If
    Next col
    
    ' Format currency columns if any (assuming currency might be in columns with "price", "cost", or "amount" in header)
    For col = 1 To ws.UsedRange.Columns.Count
        Dim headerText As String
        headerText = LCase(Cells(1, col).Value)
        If InStr(headerText, "price") > 0 Or InStr(headerText, "cost") > 0 Or InStr(headerText, "amount") > 0 Then
            ws.Columns(col).NumberFormat = "$#,##0.00"
        End If
    Next col
    
    MsgBox "Excel sheet formatting completed!", vbInformation
End Sub