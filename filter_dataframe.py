#!/usr/bin/env python3
"""
Script to filter a DataFrame using Pandas and save it to a randomly named .py file.
"""

import pandas as pd
import random
import string


def generate_random_filename(length=8):
    """Generate a random filename with .py extension."""
    characters = string.ascii_lowercase + string.digits
    random_name = ''.join(random.choice(characters) for _ in range(length))
    return f"{random_name}.py"


def filter_dataframe(df, column, condition, value):
    """
    Filter a DataFrame based on a condition.
    
    Args:
        df: pandas DataFrame to filter
        column: column name to apply the condition on
        condition: comparison operator ('==', '!=', '>', '<', '>=', '<=', 'contains')
        value: value to compare against
    
    Returns:
        Filtered DataFrame
    """
    if condition == 'contains':
        filtered_df = df[df[column].astype(str).str.contains(value, na=False)]
    elif condition == '==':
        filtered_df = df[df[column] == value]
    elif condition == '!=':
        filtered_df = df[df[column] != value]
    elif condition == '>':
        filtered_df = df[df[column] > value]
    elif condition == '<':
        filtered_df = df[df[column] < value]
    elif condition == '>=':
        filtered_df = df[df[column] >= value]
    elif condition == '<=':
        filtered_df = df[df[column] <= value]
    else:
        raise ValueError(f"Unsupported condition: {condition}")
    
    return filtered_df


def save_to_random_py_file(df, output_dir="."):
    """
    Save the DataFrame filtering script to a randomly named .py file.
    
    Args:
        df: The filtered DataFrame
        output_dir: Directory to save the file (default: current directory)
    
    Returns:
        Path to the saved file
    """
    import os
    
    filename = generate_random_filename()
    filepath = os.path.join(output_dir, filename)
    
    # Create the content of the .py file
    content = f'''#!/usr/bin/env python3
"""
Filtered DataFrame - Generated automatically
"""

import pandas as pd

# Filtered DataFrame data
data = {df.to_dict()}

df_filtered = pd.DataFrame(data)

print("Filtered DataFrame:")
print(df_filtered)
print(f"\\nShape: {{df_filtered.shape}}")
'''
    
    with open(filepath, 'w') as f:
        f.write(content)
    
    return filepath


def main():
    # Create a sample DataFrame
    data = {
        'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve', 'Frank'],
        'Age': [25, 30, 35, 40, 28, 32],
        'City': ['New York', 'Los Angeles', 'Chicago', 'Houston', 'Phoenix', 'Seattle'],
        'Salary': [50000, 60000, 75000, 80000, 55000, 65000]
    }
    
    df = pd.DataFrame(data)
    
    print("Original DataFrame:")
    print(df)
    print()
    
    # Filter the DataFrame (example: Age > 30)
    filtered_df = filter_dataframe(df, 'Age', '>', 30)
    
    print("Filtered DataFrame (Age > 30):")
    print(filtered_df)
    print()
    
    # Save to a randomly named .py file
    saved_path = save_to_random_py_file(filtered_df)
    print(f"Filtered DataFrame saved to: {saved_path}")


if __name__ == "__main__":
    main()
