import tensorflow as tf
import numpy as np

# Generate some dummy data for demonstration
# Features (X) and target (y) with a linear relationship y = 2*X + 1 + noise
X_data = np.random.randn(100, 1).astype(np.float32)
y_data = 2 * X_data + 1 + 0.1 * np.random.randn(100, 1).astype(np.float32)

# Define the model using Keras Sequential API
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))  # Single output, single input
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Print a summary of the model
print("Model Summary:")
model.summary()

# Train the model
print("\nTraining the model...")
model.fit(X_data, y_data, epochs=100, verbose=0)

# Print final weights and bias
weights, biases = model.layers[0].get_weights()
print(f"\nLearned weight: {weights[0][0]:.4f}")
print(f"Learned bias: {biases[0]:.4f}")

# Make a prediction on a new value
new_X = np.array([[0.5]], dtype=np.float32)
predicted_y = model.predict(new_X)
print(f"\nPrediction for X=0.5: {predicted_y[0][0]:.4f}")

# Optionally, save the trained model to disk
# model.save('/workspace/my_linear_model.h5')