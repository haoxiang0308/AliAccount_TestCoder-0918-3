Sub FormatExcelSheet()
    ' Declare variables
    Dim ws As Worksheet
    Dim lastRow As Long
    Dim lastCol As Long
    
    ' Set the worksheet to the active sheet
    Set ws = ActiveSheet
    
    ' Find the last row and column with data
    lastRow = ws.Cells(ws.Rows.Count, 1).End(xlUp).Row
    lastCol = ws.Cells(1, ws.Columns.Count).End(xlToLeft).Column
    
    ' Format the header row (assuming first row is header)
    With ws.Range(ws.Cells(1, 1), ws.Cells(1, lastCol))
        .Font.Bold = True
        .Font.Color = RGB(255, 255, 255) ' White font color
        .Interior.Color = RGB(50, 50, 50) ' Dark gray background
        .HorizontalAlignment = xlCenter
    End With
    
    ' Format data cells
    With ws.Range(ws.Cells(2, 1), ws.Cells(lastRow, lastCol))
        .Borders.LineStyle = xlContinuous
        .Borders.Weight = xlThin
        .HorizontalAlignment = xlLeft
    End With
    
    ' Auto-fit columns
    ws.Columns.AutoFit
    
    ' Add a title in cell A1 (if there's space)
    If lastRow = 1 And lastCol = 1 And ws.Cells(1, 1).Value = "" Then
        ws.Cells(1, 1).Value = "Formatted Data"
        ws.Cells(1, 1).Font.Bold = True
        ws.Cells(1, 1).Font.Size = 14
    End If
    
    ' Notify user
    MsgBox "Sheet formatted successfully!", vbInformation
End Sub