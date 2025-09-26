import tensorflow as tf
import numpy as np

# Generate random data for demonstration
X = np.random.rand(100, 1).astype(np.float32)
y = 3.5 * X + 2.0 + np.random.randn(100, 1).astype(np.float32)

# Create a simple linear regression model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=[1])
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Train the model
print("Training the model...")
model.fit(X, y, epochs=100, verbose=0)

# Print the learned parameters
print(f"Learned parameters: W = {model.get_weights()[0][0][0]:.2f}, b = {model.get_weights()[1][0]:.2f}")

# Save the entire model
model.save('linear_regression_model.h5')
print("Model saved as 'linear_regression_model.h5'")
