import pandas as pd

# Create sample DataFrame
data = {
    'name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve'],
    'age': [25, 30, 35, 28, 22],
    'city': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney'],
    'salary': [50000, 60000, 70000, 55000, 45000]
}
df = pd.DataFrame(data)

# Filter the DataFrame (e.g., age > 25)
filtered_df = df[df['age'] > 25]

print('Original DataFrame:')
print(df)
print()
print('Filtered DataFrame (age > 25):')
print(filtered_df)

# Optionally, save to CSV
filtered_df.to_csv('filtered_data.csv', index=False)
print('Filtered data saved to filtered_data.csv')
