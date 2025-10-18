import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva', 'Frank', 'Grace', 'Henry'],
    'Age': [25, 30, 35, 28, 22, 33, 27, 31],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney', 'Berlin', 'Madrid', 'Rome'],
    'Salary': [50000, 60000, 70000, 55000, 45000, 65000, 52000, 68000]
}

df = pd.DataFrame(data)

# Filter the DataFrame: people older than 27
filtered_df = df[df['Age'] > 27]

print("Original DataFrame:")
print(df)
print("\nFiltered DataFrame (Age > 27):")
print(filtered_df)

# Generate a random filename
random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
random_filename = f"{random_name}.py"

# Save the filtered DataFrame to the randomly named .py file
with open(random_filename, 'w') as f:
    f.write("# Filtered DataFrame saved to this file\n")
    f.write("import pandas as pd\n\n")
    f.write("data = ")
    f.write(filtered_df.to_json(orient='records', indent=2))
    f.write("\n\nfiltered_data = pd.DataFrame(data)\n")
    f.write("print('Filtered data loaded from file')\n")
    f.write("print(filtered_data)\n")

print(f"\nFiltered DataFrame saved to {random_filename}")