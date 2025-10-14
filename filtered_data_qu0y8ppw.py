import pandas as pd

# Filtered DataFrame based on condition (e.g., Age > 26)
data = [{'Name': 'Bob', 'Age': 30, 'City': 'London'}, {'Name': 'Charlie', 'Age': 35, 'City': 'Paris'}, {'Name': 'David', 'Age': 28, 'City': 'Tokyo'}]
filtered_df = pd.DataFrame(data)

# The filtered DataFrame is stored in the variable 'filtered_df'
print(filtered_df)
