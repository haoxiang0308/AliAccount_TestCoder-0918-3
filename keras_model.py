import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers
import random
import string

# Generate a random filename
def generate_random_filename():
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.py"

# Create a simple model with one dense layer
model = keras.Sequential([
    layers.Dense(10, activation='relu', input_shape=(784,))  # Example: 10 neurons, ReLU activation
])

# Display model architecture
model.summary()

# Save this model code to a randomly named file
random_filename = generate_random_filename()
print(f"Saving model code to: {random_filename}")

# Write the model creation code to the randomly named file
with open(random_filename, 'w') as f:
    f.write('''import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers

# Create a simple model with one dense layer
model = keras.Sequential([
    layers.Dense(10, activation='relu', input_shape=(784,))  # Example: 10 neurons, ReLU activation
])

# Display model architecture
model.summary()

# You can compile and train the model as needed
# model.compile(optimizer='adam', loss='sparse_categorical_crossentropy', metrics=['accuracy'])
''')

print(f"Successfully created Keras model and saved to {random_filename}")