import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers

# Create a simple model with one dense layer
model = keras.Sequential([
    layers.Dense(10, activation='relu', input_shape=(784,)),
])

# Print model summary
model.summary()
