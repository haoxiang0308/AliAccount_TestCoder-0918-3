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

# Filter the DataFrame (e.g., Age > 26)
filtered_df = df[df['Age'] > 26]

# Generate a random filename
random_filename = 'filtered_data_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.csv'

# Save the filtered DataFrame to the random filename
filtered_df.to_csv(random_filename, index=False)

print(f"Filtered DataFrame saved to {random_filename}")
print(filtered_df)
