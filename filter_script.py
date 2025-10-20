import pandas as pd
import random
import string
import os

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'Diana', 'Eve', 'Frank'],
    'Age': [25, 30, 35, 28, 32, 27],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney', 'Berlin'],
    'Salary': [50000, 60000, 70000, 55000, 65000, 58000]
}

df = pd.DataFrame(data)

print("Original DataFrame:")
print(df)
print("\n")

# Filter the DataFrame (for example, people older than 29)
filtered_df = df[df['Age'] > 29]

print("Filtered DataFrame (Age > 29):")
print(filtered_df)
print("\n")

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Save the filtered DataFrame to the randomly named .py file
with open(random_filename, 'w') as f:
    f.write("# Filtered DataFrame saved to this file\n\n")
    f.write("import pandas as pd\n\n")
    f.write("data = {\n")
    for col in filtered_df.columns:
        f.write(f"    '{col}': {filtered_df[col].tolist()},\n")
    f.write("}\n\n")
    f.write("filtered_df = pd.DataFrame(data)\n")
    f.write("print('Filtered DataFrame:')\n")
    f.write("print(filtered_df)\n")

print(f"Filtered DataFrame saved to {random_filename}")