import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve', 'Frank', 'Grace', 'Henry'],
    'Age': [25, 30, 35, 28, 32, 27, 31, 29],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney', 'Berlin', 'Rome', 'Madrid'],
    'Salary': [50000, 60000, 70000, 55000, 65000, 52000, 68000, 58000]
}

df = pd.DataFrame(data)

print("Original DataFrame:")
print(df)
print()

# Filter the DataFrame (for example, people older than 29)
filtered_df = df[df['Age'] > 29]

print("Filtered DataFrame (Age > 29):")
print(filtered_df)
print()

# Generate a random filename
random_filename = 'filtered_data_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'

# Save the filtered DataFrame to the randomly named .py file
with open(random_filename, 'w') as f:
    f.write("# Filtered DataFrame saved to this file\n\n")
    f.write("import pandas as pd\n\n")
    f.write("# Data as a dictionary\n")
    f.write(f"filtered_data = {filtered_df.to_dict('records')}\n\n")
    f.write("# Convert to DataFrame\n")
    f.write("df_filtered = pd.DataFrame(filtered_data)\n\n")
    f.write("print('Filtered DataFrame:')\n")
    f.write("print(df_filtered)\n")

print(f"Filtered DataFrame saved to '{random_filename}'")