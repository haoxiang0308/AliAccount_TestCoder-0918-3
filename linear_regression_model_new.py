import tensorflow as tf
import numpy as np
import random
import os

# Set random seed for reproducibility
random.seed(42)
np.random.seed(42)
tf.random.set_seed(42)

# Generate random filename
def generate_random_filename():
    # Create a random string for the filename
    chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
    filename = ''.join(random.choice(chars) for _ in range(10)) + '.py'
    return filename

# Generate synthetic data for linear regression
def generate_data(num_samples=100):
    # Create random x values
    X = np.random.randn(num_samples, 1).astype(np.float32)
    # Create y = 2*x + 1 + noise
    y = 2 * X + 1 + 0.1 * np.random.randn(num_samples, 1).astype(np.float32)
    return X, y

# Build the linear regression model
def build_model():
    model = tf.keras.Sequential([
        tf.keras.layers.Dense(1, input_shape=(1,), activation='linear')
    ])
    
    model.compile(
        optimizer='adam',
        loss='mean_squared_error',
        metrics=['mae']
    )
    
    return model

# Main execution
if __name__ == "__main__":
    # Generate data
    X_train, y_train = generate_data(200)  # Reduced from 1000 to 200
    X_test, y_test = generate_data(50)     # Reduced from 200 to 50
    
    # Build model
    model = build_model()
    
    # Print model summary
    print("Model Summary:")
    model.summary()
    
    # Train the model
    print("\nTraining the model...")
    history = model.fit(
        X_train, y_train,
        epochs=10,  # Reduced from 50 to 10 for faster execution
        batch_size=32,
        validation_data=(X_test, y_test),
        verbose=1
    )
    
    # Evaluate the model
    print("\nEvaluating the model...")
    test_loss, test_mae = model.evaluate(X_test, y_test, verbose=0)
    print(f"Test Loss (MSE): {test_loss}")
    print(f"Test MAE: {test_mae}")
    
    # Make predictions
    sample_predictions = model.predict(X_test[:5])
    print(f"\nSample predictions vs actual values:")
    for i in range(5):
        print(f"X: {X_test[i][0]:.3f}, Predicted: {sample_predictions[i][0]:.3f}, Actual: {y_test[i][0]:.3f}")
    
    # Generate a random filename for the script
    random_filename = generate_random_filename()
    
    # Save this script with the random filename
    script_content = '''import tensorflow as tf
import numpy as np
import random
import os

# Set random seed for reproducibility
random.seed(42)
np.random.seed(42)
tf.random.set_seed(42)

# Generate synthetic data for linear regression
def generate_data(num_samples=100):
    # Create random x values
    X = np.random.randn(num_samples, 1).astype(np.float32)
    # Create y = 2*x + 1 + noise
    y = 2 * X + 1 + 0.1 * np.random.randn(num_samples, 1).astype(np.float32)
    return X, y

# Build the linear regression model
def build_model():
    model = tf.keras.Sequential([
        tf.keras.layers.Dense(1, input_shape=(1,), activation=''linear'')
    ])
    
    model.compile(
        optimizer=''adam'',
        loss=''mean_squared_error'',
        metrics=[''mae'']
    )
    
    return model

# Main execution
if __name__ == "__main__":
    # Generate data
    X_train, y_train = generate_data(200)  # Reduced from 1000 to 200
    X_test, y_test = generate_data(50)     # Reduced from 200 to 50
    
    # Build model
    model = build_model()
    
    # Print model summary
    print("Model Summary:")
    model.summary()
    
    # Train the model
    print("\\nTraining the model...")
    history = model.fit(
        X_train, y_train,
        epochs=10,  # Reduced from 50 to 10 for faster execution
        batch_size=32,
        validation_data=(X_test, y_test),
        verbose=1
    )
    
    # Evaluate the model
    print("\\nEvaluating the model...")
    test_loss, test_mae = model.evaluate(X_test, y_test, verbose=0)
    print(f"Test Loss (MSE): {test_loss}")
    print(f"Test MAE: {test_mae}")
    
    # Make predictions
    sample_predictions = model.predict(X_test[:5])
    print(f"\\nSample predictions vs actual values:")
    for i in range(5):
        print(f"X: {X_test[i][0]:.3f}, Predicted: {sample_predictions[i][0]:.3f}, Actual: {y_test[i][0]:.3f}")
'''
    
    # Write the script content to the randomly named file
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"\nScript saved as: {random_filename}")
    
    # Show the actual equation learned by the model
    weights, bias = model.layers[0].get_weights()
    print(f"\nLearned equation: y = {weights[0][0]:.3f} * x + {bias[0]:.3f}")
    print(f"Actual equation: y = 2.000 * x + 1.000")