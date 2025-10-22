import tensorflow as tf
import numpy as np
import random
import os

# Set random seed for reproducibility
seed = random.randint(1, 10000)
tf.random.set_seed(seed)
np.random.seed(seed)
random.seed(seed)

# Generate synthetic data for linear regression
num_samples = 1000
X = np.random.randn(num_samples, 1).astype(np.float32)
true_weights = 2.5
true_bias = 0.5
y = true_weights * X + true_bias + 0.1 * np.random.randn(num_samples, 1).astype(np.float32)

# Create the model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(
    optimizer='adam',
    loss='mean_squared_error',
    metrics=['mae']
)

# Train the model
print("Training the model...")
history = model.fit(X, y, epochs=100, verbose=0)

# Evaluate the model
loss, mae = model.evaluate(X, y, verbose=0)
print(f"Final loss: {loss:.4f}")
print(f"Final MAE: {mae:.4f}")

# Print the learned parameters
weights, bias = model.layers[0].get_weights()
print(f"Learned weight: {weights[0][0]:.4f} (true: {true_weights})")
print(f"Learned bias: {bias[0]:.4f} (true: {true_bias})")

# Make a prediction
sample_input = np.array([[1.0]], dtype=np.float32)
prediction = model.predict(sample_input, verbose=0)
expected = true_weights * 1.0 + true_bias
print(f"Prediction for input 1.0: {prediction[0][0]:.4f} (expected: {expected:.4f})")

print("Linear regression model created and trained successfully!")