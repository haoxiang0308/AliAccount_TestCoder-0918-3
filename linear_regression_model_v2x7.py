import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt

# Set random seed for reproducibility
tf.random.set_seed(42)
np.random.seed(42)

# Generate synthetic data for linear regression
num_samples = 1000
X = np.random.randn(num_samples, 1).astype(np.float32)
# True relationship: y = 2.5 * x + 1.0 + noise
true_weights = 2.5
true_bias = 1.0
noise = 0.1 * np.random.randn(num_samples, 1).astype(np.float32)
y = true_weights * X + true_bias + noise

print(f"Generated {num_samples} samples for linear regression")
print(f"True weights: {true_weights}, True bias: {true_bias}")

# Create the model using Keras Sequential API
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,), name='linear_layer')
])

# Compile the model
model.compile(
    optimizer='adam',
    loss='mean_squared_error',
    metrics=['mae']
)

# Display model summary
model.summary()

# Train the model
print("\nTraining the model...")
history = model.fit(
    X, y,
    epochs=100,
    batch_size=32,
    validation_split=0.2,
    verbose=1
)

# Get the learned parameters
learned_weights = model.get_weights()[0][0][0]
learned_bias = model.get_weights()[1][0]
print(f"\nLearned weights: {learned_weights:.4f}")
print(f"Learned bias: {learned_bias:.4f}")
print(f"True weights: {true_weights}, True bias: {true_bias}")

# Make predictions on new data
test_X = np.array([[0.0], [1.0], [-1.0], [2.0]], dtype=np.float32)
predictions = model.predict(test_X)
print(f"\nTest predictions:")
for i in range(len(test_X)):
    expected = true_weights * test_X[i][0] + true_bias
    print(f"Input: {test_X[i][0]:.2f}, Predicted: {predictions[i][0]:.4f}, Expected: {expected:.4f}")

# Plot training history
plt.figure(figsize=(12, 4))

plt.subplot(1, 2, 1)
plt.plot(history.history['loss'], label='Training Loss')
plt.plot(history.history['val_loss'], label='Validation Loss')
plt.title('Model Loss')
plt.xlabel('Epoch')
plt.ylabel('Loss')
plt.legend()

plt.subplot(1, 2, 2)
plt.plot(history.history['mae'], label='Training MAE')
plt.plot(history.history['val_mae'], label='Validation MAE')
plt.title('Model MAE')
plt.xlabel('Epoch')
plt.ylabel('Mean Absolute Error')
plt.legend()

plt.tight_layout()
plt.show()

# Plot the regression line
plt.figure(figsize=(8, 6))
plt.scatter(X[:100], y[:100], alpha=0.5, label='Data points (first 100)')
plt.plot(X, learned_weights * X + learned_bias, color='red', label='Learned regression line')
plt.plot(X, true_weights * X + true_bias, '--', color='green', label='True relationship')
plt.title('Linear Regression Results')
plt.xlabel('X')
plt.ylabel('y')
plt.legend()
plt.show()

print("\nLinear regression model completed successfully!")