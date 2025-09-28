import pandas as pd
import random
import string
import os

def create_and_filter_data():
    # Create a sample DataFrame
    data = {
        'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva'],
        'Age': [25, 30, 35, 28, 22],
        'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney']
    }
    df = pd.DataFrame(data)

    # Filter the DataFrame (e.g., Age > 25)
    filtered_df = df[df['Age'] > 25]

    # Generate a random filename
    random_filename = "filtered_data_" + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + ".py"

    # Save the filtered DataFrame to the random .py file
    # This saves the data in a Python-readable format using to_dict
    with open(random_filename, 'w') as f:
        f.write(f"filtered_data = {filtered_df.to_dict(orient='records')}\n")

    print(f"Filtered DataFrame saved to {random_filename}")
    print(filtered_df)

if __name__ == "__main__":
    create_and_filter_data()
