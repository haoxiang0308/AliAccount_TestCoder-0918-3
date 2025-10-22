import tensorflow as tf
import numpy as np
import random
import os

# Set random seed for reproducibility
random.seed(42)
np.random.seed(42)
tf.random.set_seed(42)

def create_linear_regression_model():
    """
    Creates a simple linear regression model using TensorFlow
    """
    # Generate sample data
    X = np.random.randn(100, 1).astype(np.float32)
    y = 2 * X + 1 + 0.1 * np.random.randn(100, 1).astype(np.float32)  # y = 2x + 1 + noise
    
    # Create the model
    model = tf.keras.Sequential([
        tf.keras.layers.Dense(units=1, input_shape=(1,))
    ])
    
    # Compile the model
    model.compile(
        optimizer='sgd',
        loss='mean_squared_error',
        metrics=['mae']
    )
    
    # Train the model
    print("Training the model...")
    history = model.fit(X, y, epochs=100, verbose=0)
    
    # Print final loss
    print(f"Final loss: {history.history['loss'][-1]:.4f}")
    
    # Test the model
    test_x = np.array([[0.5], [1.0], [-0.5]], dtype=np.float32)
    predictions = model.predict(test_x)
    print(f"Test predictions: {predictions.flatten()}")
    
    # Save the model
    model.save('linear_regression_trained_model.h5')
    print("Model saved as 'linear_regression_trained_model.h5'")
    
    return model

if __name__ == "__main__":
    model = create_linear_regression_model()