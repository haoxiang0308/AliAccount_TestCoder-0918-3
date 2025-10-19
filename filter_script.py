import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva', 'Frank', 'Grace', 'Henry'],
    'Age': [25, 30, 35, 28, 22, 40, 33, 27],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney', 'Berlin', 'Madrid', 'Rome'],
    'Salary': [50000, 60000, 70000, 55000, 45000, 80000, 65000, 58000]
}

df = pd.DataFrame(data)

# Filter the DataFrame: people older than 28
filtered_df = df[df['Age'] > 28]

print("Original DataFrame:")
print(df)
print("\nFiltered DataFrame (Age > 28):")
print(filtered_df)

# Generate a random filename
random_filename = 'filtered_data_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'

# Save the filtered DataFrame to the randomly named file
with open(random_filename, 'w') as f:
    f.write("# Filtered DataFrame saved to this file\n\n")
    f.write("import pandas as pd\n\n")
    f.write("filtered_data = " + filtered_df.to_string() + "\n")
    f.write("print('Filtered data:')\n")
    f.write("print(filtered_data)\n")

print(f"\nFiltered DataFrame saved to {random_filename}")