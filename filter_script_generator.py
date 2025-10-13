import pandas as pd
import random
import string

def generate_random_filename(length=10, extension=".py"):
    """Generates a random filename."""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(length)) + extension

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve'],
    'Age': [25, 30, 35, 40, 22],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney']
}
df = pd.DataFrame(data)

# Filter the DataFrame (example: filter for Age > 25)
filtered_df = df[df['Age'] > 25]

# Generate a random filename
random_filename = generate_random_filename()

# Save the filtered DataFrame to the randomly named Python file
with open(random_filename, 'w') as f:
    f.write("# Filtered DataFrame\n")
    f.write("import pandas as pd\n\n")
    f.write(f"filtered_data = {filtered_df.to_dict(orient='records')}\n")
    f.write("df = pd.DataFrame(filtered_data)\n")
    f.write("print(df)\n")

print(f"Filtered DataFrame saved to {random_filename}")