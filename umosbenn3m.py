import pandas as pd

# Generated DataFrame filtering script
data = {'Name': ['Alice', 'Bob', 'Charlie', 'Diana', 'Eve'], 'Age': [25, 30, 35, 28, 32], 'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney'], 'Salary': [50000, 60000, 70000, 55000, 65000]}
df = pd.DataFrame(data)

# Filter: People older than 29
filtered_df = df[df['Age'] > 29]

print("Original DataFrame:")
print(df)
print("\nFiltered DataFrame (Age > 29):")
print(filtered_df)

# Save filtered DataFrame to CSV
filtered_df.to_csv('filtered_data.csv', index=False)
print("\nFiltered data saved to filtered_data.csv")
