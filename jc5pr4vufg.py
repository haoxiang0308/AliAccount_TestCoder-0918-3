import pandas as pd

# Sample data
data = {'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve'], 'Age': [25, 30, 35, 28, 22], 'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney']}
df = pd.DataFrame(data)

# Filter the DataFrame (age > 25)
filtered_df = df[df['Age'] > 25]

print("Filtered DataFrame:")
print(filtered_df)

# Optionally, save the filtered DataFrame to a CSV
# filtered_df.to_csv('filtered_data.csv', index=False)
