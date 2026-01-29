import tensorflow as tf
import numpy as np

# Generate sample data for linear regression: y = 2x + 1
np.random.seed(42)
X_train = np.random.randn(100, 1)
y_train = 2 * X_train + 1 + np.random.randn(100, 1) * 0.1

# Build the model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(1, input_shape=(1,), activation='linear')
])

# Compile the model
model.compile(optimizer='sgd', loss='mse', metrics=['mae'])

# Print model summary
print("Model Summary:")
model.summary()

# Train the model
print("\nTraining the model...")
history = model.fit(X_train, y_train, epochs=100, verbose=0)

# Test with sample predictions
X_test = np.array([[0], [1], [2], [3]])
y_pred = model.predict(X_test)

print("\nSample Predictions:")
for x, pred in zip(X_test, y_pred):
    print(f"x = {x[0]:.1f}, predicted y = {pred[0]:.2f}")

# Save the model
model.save('linear_model.h5')
print("\nModel saved to 'linear_model.h5'")
