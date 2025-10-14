import pandas as pd
import random
import string

# Create a sample DataFrame for demonstration
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve'],
    'Age': [25, 30, 35, 40, 45],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney']
}
df = pd.DataFrame(data)

# Filter the DataFrame
filtered_df = df[df['Age'] > 30]

# Generate a random filename
random_filename = 'output_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'

# Save the filtered DataFrame to the randomly named file
with open(random_filename, 'w') as f:
    f.write("# Filtered DataFrame\n")
    f.write("filtered_data = " + filtered_df.to_string() + "\n")

print(f"Filtered DataFrame saved to {random_filename}")