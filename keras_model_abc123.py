import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers

# Create a simple Keras model with one dense layer
model = keras.Sequential([
    layers.Dense(10, activation='relu', input_shape=(5,)),  # Dense layer with 10 units
    layers.Dense(1, activation='sigmoid')  # Output layer for binary classification
])

# Compile the model
model.compile(optimizer='adam',
              loss='binary_crossentropy',
              metrics=['accuracy'])

# Display model summary
model.summary()

# Save the model
model.save('my_model.h5')

print("Model created and saved successfully!")