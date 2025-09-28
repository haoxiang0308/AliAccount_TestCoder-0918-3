import pandas as pd

# Filtered DataFrame saved by script: {random_filename}

data = {'Name': ['Alice', 'Bob', 'Charlie', 'David'],
        'Age': [25, 30, 35, 40],
        'City': ['New York', 'London', 'Paris', 'Tokyo']}
df = pd.DataFrame(data)

filtered_df = df[df['Age'] > 30]
print('Filtered DataFrame from {random_filename}:')
print(filtered_df)

# Save to CSV
filtered_df.to_csv('output_from_{random_filename[:-3]}.csv', index=False)
print(f'Saved to output_from_{random_filename[:-3]}.csv')
