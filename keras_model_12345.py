import tensorflow as tf

# Create a simple Sequential model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(1, input_shape=(1,))  # Single dense layer with 1 input and 1 output
])

# Print the model summary to verify its structure
model.summary()

# Optionally, you can save the model in Keras format
# model.save('my_model.keras')