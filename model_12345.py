import tensorflow as tf
import numpy as np

# Generate some dummy data for linear regression y = 2x + 1
X_data = np.random.randn(100, 1).astype(np.float32)
y_data = 2 * X_data + 1 + 0.1 * np.random.randn(100, 1).astype(np.float32)

# Define the model using Keras Sequential API
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Train the model
model.fit(X_data, y_data, epochs=100, verbose=0)

# Print the learned parameters (should be close to slope=2 and intercept=1)
slope, intercept = model.layers[0].get_weights()
print(f"Learned slope: {slope[0][0]:.4f}")
print(f"Learned intercept: {intercept[0]:.4f}")
