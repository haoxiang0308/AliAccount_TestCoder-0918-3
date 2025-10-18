import matplotlib.pyplot as plt
import numpy as np
import random
import os

# Generate random data
x = np.random.randn(100)  # 100 random x values from normal distribution
y = np.random.randn(100)  # 100 random y values from normal distribution

# Create a scatter plot
plt.figure(figsize=(10, 8))
plt.scatter(x, y, c='blue')
plt.title('Scatter Plot of Random Data')
plt.xlabel('X Values')
plt.ylabel('Y Values')

# Generate a random filename
random_name = f"scatter_plot_{random.randint(1000, 9999)}.png"

# Save the plot to a file with the random name
plt.savefig(random_name)
plt.close()

print(f"Scatter plot saved as: {random_name}")