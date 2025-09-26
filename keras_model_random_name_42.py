# This script defines a simple Keras model with one dense layer.
# Note: This script requires TensorFlow/Keras to be installed to run successfully.

import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers

def create_simple_model():
    """
    Creates a Keras Sequential model with one Dense layer.
    The input shape is assumed to be 10 features, and the output has 1 unit.
    """
    model = keras.Sequential([
        layers.Dense(1, input_shape=(10,), name='dense_layer_1')
    ])
    return model

if __name__ == "__main__":
    model = create_simple_model()
    model.summary()