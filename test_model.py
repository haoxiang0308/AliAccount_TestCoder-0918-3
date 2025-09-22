import numpy as np
import joblib

# Load the saved model
model = joblib.load('linear_regression_model.pkl')

# Test the model with a new data point
test_x = np.array([[5.0]])
prediction = model.predict(test_x)

print(f"Input: {test_x[0][0]}")
print(f"Predicted output: {prediction[0]:.4f}")

# The expected value would be approximately 2*5 + 1 = 11
expected = 2 * test_x[0][0] + 1
print(f"Expected output (2*x + 1): {expected}")
print(f"Difference: {abs(prediction[0] - expected):.4f}")