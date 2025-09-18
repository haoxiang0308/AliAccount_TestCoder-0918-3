import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva'],
    'Age': [25, 30, 35, 28, 32],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Berlin'],
    'Salary': [50000, 60000, 70000, 55000, 65000]
}
df = pd.DataFrame(data)

print("Original DataFrame:")
print(df)

# Filter the DataFrame (example: people older than 30 with salary > 55000)
filtered_df = df[(df['Age'] > 30) & (df['Salary'] > 55000)]

print("\nFiltered DataFrame (Age > 30 and Salary > 55000):")
print(filtered_df)

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Save the filtered DataFrame to the random .py file
with open(random_filename, 'w') as f:
    f.write("# Filtered DataFrame Results\n")
    f.write(f"filtered_data = {filtered_df.to_dict('records')}\n")
    f.write("print('Filtered data:', filtered_data)\n")

print(f"\nFiltered DataFrame saved to: {random_filename}")