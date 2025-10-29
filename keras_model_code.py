import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers
import numpy as np

# Create a simple model with one dense layer
model = keras.Sequential([
    layers.Input(shape=(5,)),  # Define input shape using Input layer
    layers.Dense(10, activation='relu')  # Example: 5 input features, 10 neurons in dense layer
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
y_train = np.random.randint(0, 2, (100,))

# Train the model briefly
model.fit(x_train, y_train, epochs=1, verbose=0)

# Save the model in Keras format
model.save('my_model.keras')

print("Model created and saved successfully!")