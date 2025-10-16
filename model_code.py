import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers
import random
import string

# Create a simple model with one dense layer
model = keras.Sequential([
    layers.Dense(10, activation='relu', input_shape=(784,)),
])

# Print model summary
model.summary()

# Generate a random filename
random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Save this code to the randomly named file
with open(random_name, 'w') as f:
    f.write('''import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers

# Model with one dense layer
model = keras.Sequential([
    layers.Dense(10, activation='relu', input_shape=(784,)),
])

model.summary()
''')

print(f"Model created and saved to {random_name}")