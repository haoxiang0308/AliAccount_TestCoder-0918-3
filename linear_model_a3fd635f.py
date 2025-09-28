import tensorflow as tf
import numpy as np

# Generate dummy data for training
num_samples = 1000
X = np.random.randn(num_samples).astype(np.float32)
y = 3.5 * X + 2.0 + np.random.randn(num_samples).astype(np.float32) * 0.1  # y = 3.5x + 2 + noise

# Define the model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Train the model
print("Training the model...")
model.fit(X, y, epochs=100, verbose=0)

# Print the final weights
print("Model trained. Final weights (slope):", model.get_weights()[0][0][0])
print("Model trained. Final bias:", model.get_weights()[1][0])

# Save the model (optional)
# model.save('my_linear_model.h5')