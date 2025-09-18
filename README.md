# Excel Sheet Formatter VBA Macro

This repository contains a VBA macro that formats Excel sheets with a professional appearance.

## Files

- `FormatExcelSheet.bas`: The VBA macro file
- `sample_data.csv`: Sample data to test the macro

## How to Use

1. Open Microsoft Excel
2. Create a new workbook
3. Import the sample data (Data > Get Data > From Text/CSV > Select sample_data.csv)
4. Press Alt + F11 to open the VBA editor
5. Insert a new module (Insert > Module)
6. Copy and paste the code from `FormatExcelSheet.bas` into the module
7. Close the VBA editor
8. Run the macro (Developer > Macros > FormatExcelSheet > Run)

## What the Macro Does

- Formats the header row with bold white text on a dark gray background
- Adds borders to all data cells
- Auto-fits all columns for better readability
- Centers the header text
- Aligns data to the left