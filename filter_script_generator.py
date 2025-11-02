import pandas as pd
import random
import string
import os

def generate_random_filename(extension='.py'):
    """Generate a random filename with the given extension."""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}{extension}"

def create_filter_script():
    """Create a script that filters a DataFrame and save it with a random name."""
    # Sample DataFrame
    data = {
        'Name': ['Alice', 'Bob', 'Charlie', 'Diana', 'Eve'],
        'Age': [25, 30, 35, 28, 32],
        'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney'],
        'Salary': [50000, 60000, 70000, 55000, 65000]
    }
    
    df = pd.DataFrame(data)
    
    # Example filtering: People older than 29
    filtered_df = df[df['Age'] > 29]
    
    # Create the content for the new script
    script_content = f'''import pandas as pd

# Generated DataFrame filtering script
data = {data}
df = pd.DataFrame(data)

# Filter: People older than 29
filtered_df = df[df['Age'] > 29]

print("Original DataFrame:")
print(df)
print("\\nFiltered DataFrame (Age > 29):")
print(filtered_df)

# Save filtered DataFrame to CSV
filtered_df.to_csv('filtered_data.csv', index=False)
print("\\nFiltered data saved to filtered_data.csv")
'''
    
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Write the script to the randomly named file
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Filtering script created: {random_filename}")
    print("The script contains a DataFrame filter operation and saves the result.")
    
    return random_filename

if __name__ == "__main__":
    created_file = create_filter_script()
    
    # Optionally, execute the generated script to demonstrate it works
    print(f"\nExecuting the generated script: {created_file}")
    exec(open(created_file).read())