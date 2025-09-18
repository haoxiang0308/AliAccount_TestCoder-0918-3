# VBA Project

This directory contains files related to creating and importing a VBA macro for formatting an Excel sheet.

## Files

- `FormatSheet.vba`: The VBA macro code.
- `FormatSheet.bas`: A copy of the VBA code in .bas format, suitable for importing into an Excel workbook's VBA project.
- `import_macro.vbs`: A VBScript file that demonstrates how to automate Excel to import the `FormatSheet.bas` module and save a macro-enabled workbook. This script is intended for Windows systems with Excel installed.
- `create_excel_with_macro.py`: A Python script using `xlwings` (conceptual, won't run in this Linux environment) to achieve the same goal as the VBScript.

## How to use on Windows

1. Ensure Excel is installed.
2. Modify the `projectDir` variable in `import_macro.vbs` to point to the directory containing `FormatSheet.bas`.
3. Run the `import_macro.vbs` script using `cscript import_macro.vbs` or by double-clicking it in Windows Explorer.
4. The script will create `FormattedSheet.xlsm` in the specified directory.
5. Open `FormattedSheet.xlsm` in Excel.
6. Press `Alt + F8`, select `FormatSheet`, and click "Run" to execute the macro and format the sheet.