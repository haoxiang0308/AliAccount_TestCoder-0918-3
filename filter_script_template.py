import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva'],
    'Age': [25, 30, 35, 40, 22],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney']
}
df = pd.DataFrame(data)

# Filter the DataFrame (example: Age > 26)
filtered_df = df[df['Age'] > 26]

# Generate a random filename
random_filename = 'filtered_data_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=6)) + '.py'

# Save the filtered DataFrame to the random .py file
with open(random_filename, 'w') as f:
    f.write("# Filtered DataFrame\n")
    f.write("filtered_data = ")
    f.write(filtered_df.to_string(index=False))

print(f"Filtered DataFrame saved to {random_filename}")