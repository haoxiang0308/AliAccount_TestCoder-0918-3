# Filtered DataFrame saved to this file

import pandas as pd

data = {
    'Name': ['Bob', 'Charlie', 'Eve'],
    'Age': [30, 35, 32],
    'City': ['London', 'Paris', 'Sydney'],
    'Salary': [60000, 70000, 65000],
}

filtered_df = pd.DataFrame(data)
print('Filtered DataFrame:')
print(filtered_df)
