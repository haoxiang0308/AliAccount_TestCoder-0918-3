import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva'],
    'Age': [25, 30, 35, 40, 22],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Berlin']
}
df = pd.DataFrame(data)

# Filter the DataFrame (e.g., Age > 25)
filtered_df = df[df['Age'] > 25]

# Generate a random filename
random_filename = 'filtered_data_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=6)) + '.py'

# Save the filtered DataFrame to the random .py file
with open(random_filename, 'w') as f:
    f.write(f"# Filtered DataFrame saved to {random_filename}\n")
    f.write("import pandas as pd\n\n")
    f.write(f"filtered_data = {filtered_df.to_dict(orient='records')}\n")
    f.write("df = pd.DataFrame(filtered_data)\n")
    f.write("print('Filtered DataFrame:', df)\n")

print(f"Script saved with filtered data to {random_filename}")