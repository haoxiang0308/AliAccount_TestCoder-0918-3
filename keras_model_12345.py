import tensorflow as tf
from tensorflow import keras

# Create a simple Sequential model
model = keras.Sequential([
    keras.layers.Dense(10, activation='relu', input_shape=(784,))  # Example: 784 input units, 10 output units with ReLU activation
])

# Compile the model (optional for just saving the architecture)
# model.compile(optimizer='adam', loss='sparse_categorical_crossentropy')

# Save the model (architecture, weights, and optimizer state)
model.save('my_model.keras')

print("Keras model with one dense layer created and saved as 'my_model.keras'.")