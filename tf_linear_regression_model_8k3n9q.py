import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt

# Generate sample data for linear regression
# y = 2x + 1 + noise
np.random.seed(42)
X = np.random.randn(100, 1).astype(np.float32)
y = 2 * X + 1 + 0.1 * np.random.randn(100, 1).astype(np.float32)

# Create a simple linear regression model using TensorFlow
model = tf.keras.Sequential([
    tf.keras.layers.Dense(1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd',  # Stochastic Gradient Descent
              loss='mean_squared_error',
              metrics=['mae'])  # Mean Absolute Error

# Display model architecture
print("Model Architecture:")
model.summary()

# Train the model
print("\nTraining the model...")
history = model.fit(X, y, epochs=100, verbose=0)

# Get the learned parameters
weights, bias = model.layers[0].get_weights()
print(f"\nLearned parameters:")
print(f"Weight: {weights[0][0]:.3f}")
print(f"Bias: {bias[0]:.3f}")
print(f"True parameters: Weight=2.0, Bias=1.0")

# Make predictions
predictions = model.predict(X)

# Plot the results
plt.figure(figsize=(10, 6))
plt.scatter(X, y, alpha=0.6, label='Data points')
plt.plot(X, predictions, color='red', label='Fitted line')
plt.xlabel('X')
plt.ylabel('y')
plt.title('Linear Regression with TensorFlow')
plt.legend()
plt.grid(True)
plt.show()

# Print final loss
final_loss = history.history['loss'][-1]
print(f"\nFinal loss: {final_loss:.4f}")