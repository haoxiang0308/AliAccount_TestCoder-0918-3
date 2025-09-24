# Load the data from a CSV file
# Assumes the CSV file is named 'data.csv' and is in the current working directory
data <- read.csv("data.csv")

# Print summary statistics for the dataset
print("Summary Statistics:")
print(summary(data))

# Optionally, print the structure of the dataset
print("Dataset Structure:")
str(data)