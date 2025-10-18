# Filtered DataFrame saved to Python file

import pandas as pd

# Data from filtered DataFrame
filtered_data = [{'Name': 'Bob', 'Age': 30, 'City': 'London', 'Salary': 60000}, {'Name': 'Charlie', 'Age': 35, 'City': 'Paris', 'Salary': 70000}, {'Name': 'Eve', 'Age': 32, 'City': 'Sydney', 'Salary': 65000}, {'Name': 'Grace', 'Age': 31, 'City': 'Madrid', 'Salary': 68000}, {'Name': 'Henry', 'Age': 29, 'City': 'Rome', 'Salary': 58000}]

# Convert to DataFrame
filtered_df = pd.DataFrame(filtered_data)

print("Filtered DataFrame:")
print(filtered_df)
