
import pandas as pd

# Filtered DataFrame
data = {'Name': ['Bob', 'David'], 'Age': [32, 47], 'City': ['London', 'Tokyo'], 'Salary': [85000, 120000]}

filtered_df = pd.DataFrame(data)
print("Filtered DataFrame from saved file:")
print(filtered_df)
