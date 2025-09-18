import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve'],
    'Age': [25, 32, 18, 47, 22],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Berlin'],
    'Salary': [50000, 65000, 40000, 80000, 55000]
}

df = pd.DataFrame(data)
print("Original DataFrame:")
print(df)

# Filter the DataFrame (example: people older than 25)
filtered_df = df[df['Age'] > 25]
print("\nFiltered DataFrame (Age > 25):")
print(filtered_df)

# Generate a random filename
def generate_random_filename(length=10):
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for i in range(length))
    return random_name + '.py'

# Generate and print the random filename
filename = generate_random_filename()
print(f"\nRandom filename generated: {filename}")

# Save the filtered DataFrame to the random file
# For this example, we'll just save the code that creates the filtered DataFrame
code_content = f"""
import pandas as pd

# Sample data
data = {{
    'Name': {filtered_df['Name'].tolist()},
    'Age': {filtered_df['Age'].tolist()},
    'City': {filtered_df['City'].tolist()},
    'Salary': {filtered_df['Salary'].tolist()}
}}

filtered_df = pd.DataFrame(data)
print("Filtered DataFrame:")
print(filtered_df)
"""

with open(filename, 'w') as file:
    file.write(code_content)

print(f"Filtered DataFrame saved to {filename}")