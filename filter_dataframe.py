import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva', 'Frank', 'Grace', 'Henry'],
    'Age': [25, 32, 18, 47, 22, 35, 29, 53],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney', 'Berlin', 'Madrid', 'Rome'],
    'Salary': [50000, 60000, 45000, 80000, 55000, 70000, 52000, 90000]
}

df = pd.DataFrame(data)

# Filter the DataFrame - for example, people older than 30
filtered_df = df[df['Age'] > 30]

print("Original DataFrame:")
print(df)
print("\nFiltered DataFrame (Age > 30):")
print(filtered_df)

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Save the filtered DataFrame to the randomly named .py file
with open(random_filename, 'w') as f:
    f.write("# Filtered DataFrame saved to this file\n\n")
    f.write("import pandas as pd\n\n")
    f.write("filtered_data = ")
    f.write(filtered_df.to_string())
    f.write("\n\n# End of file\n")

print(f"\nFiltered DataFrame saved to {random_filename}")