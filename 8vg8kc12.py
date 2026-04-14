#!/usr/bin/env python3
"""
Filtered DataFrame - Generated automatically
"""

import pandas as pd

# Filtered DataFrame data
data = {'Name': {2: 'Charlie', 3: 'David', 5: 'Frank'}, 'Age': {2: 35, 3: 40, 5: 32}, 'City': {2: 'Chicago', 3: 'Houston', 5: 'Seattle'}, 'Salary': {2: 75000, 3: 80000, 5: 65000}}

df_filtered = pd.DataFrame(data)

print("Filtered DataFrame:")
print(df_filtered)
print(f"\nShape: {df_filtered.shape}")
