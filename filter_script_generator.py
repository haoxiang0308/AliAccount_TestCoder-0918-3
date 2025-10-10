import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva'],
    'Age': [25, 30, 35, 28, 22],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney']
}
df = pd.DataFrame(data)

# Filter the DataFrame (example: Age > 26)
filtered_df = df[df['Age'] > 26]

# Generate a random filename
random_filename = "filtered_data_" + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + ".py"

# Save the filtered DataFrame to the randomly named .py file
with open(random_filename, 'w') as f:
    f.write("# Filtered DataFrame\n")
    f.write("import pandas as pd\n\n")
    f.write(f"filtered_data = {filtered_df.to_dict(orient='records')}\n")
    f.write("df = pd.DataFrame(filtered_data)\n")

print(f"Filtered DataFrame saved to {random_filename}")
print(df)
