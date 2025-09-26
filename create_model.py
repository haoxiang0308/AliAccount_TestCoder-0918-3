import tensorflow as tf
from keras import layers, models

# Define the model
model = models.Sequential([
    layers.Dense(1, activation='linear', input_shape=(1,))
])

# Display the model architecture
model.summary()

# Save the model definition to a Python file
model.save('random_model.h5')

# Create a Python file with the model code
with open('keras_model_definition.py', 'w') as f:
    f.write("""
import tensorflow as tf
from keras import layers, models

# Define the model
model = models.Sequential([
    layers.Dense(1, activation='linear', input_shape=(1,))
])

# Display the model architecture
model.summary()
""")
