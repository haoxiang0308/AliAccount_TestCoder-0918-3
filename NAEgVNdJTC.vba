' VBA Macro to format an Excel sheet
Sub FormatExcelSheet()
    ' Format headers
    With Range("A1:Z1")
        .Font.Bold = True
        .Interior.Color = RGB(51, 102, 255) ' Blue background
        .Font.Color = RGB(255, 255, 255) ' White text
        .HorizontalAlignment = xlCenter
    End With
    
    ' Auto-fit columns
    Columns("A:Z").AutoFit
    
    ' Add borders
    With Range("A1").CurrentRegion.Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = 1 ' Black
    End With
    
    ' Format date columns if they exist
    Dim cell As Range
    For Each cell In Range("A1:Z1")
        If InStr(LCase(cell.Value), "date") > 0 Then
            Columns(cell.Column).NumberFormat = "mm/dd/yyyy"
        End If
    Next cell
    
    ' Apply alternating row colors
    Dim lastRow As Long
    Dim lastCol As Long
    lastRow = Cells(Rows.Count, 1).End(xlUp).Row
    lastCol = Cells(1, Columns.Count).End(xlToLeft).Column
    
    Dim i As Long
    For i = 2 To lastRow
        If i Mod 2 = 0 Then
            Range(Cells(i, 1), Cells(i, lastCol)).Interior.Color = RGB(240, 240, 240) ' Light gray
        End If
    Next i
    
    MsgBox "Excel sheet formatting completed!", vbInformation
End Sub