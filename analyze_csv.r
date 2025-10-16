# Load CSV file and print summary statistics
# This script loads a CSV file and prints summary statistics

# Load the CSV file
# Replace 'data.csv' with your actual file path
data <- read.csv("data.csv")

# Print the structure of the data
str(data)

# Print summary statistics
summary(data)

# Print first few rows
head(data)

# Print dimensions of the data
print(paste("Dimensions of the dataset:", nrow(data), "rows and", ncol(data), "columns"))

# Print column names
print("Column names:")
print(names(data))