import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers

# Create a Sequential model
model = keras.Sequential()

# Add a Dense layer with 10 units and ReLU activation
model.add(layers.Dense(10, activation='relu', input_shape=(784,)))

# Print the model summary
model.summary()

# Save the model to a file
model.save('my_model.h5')