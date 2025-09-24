import tensorflow as tf
from tensorflow import keras

# Create a Sequential model
model = keras.Sequential([
    # Add a Dense layer with 10 units and ReLU activation
    keras.layers.Dense(10, activation='relu', input_shape=(None,))  # Input shape can be flexible
])

# Print the model summary
model.summary()

# Optionally, you can compile the model
# model.compile(optimizer='adam', loss='sparse_categorical_crossentropy', metrics=['accuracy'])

# Save the model (uncomment the line below if you want to save the entire model, not just the code)
# model.save('my_model.h5')