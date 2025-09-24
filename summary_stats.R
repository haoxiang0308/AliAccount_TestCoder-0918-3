# Load data from a CSV file
# Replace 'data.csv' with the path to your actual CSV file
data <- read.csv("data.csv")

# Print summary statistics for the dataset
print("Summary Statistics:")
print(summary(data))

# Optional: Print the structure of the dataset
print("Dataset Structure:")
print(str(data))