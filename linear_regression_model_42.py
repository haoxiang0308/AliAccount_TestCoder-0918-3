import tensorflow as tf
import numpy as np

# Generate some dummy data for linear regression: y = 2 * x + 1 + noise
np.random.seed(42)
X = np.random.rand(100, 1).astype(np.float32)
y = 2 * X + 1 + 0.01 * np.random.randn(100, 1).astype(np.float32)

# Define the model using Sequential API
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Train the model
print("Training the model...")
model.fit(X, y, epochs=50, verbose=0)

# Print the learned parameters (slope and bias)
slope, bias = model.layers[0].get_weights()
print(f"Learned slope: {slope[0][0]:.4f}")
print(f"Learned bias: {bias[0]:.4f}")

# Save the entire model
model.save('linear_regression_model_42.h5')
print("\nModel saved as 'linear_regression_model_42.h5'")

# Save the script
print("Script saved as 'linear_regression_model_42.py'")