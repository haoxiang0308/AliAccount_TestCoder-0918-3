Attribute VB_Name = "FormatExcelSheet"
Sub FormatExcelSheet()
    ' Format the active worksheet with common formatting options
    
    ' Set headers row formatting
    With Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(79, 129, 189) ' Blue background
        .Font.Color = RGB(255, 255, 255) ' White text
        .HorizontalAlignment = xlCenter
    End With
    
    ' Auto-fit all columns
    Columns.AutoFit
    
    ' Format the first column as a special identifier column
    Columns(1).Font.Bold = True
    Columns(1).Interior.Color = RGB(217, 225, 242) ' Light blue
    
    ' Add borders to the used range
    With ActiveSheet.UsedRange.Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = 1 ' Black
    End With
    
    ' Format any numeric columns to have number formatting
    Dim cell As Range
    For Each cell In ActiveSheet.UsedRange
        If IsNumeric(cell.Value) And cell.Value <> "" Then
            cell.NumberFormat = "#,##0.00"
        End If
    Next cell
    
    MsgBox "Worksheet formatting completed!", vbInformation
End Sub