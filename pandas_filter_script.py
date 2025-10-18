import pandas as pd
import random
import string
import os

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'Diana', 'Eve', 'Frank', 'Grace', 'Henry'],
    'Age': [25, 30, 35, 28, 32, 27, 31, 29],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney', 'Berlin', 'Madrid', 'Rome'],
    'Salary': [50000, 60000, 70000, 55000, 65000, 52000, 68000, 58000]
}
df = pd.DataFrame(data)

print("Original DataFrame:")
print(df)

# Filter the DataFrame: People older than 28 and salary greater than 55000
filtered_df = df[(df['Age'] > 28) & (df['Salary'] > 55000)]

print("\nFiltered DataFrame (Age > 28 and Salary > 55000):")
print(filtered_df)

# Generate a random filename for the .py file
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Save the filtered DataFrame to the randomly named .py file
with open(random_filename, 'w') as f:
    f.write('# Filtered DataFrame saved to Python file\n\n')
    f.write('import pandas as pd\n\n')
    f.write('# Data from filtered DataFrame\n')
    f.write(f'filtered_data = {filtered_df.to_dict(orient="records")}\n\n')
    f.write('# Convert to DataFrame\n')
    f.write('filtered_df = pd.DataFrame(filtered_data)\n\n')
    f.write('print("Filtered DataFrame:")\n')
    f.write('print(filtered_df)\n')

print(f"\nFiltered DataFrame saved to {random_filename}")

# List the file to confirm it was created
print("\nFiles in current directory:")
for file in os.listdir('.'):
    if file.endswith('.py') and len(file) == 13:  # Our random filename + .py extension
        print(f"  - {file}")