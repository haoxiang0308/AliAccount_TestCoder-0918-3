# Filtered DataFrame
import pandas as pd

filtered_data = [{'Name': 'Bob', 'Age': 30, 'City': 'London'}, {'Name': 'Charlie', 'Age': 35, 'City': 'Paris'}, {'Name': 'David', 'Age': 40, 'City': 'Tokyo'}]
df = pd.DataFrame(filtered_data)
print(df)
