import tensorflow as tf
import numpy as np
import random
import os

# Set random seed for reproducibility
random.seed(42)
np.random.seed(42)
tf.random.set_seed(42)

# Generate random data for linear regression
num_samples = 1000
X = np.random.randn(num_samples, 1).astype(np.float32)
true_weight = 2.5
true_bias = 0.5
y = true_weight * X + true_bias + 0.1 * np.random.randn(num_samples, 1).astype(np.float32)

# Split data into train and test sets
train_size = int(0.8 * num_samples)
X_train, X_test = X[:train_size], X[train_size:]
y_train, y_test = y[:train_size], y[train_size:]

# Build the model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(1, input_shape=(1,))
])

# Compile the model
model.compile(
    optimizer='adam',
    loss='mean_squared_error',
    metrics=['mae']
)

# Print model summary
print("Model Summary:")
model.summary()

# Train the model
print("\nTraining the model...")
history = model.fit(
    X_train, y_train,
    epochs=100,
    batch_size=32,
    validation_split=0.2,
    verbose=0
)

# Evaluate the model
print("\nEvaluating the model...")
test_loss, test_mae = model.evaluate(X_test, y_test, verbose=0)
print(f"Test Loss (MSE): {test_loss:.4f}")
print(f"Test MAE: {test_mae:.4f}")

# Get the learned parameters
weights, bias = model.layers[0].get_weights()
print(f"\nLearned weight: {weights[0][0]:.4f} (true: {true_weight})")
print(f"Learned bias: {bias[0]:.4f} (true: {true_bias})")

# Make a prediction on a new sample
new_sample = np.array([[1.5]], dtype=np.float32)
prediction = model.predict(new_sample, verbose=0)
expected = true_weight * 1.5 + true_bias
print(f"\nPrediction for x=1.5: {prediction[0][0]:.4f} (expected: {expected:.4f})")