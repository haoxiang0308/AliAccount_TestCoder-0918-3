# This file was generated with filtered data
import pandas as pd

# Filtered DataFrame (Age > 28 and Salary > 55000):
filtered_data = [{'Name': 'Bob', 'Age': 30, 'City': 'Los Angeles', 'Salary': 60000}, {'Name': 'Charlie', 'Age': 35, 'City': 'Chicago', 'Salary': 70000}, {'Name': 'Eve', 'Age': 32, 'City': 'Boston', 'Salary': 65000}, {'Name': 'Grace', 'Age': 31, 'City': 'Los Angeles', 'Salary': 68000}, {'Name': 'Henry', 'Age': 29, 'City': 'Miami', 'Salary': 58000}]

# Convert back to DataFrame
filtered_df = pd.DataFrame(filtered_data)

print("Filtered DataFrame loaded from this file:")
print(filtered_df)
