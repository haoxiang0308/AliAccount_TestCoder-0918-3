import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers

# Define a simple Sequential model
model = keras.Sequential([
    layers.Dense(10, activation='relu', input_shape=(784,))  # Example: 784 input features, 10 outputs
])

# Display the model's architecture
model.summary()

# Compile the model
model.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])

# Save the model definition as a Python script
# Note: This saves the *code* for the model, not the trained model itself.
# Saving the trained model would use model.save().