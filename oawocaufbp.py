"""
Keras model with one dense layer
This file contains the code to create a Keras model with one dense layer.
"""
import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers

# Create a sequential model with one dense layer
model = keras.Sequential([
    layers.Input(shape=(10,)),      # Input shape: 10 features
    layers.Dense(5, activation='relu')  # One dense layer with 5 neurons
])

# Compile the model (optional)
# model.compile(optimizer='adam', loss='mse')

# The model is defined with one dense layer
# You can use model.fit() to train and model.predict() to make predictions