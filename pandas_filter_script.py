import pandas as pd
import random
import string
import os

def create_sample_dataframe():
    """Create a sample DataFrame with some data"""
    data = {
        'Name': ['Alice', 'Bob', 'Charlie', 'Diana', 'Eve', 'Frank', 'Grace', 'Henry'],
        'Age': [25, 30, 35, 28, 32, 27, 31, 29],
        'City': ['New York', 'Los Angeles', 'Chicago', 'New York', 'Boston', 'Chicago', 'Los Angeles', 'Miami'],
        'Salary': [50000, 60000, 70000, 55000, 65000, 52000, 68000, 58000]
    }
    df = pd.DataFrame(data)
    return df

def filter_dataframe(df):
    """Filter the DataFrame based on some criteria"""
    # Filter for people older than 28 and salary greater than 55000
    filtered_df = df[(df['Age'] > 28) & (df['Salary'] > 55000)]
    return filtered_df

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    filename = f"filtered_data_{random_string}.py"
    return filename

def main():
    # Create sample DataFrame
    original_df = create_sample_dataframe()
    print("Original DataFrame:")
    print(original_df)
    print("\n" + "="*50 + "\n")
    
    # Filter the DataFrame
    filtered_df = filter_dataframe(original_df)
    print("Filtered DataFrame (Age > 28 and Salary > 55000):")
    print(filtered_df)
    print("\n" + "="*50 + "\n")
    
    # Generate a random filename
    random_filename = generate_random_filename()
    print(f"Saving filtered DataFrame to: {random_filename}")
    
    # Create the content for the new Python file
    file_content = f'''# This file was generated with filtered data
import pandas as pd

# Filtered DataFrame (Age > 28 and Salary > 55000):
filtered_data = {filtered_df.to_dict(orient='records')}

# Convert back to DataFrame
filtered_df = pd.DataFrame(filtered_data)

print("Filtered DataFrame loaded from this file:")
print(filtered_df)
'''
    
    # Write the content to the randomly named file
    with open(random_filename, 'w') as file:
        file.write(file_content)
    
    print(f"Successfully saved filtered DataFrame to {random_filename}")
    
    # Verify that the file was created
    if os.path.exists(random_filename):
        print(f"File {random_filename} successfully created!")
    else:
        print(f"Error: File {random_filename} was not created!")

if __name__ == "__main__":
    main()