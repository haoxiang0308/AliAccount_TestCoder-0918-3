import tensorflow as tf
import numpy as np
import random

# Set random seed for reproducibility
random.seed(42)
np.random.seed(42)
tf.random.set_seed(42)

def create_linear_regression_model():
    """
    Creates a simple linear regression model using TensorFlow
    """
    # Generate sample data for linear regression (y = 2x + 1 + noise)
    X_train = np.random.rand(100, 1).astype(np.float32)
    y_train = 2 * X_train + 1 + 0.1 * np.random.randn(100, 1).astype(np.float32)
    
    # Create a simple model: one input, one output
    model = tf.keras.Sequential([
        tf.keras.layers.Dense(1, input_shape=(1,))
    ])
    
    # Compile the model
    model.compile(
        optimizer='adam',
        loss='mean_squared_error',
        metrics=['mae']
    )
    
    # Train the model
    print("Training the model...")
    history = model.fit(X_train, y_train, epochs=50, verbose=0)
    
    # Print final loss
    print(f"Final training loss: {history.history['loss'][-1]:.4f}")
    
    # Test the model with some sample data
    X_test = np.array([[0.2], [0.5], [0.8]], dtype=np.float32)
    predictions = model.predict(X_test)
    print("\nSample predictions:")
    for i, (x, pred) in enumerate(zip(X_test, predictions)):
        print(f"Input: {x[0]:.2f}, Predicted: {pred[0]:.2f}, Expected (y=2x+1): {2*x[0]+1:.2f}")
    
    return model

def main():
    # Build and train the model
    model = create_linear_regression_model()
    
    # Save the model
    model.save('linear_regression_model.h5')
    print("\nModel saved as 'linear_regression_model.h5'")
    
    # Also print model summary
    print("\nModel Summary:")
    model.summary()

if __name__ == "__main__":
    main()