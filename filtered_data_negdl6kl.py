# Filtered DataFrame saved to this file
import pandas as pd

# Data as dictionary
filtered_data = [{'Name': 'Bob', 'Age': 30, 'City': 'London', 'Salary': 60000}, {'Name': 'Charlie', 'Age': 35, 'City': 'Paris', 'Salary': 70000}, {'Name': 'Frank', 'Age': 40, 'City': 'Berlin', 'Salary': 80000}, {'Name': 'Grace', 'Age': 33, 'City': 'Madrid', 'Salary': 65000}, {'Name': 'Henry', 'Age': 29, 'City': 'Rome', 'Salary': 58000}]

# Convert to DataFrame
df_filtered = pd.DataFrame(filtered_data)

print('Filtered DataFrame:')
print(df_filtered)
