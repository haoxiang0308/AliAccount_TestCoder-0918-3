import tensorflow as tf
import numpy as np

# Generate dummy data for demonstration
# Features (X) and target (y) with a linear relationship y = 2*X + 1 plus some noise
X = np.random.rand(100, 1).astype(np.float32)
y = 2 * X.squeeze() + 1 + np.random.randn(100).astype(np.float32) * 0.1

# Define the model using Keras Sequential API
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))  # Single output, single input
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error') # Using Stochastic Gradient Descent

# Train the model
print("Training the model...")
model.fit(X, y, epochs=50, verbose=0)

# Print the learned parameters (slope and intercept)
slope = model.layers[0].get_weights()[0][0][0]
intercept = model.layers[0].get_weights()[1][0]
print(f"Learned slope: {slope:.4f}")
print(f"Learned intercept: {intercept:.4f}")

# Make a prediction on a new value
new_X = np.array([[0.5]], dtype=np.float32)
predicted_y = model.predict(new_X)
print(f"Prediction for X=0.5: {predicted_y[0][0]:.4f}")