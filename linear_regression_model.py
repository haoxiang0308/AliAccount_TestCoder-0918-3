import tensorflow as tf
import numpy as np

# Generate some dummy data for training
num_samples = 1000
X = np.random.randn(num_samples, 1).astype(np.float32)
true_slope = 3.0
true_bias = 2.0
y = true_slope * X + true_bias + 0.1 * np.random.randn(num_samples, 1).astype(np.float32)

# Define the model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error', metrics=['mae'])

# Train the model
print("Training the model...")
history = model.fit(X, y, epochs=100, verbose=0)

# Print final loss
print(f"Final loss: {history.history['loss'][-1]:.4f}")

# Save the model's weights for later use (optional)
# model.save_weights('linear_regression_weights.h5')

print("Model training complete.")