import pandas as pd
import random
import string

def generate_random_filename():
    """Generates a random filename with a .py extension."""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.py"

def create_and_filter_data():
    """Creates a sample DataFrame, filters it, and saves the script to a random .py file."""
    # Create a sample DataFrame
    data = {
        'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve'],
        'Age': [25, 30, 35, 28, 22],
        'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney']
    }
    df = pd.DataFrame(data)

    # Filter the DataFrame (example: age > 25)
    filtered_df = df[df['Age'] > 25]

    # Generate a random filename
    filename = generate_random_filename()

    # Create the script content that would perform the filtering
    script_content = f'''import pandas as pd

# Sample data
data = {data}
df = pd.DataFrame(data)

# Filter the DataFrame (age > 25)
filtered_df = df[df['Age'] > 25]

print("Filtered DataFrame:")
print(filtered_df)

# Optionally, save the filtered DataFrame to a CSV
# filtered_df.to_csv('filtered_data.csv', index=False)
'''

    # Write the script content to the randomly named file
    with open(filename, 'w') as f:
        f.write(script_content)

    print(f"Python script generated and saved as '{filename}'")
    print("\nGenerated script content:")
    print(script_content)

if __name__ == "__main__":
    create_and_filter_data()
