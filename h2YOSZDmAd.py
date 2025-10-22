import tensorflow as tf
import numpy as np
import random
import string

# Generate random filename
def generate_random_filename():
    # Create a random string for the filename
    chars = string.ascii_letters + string.digits
    filename = ''.join(random.choice(chars) for _ in range(10)) + '.py'
    return filename

# Build the linear regression model
def build_model():
    model = tf.keras.Sequential([
        tf.keras.layers.Dense(1, input_shape=(1,), activation=''linear'')
    ])
    
    model.compile(
        optimizer=''sgd'',
        loss=''mean_squared_error'',
        metrics=[''mae'']
    )
    
    return model

# Main execution
if __name__ == "__main__":
    print("Building a simple linear regression model...")
    
    # Build model
    model = build_model()
    
    # Print model summary
    print("Model Summary:")
    model.summary()
