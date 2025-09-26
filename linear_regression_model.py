import tensorflow as tf
import numpy as np

# Generate some dummy data for training
num_samples = 1000
X = np.random.randn(num_samples).astype(np.float32)
true_slope = 3.0
true_intercept = 2.5
y = true_slope * X + true_intercept + np.random.randn(num_samples).astype(np.float32) * 0.1

# Create a simple Sequential model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Train the model
print("Training the model...")
model.fit(X, y, epochs=100, verbose=0)

# Print the learned parameters
learned_slope, learned_intercept = model.layers[0].get_weights()
print(f"Learned slope: {learned_slope[0][0]:.4f}")
print(f"Learned intercept: {learned_intercept[0]:.4f}")
print(f"True slope: {true_slope}, True intercept: {true_intercept}")

# Save the model
model.save('/workspace/trained_linear_model.h5')
print("\nModel saved as 'trained_linear_model.h5'.")