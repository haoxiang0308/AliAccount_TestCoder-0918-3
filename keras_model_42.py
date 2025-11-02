import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers
import numpy as np

# Create a simple model with one dense layer
model = keras.Sequential([
    layers.Dense(10, activation='relu', input_shape=(5,))  # Input shape of 5, 10 neurons in the dense layer
])

# Compile the model
model.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])

# Display model summary
model.summary()

# Example of how to use the model
# Generate dummy data for demonstration
x_train = np.random.random((100, 5))
y_train = np.random.randint(0, 10, (100,))

# Train the model for a few epochs (just as an example)
# model.fit(x_train, y_train, epochs=3, batch_size=32)

# Save the model
model.save('simple_keras_model.h5')

print("Keras model with one dense layer created and saved!")