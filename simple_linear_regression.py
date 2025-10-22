import tensorflow as tf
import numpy as np
import random
import string

# Generate random filename
def generate_random_filename():
    # Create a random string for the filename
    chars = string.ascii_letters + string.digits
    filename = ''.join(random.choice(chars) for _ in range(12)) + '.py'
    return filename

# Generate very small synthetic data for linear regression
def generate_data(num_samples=20):
    # Create random x values
    X = np.random.randn(num_samples, 1).astype(np.float32)
    # Create y = 2*x + 1 + small noise
    y = 2 * X + 1 + 0.05 * np.random.randn(num_samples, 1).astype(np.float32)
    return X, y

# Build the linear regression model
def build_model():
    model = tf.keras.Sequential([
        tf.keras.layers.Dense(1, input_shape=(1,), activation='linear')
    ])
    
    model.compile(
        optimizer='sgd',  # Using simpler optimizer
        loss='mean_squared_error',
        metrics=['mae']
    )
    
    return model

# Main execution
if __name__ == "__main__":
    # Generate very small data
    X_train, y_train = generate_data(20)  # Very small dataset
    X_test, y_test = generate_data(10)    # Very small test set
    
    # Build model
    model = build_model()
    
    # Print model summary
    print("Model Summary:")
    model.summary()
    
    # Train the model for just a few epochs
    print("\nTraining the model...")
    history = model.fit(
        X_train, y_train,
        epochs=5,  # Very few epochs
        batch_size=10,  # Larger batch relative to data size
        verbose=1
    )
    
    # Evaluate the model
    print("\nEvaluating the model...")
    test_loss, test_mae = model.evaluate(X_test, y_test, verbose=0)
    print(f"Test Loss (MSE): {test_loss:.4f}")
    print(f"Test MAE: {test_mae:.4f}")
    
    # Make predictions
    sample_predictions = model.predict(X_test[:3])
    print(f"\nSample predictions vs actual values:")
    for i in range(3):
        print(f"X: {X_test[i][0]:.3f}, Predicted: {sample_predictions[i][0]:.3f}, Actual: {y_test[i][0]:.3f}")
    
    # Generate a random filename for the script
    random_filename = generate_random_filename()
    
    # Save this script with the random filename
    script_content = '''import tensorflow as tf
import numpy as np
import random
import string

# Generate random filename
def generate_random_filename():
    # Create a random string for the filename
    chars = string.ascii_letters + string.digits
    filename = ''.join(random.choice(chars) for _ in range(12)) + '.py'
    return filename

# Generate very small synthetic data for linear regression
def generate_data(num_samples=20):
    # Create random x values
    X = np.random.randn(num_samples, 1).astype(np.float32)
    # Create y = 2*x + 1 + small noise
    y = 2 * X + 1 + 0.05 * np.random.randn(num_samples, 1).astype(np.float32)
    return X, y

# Build the linear regression model
def build_model():
    model = tf.keras.Sequential([
        tf.keras.layers.Dense(1, input_shape=(1,), activation=''linear'')
    ])
    
    model.compile(
        optimizer=''sgd'',  # Using simpler optimizer
        loss=''mean_squared_error'',
        metrics=[''mae'']
    )
    
    return model

# Main execution
if __name__ == "__main__":
    # Generate very small data
    X_train, y_train = generate_data(20)  # Very small dataset
    X_test, y_test = generate_data(10)    # Very small test set
    
    # Build model
    model = build_model()
    
    # Print model summary
    print("Model Summary:")
    model.summary()
    
    # Train the model for just a few epochs
    print("\\nTraining the model...")
    history = model.fit(
        X_train, y_train,
        epochs=5,  # Very few epochs
        batch_size=10,  # Larger batch relative to data size
        verbose=1
    )
    
    # Evaluate the model
    print("\\nEvaluating the model...")
    test_loss, test_mae = model.evaluate(X_test, y_test, verbose=0)
    print(f"Test Loss (MSE): {test_loss:.4f}")
    print(f"Test MAE: {test_mae:.4f}")
    
    # Make predictions
    sample_predictions = model.predict(X_test[:3])
    print(f"\\nSample predictions vs actual values:")
    for i in range(3):
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