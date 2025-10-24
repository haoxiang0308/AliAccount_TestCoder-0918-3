import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers
import numpy as np

# Create a simple model with one dense layer
model = keras.Sequential([
    layers.Dense(64, activation='relu', input_shape=(10,))
])

# Compile the model
model.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])

# Display model summary
model.summary()

# Example of how to use the model
# Generate dummy data for demonstration
x_train = np.random.random((1000, 10))
y_train = np.random.randint(2, size=(1000,))

# Train the model for a few epochs (just as an example)
# model.fit(x_train, y_train, epochs=5, batch_size=32)

print("Keras model with one dense layer created successfully!")