import os
os.environ['TF_ENABLE_ONEDNN_OPTS'] = '0'

import tensorflow as tf
import numpy as np

# Simplified linear regression with TensorFlow

# Generate sample data
np.random.seed(42)
X = np.random.randn(100, 1).astype(np.float32)
y = (2 * X + 1 + 0.1 * np.random.randn(100, 1)).astype(np.float32)

# Create a simple model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Train the model
print("Starting training...")
model.fit(X, y, epochs=100, verbose=0)

# Get the learned parameters
weights, bias = model.layers[0].get_weights()
print(f"Learned weight: {weights[0][0]:.4f}")
print(f"Learned bias: {bias[0]:.4f}")
print("Training completed.")