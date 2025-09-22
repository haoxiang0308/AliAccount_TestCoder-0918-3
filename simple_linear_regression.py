# Simple Linear Regression without TensorFlow (using only numpy)
import numpy as np
import matplotlib.pyplot as plt

class SimpleLinearRegression:
    def __init__(self):
        self.weight = 0
        self.bias = 0
    
    def fit(self, X, y, learning_rate=0.01, epochs=1000):
        # Initialize parameters
        self.weight = 0
        self.bias = 0
        n = float(len(X))
        
        # Gradient descent
        for i in range(epochs):
            y_pred = self.weight * X + self.bias
            
            # Calculate gradients
            dw = (-2/n) * sum(X * (y - y_pred))
            db = (-2/n) * sum(y - y_pred)
            
            # Update parameters
            self.weight = self.weight - learning_rate * dw
            self.bias = self.bias - learning_rate * db
    
    def predict(self, X):
        return self.weight * X + self.bias

# Generate sample data
np.random.seed(42)
X = np.random.randn(100)
y = 2 * X + 1 + 0.1 * np.random.randn(100)

# Create and train the model
model = SimpleLinearRegression()
model.fit(X, y, learning_rate=0.01, epochs=1000)

# Print results
print("Simple Linear Regression Model")
print(f"Weight (slope): {model.weight:.4f}")
print(f"Bias (intercept): {model.bias:.4f}")
print("Expected: Weight = 2.0000, Bias = 1.0000")

# Optional: Plot the results
try:
    plt.figure(figsize=(10, 6))
    plt.scatter(X, y, color='blue', label='Data points')
    plt.plot(X, model.predict(X), color='red', label='Regression line')
    plt.xlabel('X')
    plt.ylabel('y')
    plt.legend()
    plt.title('Simple Linear Regression')
    plt.savefig('linear_regression_plot.png')
    print("Plot saved as 'linear_regression_plot.png'")
except:
    print("Could not generate plot. matplotlib may not be installed.")