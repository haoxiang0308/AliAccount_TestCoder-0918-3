#!/usr/bin/env python3
"""
Simple Linear Regression with TensorFlow
This script demonstrates how to build and train a simple linear regression model using TensorFlow.
"""

import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt

# Generate synthetic data for linear regression
np.random.seed(42)
X = np.random.randn(100, 1).astype(np.float32)
y = 2 * X + 1 + 0.1 * np.random.randn(100, 1).astype(np.float32)  # y = 2x + 1 + noise

# Define the linear regression model using TensorFlow
class LinearRegressionModel(tf.Module):
    def __init__(self):
        # Initialize weights and bias with random values
        self.weight = tf.Variable(np.random.randn(), name='weight')
        self.bias = tf.Variable(np.random.randn(), name='bias')
    
    def __call__(self, x):
        return self.weight * x + self.bias

# Initialize the model
model = LinearRegressionModel()

# Define the loss function (Mean Squared Error)
def loss_fn(y_true, y_pred):
    return tf.reduce_mean(tf.square(y_true - y_pred))

# Define the optimizer
optimizer = tf.optimizers.SGD(learning_rate=0.01)

# Training function
def train_step(x, y):
    with tf.GradientTape() as tape:
        predictions = model(x)
        loss = loss_fn(y, predictions)
    gradients = tape.gradient(loss, [model.weight, model.bias])
    optimizer.apply_gradients(zip(gradients, [model.weight, model.bias]))
    return loss

# Training loop
epochs = 100
for epoch in range(epochs):
    loss = train_step(X, y)
    if epoch % 10 == 0:
        print(f"Epoch {epoch}, Loss: {loss:.4f}, Weight: {model.weight.numpy():.4f}, Bias: {model.bias.numpy():.4f}")

# Print final parameters
print(f"\nFinal parameters:")
print(f"Weight: {model.weight.numpy():.4f}")
print(f"Bias: {model.bias.numpy():.4f}")
print(f"True Weight: 2.0, True Bias: 1.0")

# Plot the results
plt.figure(figsize=(10, 6))
plt.scatter(X, y, label='Data points')
plt.plot(X, model(X), color='red', label='Fitted line')
plt.xlabel('X')
plt.ylabel('y')
plt.legend()
plt.title('Linear Regression with TensorFlow')
plt.show()