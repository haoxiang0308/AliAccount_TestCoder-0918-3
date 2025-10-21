import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt

# Set random seed for reproducibility
tf.random.set_seed(42)
np.random.seed(42)

print("TensorFlow version:", tf.__version__)

# Generate synthetic data for linear regression
# y = 2x + 1 + noise
num_samples = 1000
X = np.random.randn(num_samples, 1).astype(np.float32)
y = 2 * X + 1 + 0.1 * np.random.randn(num_samples, 1).astype(np.float32)

# Split data into train and test sets
train_size = int(0.8 * num_samples)
X_train, X_test = X[:train_size], X[train_size:]
y_train, y_test = y[:train_size], y[train_size:]

print(f"Training samples: {len(X_train)}")
print(f"Test samples: {len(X_test)}")

# Build the linear regression model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,), name='linear_layer')
])

# Compile the model
model.compile(
    optimizer='sgd',  # Stochastic Gradient Descent
    loss='mean_squared_error',  # For regression
    metrics=['mae']  # Mean Absolute Error as additional metric
)

# Display model summary
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

# Evaluate the model on test data
print("\nEvaluating the model on test data...")
test_loss, test_mae = model.evaluate(X_test, y_test, verbose=0)
print(f"Test Loss (MSE): {test_loss:.4f}")
print(f"Test MAE: {test_mae:.4f}")

# Get the learned parameters
weights, bias = model.layers[0].get_weights()
print(f"\nLearned weight: {weights[0][0]:.4f} (true value is 2.0)")
print(f"Learned bias: {bias[0]:.4f} (true value is 1.0)")

# Make predictions
predictions = model.predict(X_test)

# Plot the results
plt.figure(figsize=(12, 4))

# Plot training history
plt.subplot(1, 2, 1)
plt.plot(history.history['loss'], label='Training Loss')
plt.plot(history.history['val_loss'], label='Validation Loss')
plt.title('Model Loss During Training')
plt.xlabel('Epoch')
plt.ylabel('Loss')
plt.legend()

# Plot predictions vs actual
plt.subplot(1, 2, 2)
plt.scatter(X_test, y_test, alpha=0.5, label='Actual')
plt.scatter(X_test, predictions, alpha=0.5, label='Predicted')
plt.title('Actual vs Predicted Values')
plt.xlabel('X')
plt.ylabel('y')
plt.legend()

plt.tight_layout()
plt.show()

print("\nLinear regression model built and trained successfully!")