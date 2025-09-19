# Load necessary library
library(readr)

# Load CSV file (replace 'data.csv' with your actual file path)
data <- read_csv("data.csv")

# Print summary statistics
print("Summary Statistics:")
print(summary(data))

# Print structure of the data
print("Data Structure:")
print(str(data))

# Print first few rows
print("First few rows:")
print(head(data))