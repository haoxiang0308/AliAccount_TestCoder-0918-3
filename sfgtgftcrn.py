
import pandas as pd

# Sample data
data = {
    'Name': ['Bob', 'David'],
    'Age': [32, 47],
    'City': ['London', 'Tokyo'],
    'Salary': [65000, 80000]
}

filtered_df = pd.DataFrame(data)
print("Filtered DataFrame:")
print(filtered_df)
