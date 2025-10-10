import tensorflow as tf
import numpy as np

# Generate dummy data
X_train = np.random.rand(100, 1).astype(np.float32)
y_train = 3.5 * X_train + 2.0 + np.random.randn(100, 1).astype(np.float32)

# Define the model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Train the model
model.fit(X_train, y_train, epochs=100, verbose=0)

# Print final weights
final_weights = model.get_weights()
print("Final Weights:")
print(f"Weight (Slope): {final_weights[0][0][0]:.4f}")
print(f"Bias (Intercept): {final_weights[1][0]:.4f}")

# Save the model (optional)
# model.save('my_linear_model.h5')