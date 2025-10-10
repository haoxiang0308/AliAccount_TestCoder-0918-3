import tensorflow as tf
import numpy as np

# Generate random data for demonstration
X_train = np.random.rand(100, 1).astype(np.float32)
y_train = 2 * X_train + 1 + 0.1 * np.random.randn(100, 1).astype(np.float32)

# Define the model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Train the model
model.fit(X_train, y_train, epochs=50, verbose=0)

# Print the learned parameters (should be close to slope=2 and intercept=1)
slope, intercept = model.layers[0].get_weights()
print(f"Learnt slope: {slope[0][0]:.4f}, intercept: {intercept[0]:.4f}")

# Save the entire model
model.save('linear_regression_model.h5')
print("Model saved successfully as 'linear_regression_model.h5'")
