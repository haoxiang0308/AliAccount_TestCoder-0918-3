import keras
from keras import layers

# Define the model
model = keras.Sequential([
    layers.Dense(10, activation='relu', input_shape=(784,))  # Example: 10 neurons, ReLU activation, input shape (784,)
])

# Display the model architecture
model.summary()

# Save the model (optional, can be in SavedModel format or HDF5)
# model.save('my_model.keras') # Recommended modern format
# model.save('my_model.h5') # HDF5 format