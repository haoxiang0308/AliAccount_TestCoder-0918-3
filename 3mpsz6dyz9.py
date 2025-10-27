import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers
import numpy as np

# Create a simple model with one dense layer
model = keras.Sequential([
    layers.Dense(64, activation='relu', input_shape=(10,)),  # Input shape of 10, 64 neurons, ReLU activation
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
y_train = np.random.randint(2, size=(1000, 1))

# Train the model briefly
model.fit(x_train, y_train, epochs=1, batch_size=32)

# Save the model (optional)
# model.save('my_model.h5')

print("Keras model with one dense layer created successfully!")