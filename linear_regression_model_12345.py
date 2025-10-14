import tensorflow as tf
import numpy as np

# Generate dummy data for a simple linear relationship y = 2x + 1 + noise
np.random.seed(42)
X = np.random.rand(100, 1).astype(np.float32)
y = 2 * X + 1 + 0.01 * np.random.randn(100, 1).astype(np.float32)

# Define the model using Keras Sequential API
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Print a summary of the model
model.summary()

# Train the model
print("Training the model...")
model.fit(X, y, epochs=50, verbose=0)
print("Training complete.")

# Get the learned weights
weights, bias = model.layers[0].get_weights()
print(f"Learned weight: {weights[0][0]:.4f}")
print(f"Learned bias: {bias[0]:.4f}")

# Save the entire model to a file
model.save('my_linear_model.h5')
print("Model saved as 'my_linear_model.h5'")