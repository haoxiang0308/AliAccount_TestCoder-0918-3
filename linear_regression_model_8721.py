import tensorflow as tf
import numpy as np

# Generate dummy data for demonstration
# y = 2 * x + 1 + noise
X = np.random.rand(100, 1).astype(np.float32)
y = 2 * X + 1 + 0.1 * np.random.randn(100, 1).astype(np.float32)

# Define the model using Keras Sequential API
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=[1])
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Train the model
print("Training the model...")
model.fit(X, y, epochs=100, verbose=0)

# Print the learned parameters (should be close to W=2, b=1)
W, b = model.layers[0].get_weights()
print(f"Learned weight: {W[0][0]:.4f}")
print(f"Learned bias: {b[0]:.4f}")

print("Model built and trained successfully!")