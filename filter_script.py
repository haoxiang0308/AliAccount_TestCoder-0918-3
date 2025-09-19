import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve'],
    'age': [25, 32, 18, 47, 22],
    'city': ['New York', 'London', 'Paris', 'Tokyo', 'Berlin']
}
df = pd.DataFrame(data)

# Filter the DataFrame (e.g., people older than 21)
filtered_df = df[df['age'] > 21]

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase, k=10)) + '.py'

# Save the filtered DataFrame to the random .py file as Python code
with open(random_filename, 'w') as f:
    f.write("import pandas as pd\n\n")
    f.write("# Filtered DataFrame\n")
    f.write("data = " + filtered_df.to_dict('records').__repr__() + "\n")
    f.write("df = pd.DataFrame(data)\n")
    f.write("print(df)\n")

print(f"Filtered DataFrame saved to {random_filename}")
print(filtered_df)