import tensorflow as tf
import numpy as np

# Generate dummy data for demonstration
# Features (X) and target (y) with a linear relationship y = 2*X + 1 + noise
X_data = np.random.randn(100, 1).astype(np.float32)
y_data = 2 * X_data + 1 + 0.1 * np.random.randn(100, 1).astype(np.float32)

# Define the model using Keras Sequential API
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Print model summary
model.summary()

# Train the model
print("Training the model...")
model.fit(X_data, y_data, epochs=100, verbose=0)

# Print the final weights
weights, biases = model.layers[0].get_weights()
print(f"Learned weight: {weights[0][0]:.4f}")
print(f"Learned bias: {biases[0]:.4f}")

# Save the entire model to a file
model.save('trained_linear_model.h5')
print("\nModel saved as 'trained_linear_model.h5'.")