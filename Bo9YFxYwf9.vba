Sub FormatExcelSheet()
    ' Declare variables
    Dim ws As Worksheet
    Dim lastRow As Long
    Dim lastCol As Long
    Dim rng As Range
    
    ' Set the worksheet to the active sheet
    Set ws = ActiveSheet
    
    ' Find the last row and column with data
    lastRow = ws.Cells(ws.Rows.Count, 1).End(xlUp).Row
    lastCol = ws.Cells(1, ws.Columns.Count).End(xlToLeft).Column
    
    ' Define the range to format (assuming data starts at A1)
    Set rng = ws.Range(ws.Cells(1, 1), ws.Cells(lastRow, lastCol))
    
    ' Apply basic formatting
    With rng
        ' Auto-fit rows and columns
        ws.Rows.AutoFit
        ws.Columns.AutoFit
        
        ' Add a simple border around the entire range
        .Borders.LineStyle = xlContinuous
        .Borders.Weight = xlThin
        
        ' Format the header row (assuming first row is header)
        .Rows(1).Font.Bold = True
        .Rows(1).Interior.Color = RGB(200, 200, 200) ' Light gray background
        
        ' Center align all cells
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlCenter
    End With
    
    ' Notify user
    MsgBox "Sheet formatted successfully!", vbInformation
End Sub