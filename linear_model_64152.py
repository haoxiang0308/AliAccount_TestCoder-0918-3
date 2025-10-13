import tensorflow as tf
import numpy as np

# Generate dummy data for training
train_x = np.random.randn(100).astype(np.float32)
train_y = 3 * train_x + 2 + np.random.randn(100) * 0.1  # y = 3x + 2 + noise

# Define the model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Train the model
model.fit(train_x, train_y, epochs=100, verbose=0)

print("Model training complete.")
print("Model weights (slope):", model.get_weights()[0][0][0])
print("Model bias (intercept):", model.get_weights()[1][0])