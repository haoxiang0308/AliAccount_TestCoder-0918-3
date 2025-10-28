import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt

# Generate sample data for linear regression
np.random.seed(42)
X = np.random.randn(100, 1).astype(np.float32)
y = 2 * X + 1 + 0.1 * np.random.randn(100, 1).astype(np.float32)

# Create a simple linear regression model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error', metrics=['mae'])

# Print model summary
print("Model Summary:")
model.summary()

# Train the model
print("\nTraining the model...")
history = model.fit(X, y, epochs=100, verbose=0)

# Get the learned parameters
weights, bias = model.layers[0].get_weights()
print(f"\nLearned weight: {weights[0][0]:.2f}")
print(f"Learned bias: {bias[0]:.2f}")

# Make predictions
predictions = model.predict(X)

# Plot the results
plt.figure(figsize=(10, 6))
plt.scatter(X, y, alpha=0.5, label='Data')
plt.plot(X, predictions, color='red', label='Linear Regression Fit')
plt.xlabel('X')
plt.ylabel('y')
plt.title('Linear Regression with TensorFlow')
plt.legend()
plt.grid(True)
plt.show()

print("\nModel training completed successfully!")