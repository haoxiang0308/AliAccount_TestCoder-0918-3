# Load a CSV file and print summary statistics

# Load the CSV file
# Replace 'your_file.csv' with the actual path to your CSV file
data <- read.csv("your_file.csv")

# Print summary statistics
print("Summary Statistics:")
print(summary(data))

# Optionally, print the structure of the data
print("Data Structure:")
str(data)