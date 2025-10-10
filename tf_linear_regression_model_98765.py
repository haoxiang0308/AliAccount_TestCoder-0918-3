import tensorflow as tf
import numpy as np

# Generate dummy data for demonstration
# y = 2 * x + 1 + noise
np.random.seed(42)
X = np.random.rand(100, 1).astype(np.float32)
y = 2 * X + 1 + 0.01 * np.random.randn(100, 1).astype(np.float32)

# Define the model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Train the model
print("Training the model...")
model.fit(X, y, epochs=100, verbose=0)

# Print the learned parameters
weights, biases = model.layers[0].get_weights()
print(f"Learned weight: {weights[0][0]:.4f}")
print(f"Learned bias: {biases[0]:.4f}")

# Make a prediction
sample_input = np.array([[0.5]], dtype=np.float32)
prediction = model.predict(sample_input)
print(f"Prediction for input {sample_input[0][0]}: {prediction[0][0]:.4f}")

print("Model training and testing completed.")