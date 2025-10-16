import random
import string
import os

# Generate a random filename
random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Create the content for a Keras model with one dense layer
model_content = '''import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers

# Create a simple model with one dense layer
model = keras.Sequential([
    layers.Dense(10, activation='relu', input_shape=(784,)),
])

# Print model summary
model.summary()
'''

# Write the model code to the randomly named file
with open(random_name, 'w') as f:
    f.write(model_content)

print(f"Keras model with one dense layer saved to {random_name}")
print("File contents:")
print(model_content)