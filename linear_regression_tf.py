import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt

# Generate sample data
np.random.seed(42)
X = np.random.randn(100, 1).astype(np.float32)
y = 2 * X + 1 + 0.1 * np.random.randn(100, 1).astype(np.float32)  # y = 2x + 1 + noise

# Create TensorFlow model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=[1])
])

# Compile the model
model.compile(
    optimizer='sgd',
    loss='mean_squared_error',
    metrics=['mae']
)

# Display model summary
model.summary()

# Train the model
history = model.fit(X, y, epochs=100, verbose=1)

# Make predictions
predictions = model.predict(X[:5])
print("Sample predictions vs actual:")
for i in range(5):
    print(f"X: {X[i][0]:.2f}, Predicted: {predictions[i][0]:.2f}, Actual: {y[i][0]:.2f}")

# Plot results
plt.figure(figsize=(10, 6))
plt.scatter(X, y, label='Data')
plt.plot(X, model.predict(X), color='red', label='Model prediction')
plt.xlabel('X')
plt.ylabel('y')
plt.legend()
plt.title('Linear Regression with TensorFlow')
plt.show()

# Save the model
model.save('linear_regression_model.h5')
print("Model saved as 'linear_regression_model.h5'")