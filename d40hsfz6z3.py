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
    # Create a simple linear model: y = wx + b
    model = tf.keras.Sequential([
        tf.keras.layers.Dense(1, input_shape=(1,), activation='linear')
    ])
    
    # Compile the model
    model.compile(
        optimizer='adam',
        loss='mean_squared_error',
        metrics=['mae']
    )
    
    return model

def generate_sample_data(num_samples=100):
    """
    Generate sample data for linear regression: y = 2x + 1 + noise
    """
    X = np.random.randn(num_samples, 1).astype(np.float32)
    y = 2 * X + 1 + 0.1 * np.random.randn(num_samples, 1).astype(np.float32)
    
    return X, y

def main():
    print("Creating linear regression model...")
    
    # Generate sample data
    X_train, y_train = generate_sample_data(200)
    X_test, y_test = generate_sample_data(50)
    
    # Create the model
    model = create_linear_regression_model()
    
    # Print model summary
    print("\nModel Summary:")
    model.summary()
    
    # Train the model
    print("\nTraining the model...")
    history = model.fit(
        X_train, y_train,
        epochs=50,
        batch_size=32,
        validation_data=(X_test, y_test),
        verbose=1
    )
    
    # Evaluate the model
    print("\nEvaluating the model...")
    test_loss, test_mae = model.evaluate(X_test, y_test, verbose=0)
    print(f"Test Loss (MSE): {test_loss:.4f}")
    print(f"Test MAE: {test_mae:.4f}")
    
    # Make predictions
    sample_prediction = model.predict(X_test[:5])
    print(f"\nSample Predictions vs Actual:")
    for i in range(5):
        print(f"X: {X_test[i][0]:.3f}, Predicted: {sample_prediction[i][0]:.3f}, Actual: {y_test[i][0]:.3f}")
    
    # Save the model
    model.save('linear_regression_trained_model')
    print("\nModel saved successfully as 'linear_regression_trained_model'")

if __name__ == "__main__":
    main()