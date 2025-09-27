import tensorflow as tf
import numpy as np

# Generate dummy data
X = np.random.random((100, 1)).astype(np.float32)
y = 3 * X.squeeze() + 2 + np.random.normal(0, 0.1, (100,)).astype(np.float32)

# Define the model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Train the model
model.fit(X, y, epochs=50, verbose=0)

# Print final loss
final_loss = model.evaluate(X, y, verbose=0)
print(f"Final training loss: {final_loss}")

# Save the model
model.save('linear_regression_model.h5')