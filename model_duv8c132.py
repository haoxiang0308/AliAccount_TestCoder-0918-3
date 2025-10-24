import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers
import numpy as np

# Create a simple model with one dense layer
model = keras.Sequential([
    layers.Dense(32, activation='relu', input_shape=(20,))
])

# Compile the model
model.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])

# Display model summary
model.summary()

# Example of how to use the model
# Generate dummy data for demonstration
x_train = np.random.random((500, 20))
y_train = np.random.randint(2, size=(500,))

print("Keras model with one dense layer created successfully!")
print("Model input shape:", model.input_shape)
print("Model output shape:", model.output_shape)