#!/usr/bin/env python3
"""
Simple Linear Regression Implementation
This script demonstrates how to implement a basic linear regression model using NumPy.
"""

import numpy as np
import matplotlib.pyplot as plt

class LinearRegression:
    def __init__(self):
        self.weight = 0
        self.bias = 0
    
    def fit(self, X, y, epochs=1000, learning_rate=0.01):
        # Initialize parameters
        self.weight = 0
        self.bias = 0
        n = len(X)
        
        # Gradient descent
        for i in range(epochs):
            # Forward pass
            y_pred = self.weight * X + self.bias
            
            # Calculate loss (MSE)
            loss = (1/n) * np.sum((y - y_pred)**2)
            
            # Calculate gradients
            dw = (-2/n) * np.sum(X * (y - y_pred))
            db = (-2/n) * np.sum(y - y_pred)
            
            # Update parameters
            self.weight -= learning_rate * dw
            self.bias -= learning_rate * db
    
    def predict(self, X):
        return self.weight * X + self.bias

# Generate synthetic data for linear regression
np.random.seed(42)
X = np.random.randn(100)
y = 2 * X + 1 + 0.1 * np.random.randn(100)  # y = 2x + 1 + noise

# Create and train the model
model = LinearRegression()
print("Training the model...")
model.fit(X, y, epochs=1000, learning_rate=0.01)

# Make predictions
print("\nMaking predictions...")
test_values = [0, 1, 2, 3, 4]
predictions = model.predict(np.array(test_values))
for i, pred in enumerate(predictions):
    print(f"Input: {test_values[i]}, Predicted: {pred:.4f}")

# Display learned parameters
print(f"\nLearned parameters:")
print(f"Weight: {model.weight:.4f}")
print(f"Bias: {model.bias:.4f}")
print(f"True parameters: Weight=2.0, Bias=1.0")

# Plot the results
plt.figure(figsize=(10, 6))
plt.scatter(X, y, label='Data')
plt.plot(X, model.predict(X), color='red', label='Fitted line')
plt.xlabel('X')
plt.ylabel('y')
plt.legend()
plt.title('Linear Regression Implementation')
plt.savefig('linear_regression_plot.png')
print("\nPlot saved as 'linear_regression_plot.png'")