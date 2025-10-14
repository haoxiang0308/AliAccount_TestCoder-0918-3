import tensorflow as tf
import numpy as np
import os

# Disable verbose logging for cleaner output
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'
tf.get_logger().setLevel('ERROR')

def generate_data(num_samples=100):
    """Generate synthetic data for linear regression: y = 2x + 1 + noise."""
    x = np.random.randn(num_samples, 1).astype(np.float32)
    y = 2 * x + 1 + 0.1 * np.random.randn(num_samples, 1).astype(np.float32)
    return x, y

def build_model():
    """Builds and compiles a simple linear regression model."""
    model = tf.keras.Sequential([
        tf.keras.layers.Dense(units=1, input_shape=(1,))
    ])
    model.compile(optimizer='sgd', loss='mean_squared_error', metrics=['mae'])
    return model

def main():
    print("Generating data...")
    x_train, y_train = generate_data(1000)
    x_test, y_test = generate_data(200)

    print("Building model...")
    model = build_model()

    print("Training model...")
    history = model.fit(x_train, y_train, epochs=50, verbose=0)

    print("Evaluating model...")
    test_loss, test_mae = model.evaluate(x_test, y_test, verbose=0)
    print(f"Test Loss (MSE): {test_loss:.4f}")
    print(f"Test MAE: {test_mae:.4f}")

    print("Sample Predictions:")
    sample_x = np.array([[0.5], [1.0], [-0.5]], dtype=np.float32)
    predictions = model.predict(sample_x, verbose=0)
    for i in range(len(sample_x)):
        print(f"  x={sample_x[i][0]:.2f} -> y_pred={predictions[i][0]:.2f}")

    # The true relationship is y = 2x + 1
    print("\nTrue relationship is y = 2x + 1")
    print("Learned weights should be close to [2.0] and bias close to [1.0]")
    weights, biases = model.layers[0].get_weights()
    print(f"Learned weight: {weights[0][0]:.2f}, Learned bias: {biases[0]:.2f}")

if __name__ == "__main__":
    main()
