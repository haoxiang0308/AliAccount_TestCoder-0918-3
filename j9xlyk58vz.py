import tensorflow as tf
import numpy as np
import random

# Set random seed for reproducibility
tf.random.set_seed(42)
np.random.seed(42)
random.seed(42)

# Generate sample data for linear regression
num_samples = 1000
X = np.random.randn(num_samples, 1).astype(np.float32)
# True parameters: y = 2.5 * x + 1.3 + noise
true_weights = 2.5
true_bias = 1.3
noise = 0.1 * np.random.randn(num_samples, 1).astype(np.float32)
y = true_weights * X + true_bias + noise

# Create the model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(
    optimizer='sgd',  # Stochastic Gradient Descent
    loss='mean_squared_error',
    metrics=['mae']  # Mean Absolute Error
)

# Print model summary
print("Model Summary:")
model.summary()

# Train the model
print("\nTraining the model...")
history = model.fit(
    X, y,
    epochs=100,
    verbose=0,  # Set to 1 to see training progress
    validation_split=0.2
)

# Print final loss
print(f"\nFinal training loss: {history.history['loss'][-1]:.4f}")
print(f"Final validation loss: {history.history['val_loss'][-1]:.4f}")

# Get the learned parameters
weights, bias = model.layers[0].get_weights()
print(f"\nLearned weight: {weights[0][0]:.4f} (true: {true_weights})")
print(f"Learned bias: {bias[0]:.4f} (true: {true_bias})")

# Test the model on new data
test_X = np.array([[0.5], [-0.3], [1.2]], dtype=np.float32)
predictions = model.predict(test_X)
print(f"\nTest predictions for {test_X.flatten()}: {predictions.flatten()}")

# Calculate expected values manually for comparison
expected = true_weights * test_X + true_bias
print(f"Expected values: {expected.flatten()}")