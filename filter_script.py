import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve'],
    'Age': [25, 30, 35, 40, 45],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney']
}
df = pd.DataFrame(data)

# Filter the DataFrame based on a condition (e.g., Age > 30)
filtered_df = df[df['Age'] > 30]

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Save the filtered DataFrame to the randomly named .py file
with open(random_filename, 'w') as f:
    f.write("# Filtered DataFrame\n")
    f.write("import pandas as pd\n\n")
    f.write("filtered_data = ")
    f.write(filtered_df.to_string(index=False))
    f.write("\n")

print(f"Filtered DataFrame saved to {random_filename}")
