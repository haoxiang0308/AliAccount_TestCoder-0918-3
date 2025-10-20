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
true_weights = 2.5
true_bias = 1.0
y = true_weights * X + true_bias + 0.1 * np.random.randn(num_samples, 1).astype(np.float32)

# Split the data into training and testing sets
split_idx = int(0.8 * num_samples)
X_train, X_test = X[:split_idx], X[split_idx:]
y_train, y_test = y[:split_idx], y[split_idx:]

# Build the linear regression model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,), activation=None)
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
    verbose=1
)

# Evaluate the model
print("\nEvaluating the model...")
test_loss, test_mae = model.evaluate(X_test, y_test, verbose=0)
print(f"Test Loss (MSE): {test_loss}")
print(f"Test MAE: {test_mae}")

# Make predictions
print("\nMaking predictions...")
predictions = model.predict(X_test[:5])
print("First 5 predictions vs actual values:")
for i in range(5):
    print(f"X: {X_test[i][0]:.3f}, Predicted: {predictions[i][0]:.3f}, Actual: {y_test[i][0]:.3f}")

# Print learned parameters
weights, bias = model.layers[0].get_weights()
print(f"\nLearned weight: {weights[0][0]:.3f} (true: {true_weights})")
print(f"Learned bias: {bias[0]:.3f} (true: {true_bias})")

print("\nLinear regression model successfully built and trained!")