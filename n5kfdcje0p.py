import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers

# Create a simple model with one dense layer
model = keras.Sequential([
    layers.Dense(10, activation='relu', input_shape=(784,))  # Example: 10 neurons, ReLU activation
])

# Display model architecture
model.summary()

# You can compile and train the model as needed
# model.compile(optimizer='adam', loss='sparse_categorical_crossentropy', metrics=['accuracy'])
