import pandas as pd

# Filtered DataFrame
data = [{'name': 'Alice', 'age': 25, 'city': 'New York'}, {'name': 'Bob', 'age': 32, 'city': 'London'}, {'name': 'David', 'age': 47, 'city': 'Tokyo'}, {'name': 'Eve', 'age': 22, 'city': 'Berlin'}]
df = pd.DataFrame(data)
print(df)
