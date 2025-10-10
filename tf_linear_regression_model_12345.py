import tensorflow as tf
import numpy as np

# Generate some dummy data for demonstration
num_samples = 1000
X = np.random.randn(num_samples).astype(np.float32)
true_W = 3.0
true_b = 2.0
noise = np.random.randn(num_samples).astype(np.float32) * 0.1
y = X * true_W + true_b + noise

# Define the model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Train the model
print("Training the model...")
model.fit(X, y, epochs=10, verbose=1)

# Print the learned parameters
learned_W, learned_b = model.layers[0].get_weights()
print(f"Learned weight: {learned_W[0][0]:.4f}")
print(f"Learned bias: {learned_b[0]:.4f}")

# Save the model (optional)
# model.save('my_linear_model.h5')