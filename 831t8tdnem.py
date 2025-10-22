import tensorflow as tf
import numpy as np
import os

# Generate random data for linear regression
num_samples = 1000
X = np.random.randn(num_samples, 1).astype(np.float32)
true_weights = 2.5
true_bias = 0.5
y = true_weights * X + true_bias + 0.1 * np.random.randn(num_samples, 1).astype(np.float32)

# Define the model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(1, input_shape=(1,))
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

# Print final metrics
final_loss = history.history['loss'][-1]
final_mae = history.history['mae'][-1]
print(f"Final loss: {final_loss:.4f}")
print(f"Final MAE: {final_mae:.4f}")

# Test the model
test_input = np.array([[1.0], [2.0], [3.0]], dtype=np.float32)
predictions = model.predict(test_input)
print("\nTest predictions:")
for i, (inp, pred) in enumerate(zip(test_input, predictions)):
    print(f"Input: {inp[0]:.1f}, Predicted: {pred[0]:.4f}, Expected (approx): {true_weights * inp[0] + true_bias:.4f}")

# Save the model
model.save('linear_regression_trained_model.h5')
print("\nModel saved as 'linear_regression_trained_model.h5'")
