# R Script to Load CSV and Print Summary Statistics

# Load necessary libraries
# If these are not installed, uncomment the next line to install them
# install.packages(c("readr"))

# Load the CSV file (replace 'data.csv' with your actual file path)
# For this example, we'll create a sample dataset
data <- data.frame(
  ID = 1:100,
  Age = sample(18:80, 100, replace = TRUE),
  Income = sample(20000:150000, 100, replace = TRUE),
  Score = rnorm(100, mean = 75, sd = 10)
)

# Alternatively, to load from a file, use:
# data <- read.csv("path/to/your/file.csv")

# Print summary statistics
print("Summary Statistics:")
print(summary(data))

# Print structure of the data
print("Data Structure:")
str(data)

# Print first few rows
print("First 6 Rows:")
head(data)