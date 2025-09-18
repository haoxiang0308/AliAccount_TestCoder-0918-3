import xlwings as xw
import os

# Define paths
project_dir = '/workspace/vba_project'
vba_module_path = os.path.join(project_dir, 'FormatSheet.vba')
output_workbook_path = os.path.join(project_dir, 'FormattedSheet.xlsm')

# Ensure the VBA module file exists
if not os.path.exists(vba_module_path):
    raise FileNotFoundError(f"VBA module file not found at {vba_module_path}")

# Start Excel and create a new workbook
app = xw.App(visible=False) # Keep Excel hidden
wb = app.books.add()
ws = wb.sheets[0]

# Add some sample data for demonstration
ws.range('A1').value = ['Name', 'Age', 'City', 'Occupation', 'Status']
for i in range(2, 11):
    ws.range(f'A{i}').value = [f'Person {i-1}', 20+i, f'City {i-1}', f'Job {i-1}', 'Active']

# Insert the VBA module
wb_vba = wb.api.VBProject
module = wb_vba.VBComponents.Add(1) # 1 = vbext_ct_StdModule for a standard module
with open(vba_module_path, 'r') as f:
    vba_code = f.read()
module.CodeModule.AddFromString(vba_code)

# Save the workbook as macro-enabled
wb.save(output_workbook_path)

# Close workbook and quit Excel
wb.close()
app.quit()

print(f"Macro-enabled workbook saved to: {output_workbook_path}")