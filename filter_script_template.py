import pandas as pd

# --- DataFrame Filtering Script ---
# This script demonstrates how to filter a pandas DataFrame based on a condition
# and save the filtered results to a new file.

# Sample DataFrame creation (replace this with your data loading logic)
data = {'Name': ['Alice', 'Bob', 'Charlie', 'David'],
        'Age': [25, 30, 35, 40],
        'City': ['New York', 'London', 'Paris', 'Tokyo']}
df = pd.DataFrame(data)

# Filter the DataFrame (example: filter for Age > 30)
filtered_df = df[df['Age'] > 30]

# Print the filtered DataFrame
print("Filtered DataFrame:")
print(filtered_df)

# Save the filtered DataFrame to a new CSV file
output_filename = 'filtered_data.csv'
filtered_df.to_csv(output_filename, index=False)
print(f"Filtered DataFrame saved to {output_filename}")