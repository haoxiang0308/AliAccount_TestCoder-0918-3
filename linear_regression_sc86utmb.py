import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt

# Set random seed for reproducibility
tf.random.set_seed(42)
np.random.seed(42)

# Generate synthetic data for linear regression
num_samples = 1000
X = np.random.randn(num_samples, 1).astype(np.float32)
true_slope = 2.5
true_intercept = -1.3
noise = 0.5 * np.random.randn(num_samples, 1).astype(np.float32)
y = true_slope * X + true_intercept + noise

print(f"Generated {num_samples} samples for linear regression")
print(f"True slope: {true_slope}, True intercept: {true_intercept}")

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

# Display model architecture
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
learned_slope = model.get_weights()[0][0][0]
learned_intercept = model.get_weights()[1][0]
print(f"\nLearned slope: {learned_slope:.3f}")
print(f"Learned intercept: {learned_intercept:.3f}")
print(f"True slope: {true_slope}, True intercept: {true_intercept}")

# Make predictions
predictions = model.predict(X)

# Plot results
plt.figure(figsize=(10, 6))
plt.scatter(X, y, alpha=0.5, label='Data points')
plt.plot(X, predictions, color='red', linewidth=2, label='Fitted line')
plt.xlabel('X')
plt.ylabel('y')
plt.title('Linear Regression with TensorFlow')
plt.legend()
plt.grid(True, alpha=0.3)
plt.savefig('linear_regression_plot.png')
print("\nPlot saved as 'linear_regression_plot.png'")

# Evaluate the model
test_loss, test_mae = model.evaluate(X, y, verbose=0)
print(f"\nFinal loss (MSE): {test_loss:.4f}")
print(f"Final MAE: {test_mae:.4f}")

print("\nLinear regression model training completed successfully!")