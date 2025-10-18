import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers
import numpy as np

# Create a simple model with one dense layer
model = keras.Sequential([
    layers.Dense(10, activation='relu', input_shape=(5,))  # Example: 5 input features, 10 neurons in the dense layer
])

# Compile the model
model.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])

# Print model summary
model.summary()

# Example of how to use the model
# Generate dummy data for demonstration
x_train = np.random.random((100, 5))  # 100 samples, 5 features each
y_train = np.random.randint(0, 10, (100,))  # 100 labels, integers from 0 to 9

print("Model created successfully!")
print(f"Model input shape: {model.input_shape}")
print(f"Model output shape: {model.output_shape}")