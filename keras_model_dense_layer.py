import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers
import numpy as np

# Create a simple model with one dense layer
model = keras.Sequential([
    layers.Dense(10, activation='relu', input_shape=(5,))  # 10 neurons, ReLU activation, 5 input features
])

# Compile the model
model.compile(optimizer='adam',
              loss='mse',
              metrics=['mae'])

# Display model summary
model.summary()

# Example of how to use the model
sample_input = np.random.random((1, 5))  # 1 sample with 5 features
prediction = model.predict(sample_input)
print("Sample prediction:", prediction)

# Save the model (optional)
# model.save('my_model.h5')