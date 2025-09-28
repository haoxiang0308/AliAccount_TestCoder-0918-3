import tensorflow as tf
import numpy as np

# Generate dummy data for demonstration
# y = 2 * x + 1 + noise
np.random.seed(42)
X_train = np.random.rand(100, 1).astype(np.float32)
y_train = 2 * X_train + 1 + 0.01 * np.random.randn(100, 1).astype(np.float32)

# Define the model using Keras Sequential API
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Train the model
print("Training the model...")
model.fit(X_train, y_train, epochs=100, verbose=0)

# Print the learned parameters
w, b = model.layers[0].get_weights()
print(f"Learned weight: {w[0][0]:.4f}")
print(f"Learned bias: {b[0]:.4f}")

print("Model training completed.")