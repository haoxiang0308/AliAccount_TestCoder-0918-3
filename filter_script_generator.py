import pandas as pd
import random
import string

def generate_random_filename(length=8, prefix="filtered_data_", suffix=".py"):
    """Generates a random filename."""
    random_string = ''.join(random.choice(string.ascii_lowercase + string.digits) for _ in range(length))
    return f"{prefix}{random_string}{suffix}"

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve'],
    'Age': [25, 30, 35, 28, 22],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney']
}
df = pd.DataFrame(data)

# Filter the DataFrame (e.g., Age > 26)
filtered_df = df[df['Age'] > 26]

# Generate a random filename
random_filename = generate_random_filename()

# Save the filtered DataFrame to the randomly named Python file
# This saves the DataFrame object itself, which is likely not the desired outcome based on the prompt.
# Saving the script that created it is more likely the intent.
script_content = f'''import pandas as pd

# Filtered DataFrame based on condition (e.g., Age > 26)
data = {filtered_df.to_dict(orient="records")}
filtered_df = pd.DataFrame(data)

# The filtered DataFrame is stored in the variable 'filtered_df'
print(filtered_df)
'''

with open(random_filename, 'w') as f:
    f.write(script_content)

print(f"Script containing filtered data has been saved to: {random_filename}")
